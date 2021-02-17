import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/book_details/book_details_notifier.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/book_details/book_details_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/core/utils/utils.dart';

class BookDetailsView extends HookWidget {
  final String mediaId;
  BookDetailsView({this.mediaId});

  @override
  Widget build(BuildContext context) {
    // final stateProvider = useProvider(bookDetailsStateProvider(mediaId));
    final state = useProvider(bookDetailsStateProvider(mediaId).state);

    if (state is BookDetailsStateLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (state is BookDetailsStateLoaded) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
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
                                imageUrl: state.book.artUri,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            FloatingActionButton(
                                child: Icon(Icons.play_arrow),
                                onPressed: () {
                                  PlaybackController()
                                      .playFromId(state.book.id);
                                  NavigationService().pushNamed(Routes.Book,
                                      arguments: state.book);
                                }),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.book.title),
                          Text('By ${state.book.artist}'),
                          Text('Narrated by ${state.book.narrator ?? ''}'),
                          Text(Utils.friendlyDuration(state.book.duration)),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.file_download),
                                onPressed: () {},
                              ),
                              if (state.book.played)
                                IconButton(
                                  color: Colors.green,
                                  icon: Icon(Icons.check),
                                  onPressed: () {},
                                )
                              else
                                IconButton(
                                  icon: Icon(Icons.check),
                                  onPressed: () {},
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (state.book.displayDescription?.isNotEmpty ?? false)
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
                                  state.book.displayDescription ?? '',
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
                                  state.book.displayDescription ?? '',
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
              if (state.chapters.isNotEmpty)
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text(
                        state.chapters[index].title,
                      ),
                    );
                  },
                  childCount: state.chapters.length,
                ))
            ],
          ),
        ),
      );
    }
    return Center(
      child: Text('Something went wrong $state'),
    );
  }
}
