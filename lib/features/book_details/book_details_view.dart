import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/database/entity/book.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/features/book_details/book_details_notifier.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';

class BookDetailsView extends HookWidget {
  final String mediaId;
  BookDetailsView({required this.mediaId});

  @override
  Widget build(BuildContext context) {
    final bookDetails = useProvider(
      bookDetailsStateProvider(mediaId).notifier,
    );
    final state = useProvider(bookDetailsStateProvider(mediaId));
    final downloadService = useProvider(downloadServiceProvider);
    final playbackController = useProvider(playbackControllerProvider);
    final navigationService = useProvider(navigationServiceProvider);
    final group = AutoSizeGroup();

    if (state is BookDetailsStateLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (state is BookDetailsStateLoaded) {
      final double progress = Utils.getProgess(state.book!);
      final tracks = useStream(state.tracks);
      final dbBook = useStream(state.dbBook).data;

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
                  centerTitle: true,
                  floating: true,
                  pinned: true,
                  title: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(state.book!.title),
                  ),
                  actions: [
                    if ((dbBook?.downloadCompleted ?? false) ||
                        (!(dbBook?.downloadRequested ?? false) &&
                            (tracks.hasData && tracks.data!.length > 0)))
                      IconButton(
                        onPressed: () async {
                          downloadService?.deleteDownload(
                            state.book!,
                          );
                          bookDetails.refreshForDownloads();
                        },
                        icon: Icon(Icons.delete_forever),
                      ),
                    if ((dbBook?.downloadRequested ?? false) &&
                        !(dbBook?.downloadCompleted ?? false))
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Center(
                              child: SizedBox(
                                height: 30.0,
                                width: 30.0,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          Center(
                            child: IconButton(
                                onPressed: () {
                                  downloadService
                                      ?.cancelBookDownload(state.book!);
                                },
                                icon: Icon(Icons.cancel_rounded)),
                          ),
                        ],
                      ),
                    if (!(dbBook?.downloadRequested ?? false) &&
                        !(dbBook?.downloadCompleted ?? false))
                      IconButton(
                        icon: Icon(Icons.file_download_outlined),
                        onPressed: () async {
                          downloadService?.downloadBook(
                            state.book!,
                            state.chapters!,
                          );
                          bookDetails.refreshForDownloads();
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
                      ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: state.book!.artUri.toString(),
                                fit: BoxFit.scaleDown,
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: progress > 0
                                      ? LinearProgressIndicator(
                                          minHeight: 6,
                                          value: progress,
                                          backgroundColor:
                                              Theme.of(context).cardTheme.color,
                                        )
                                      : Container(),
                                ),
                              )
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          child: Icon(Icons.play_arrow),
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            playbackController.playItem(state.book!);
                            navigationService.pushNamed(
                              Routes.Player,
                              arguments: state.book,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(
                        //   state.book!.title,
                        //   maxLines: 3,
                        //   style: TextStyle(fontSize: 20.0),
                        //   textAlign: TextAlign.center,
                        // ),
                        // Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'By ${state.book!.artist}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Narrated by ${state.book!.narrator ?? ''}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(state.book!.duration != null
                            ? Utils.friendlyDuration(state.book!.duration!)
                            : Utils.friendlyDurationFromItems(state.chapters!)),
                        Divider(),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            // IconButton(
                            //     onPressed: () async {},
                            //     icon: Icon(Icons.person))
                          ],
                        )
                      ],
                    ),
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
                        final chapter = state.chapters![index];
                        final track = tracks.data?[chapter.id];
                        return Stack(
                          children: [
                            ListTile(
                              leading: track?.isDownloaded ?? false
                                  ? Icon(Icons.offline_pin)
                                  : null,
                              onTap: () async {
                                await playbackController
                                    .playFromId(state.book!.id);
                                await playbackController.skipToQueueItem(index);
                              },
                              title: AutoSizeText(
                                state.chapters![index].title,
                                group: group,
                                maxLines: 2,
                              ),
                              trailing: Text(
                                RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
                                        .firstMatch(
                                            "${state.chapters![index].duration}")
                                        ?.group(1) ??
                                    '',
                              ),
                            ),
                            if (track != null && !track.isDownloaded)
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: LinearProgressIndicator(
                                    minHeight: 6.0,
                                    value: track.downloadProgress,
                                    // backgroundColor:
                                    //     Theme.of(context).cardTheme.color,
                                  ),
                                ),
                              ),
                          ],
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
