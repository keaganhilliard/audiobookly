import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/features/book_details/book_details_notifier.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';

class BookDetailsView extends HookWidget {
  final String? mediaId;
  BookDetailsView({this.mediaId});

  @override
  Widget build(BuildContext context) {
    // final stateProvider = useProvider(bookDetailsStateProvider(mediaId));
    final bookDetails =
        useProvider(bookDetailsStateProvider(mediaId!).notifier);
    final state = useProvider(bookDetailsStateProvider(mediaId!));
    // final downloadService = useProvider(downloadServiceProvider);
    final playbackController = useProvider(playbackControllerProvider);
    final navigationService = useProvider(navigationServiceProvider);

    if (state is BookDetailsStateLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (state is BookDetailsStateLoaded) {
      return Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              bookDetails.getBook();
            },
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).canvasColor,
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          // top: 8.0,
                          right: 8.0,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl: state.book!.artUri.toString(),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            FloatingActionButton(
                                child: Icon(Icons.play_arrow),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                onPressed: () {
                                  playbackController.playFromId(state.book!.id);
                                  navigationService.pushNamed(
                                    Routes.Player,
                                    arguments: state.book,
                                  );
                                }),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.book!.title,
                                maxLines: 3,
                              ),
                              Divider(),
                              Text('By ${state.book!.artist}'),
                              Text('Narrated by ${state.book!.narrator ?? ''}'),
                              Text(state.book!.duration != null
                                  ? Utils.friendlyDuration(
                                      state.book!.duration!)
                                  : Utils.friendlyDurationFromItems(
                                      state.chapters!)),
                              Divider(),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.file_download),
                                    onPressed: () async {
                                      // for (final chapter in state.chapters) {
                                      //   await downloadService
                                      //       .downloadItem(chapter);
                                      // }
                                    },
                                  ),
                                  if (state.book!.played)
                                    IconButton(
                                      color: Colors.deepPurple,
                                      icon: Icon(Icons.check),
                                      onPressed: () async {
                                        await bookDetails.markUnplayed();
                                      },
                                    )
                                  else
                                    IconButton(
                                      icon: Icon(Icons.check),
                                      onPressed: () async {
                                        await bookDetails.markPlayed();
                                      },
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(),
                if (state.book!.displayDescription?.isNotEmpty ?? false)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ExpandableNotifier(
                        child: Column(
                          children: [
                            Expandable(
                              collapsed: Column(
                                children: [
                                  Text(
                                    state.book!.displayDescription ?? '',
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ExpandableButton(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text('More'),
                                    ),
                                  )
                                ],
                              ),
                              expanded: Column(
                                children: [
                                  Text(
                                    state.book!.displayDescription ?? '',
                                    softWrap: true,
                                  ),
                                  ExpandableButton(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 8.0,
                                      ),
                                      child: Text('Less'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (state.chapters!.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          onTap: () async {
                            await playbackController.playFromId(state.book!.id);
                            await playbackController.skipToQueueItem(index);
                          },
                          title: Text(
                            state.chapters![index].title,
                          ),
                          trailing: Text(
                            RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                                    .firstMatch(
                                        "${state.chapters![index].duration}")
                                    ?.group(1) ??
                                '',
                          ),
                        );
                      },
                      childCount: state.chapters!.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return Center(
      child: Text('Something went wrong $state'),
    );
  }
}
