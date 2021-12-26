import 'dart:io';

import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/features/book_details/track_details/track_details_notifier.dart';
import 'package:audiobookly/features/book_details/track_details/track_details_state.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/features/book_details/book_details_notifier.dart';
import 'package:audiobookly/features/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_html/flutter_html.dart';

class BookDetailsView extends HookConsumerWidget {
  final String mediaId;
  const BookDetailsView({required this.mediaId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetails = ref.watch(bookDetailsStateProvider(mediaId).notifier);
    final tracksDetails =
        ref.watch(trackDetailsStateProvider(mediaId).notifier);
    final state = ref.watch(bookDetailsStateProvider(mediaId));
    final downloadService = ref.watch(downloadServiceProvider);
    final playbackController = ref.watch(playbackControllerProvider);
    final navigationService = ref.watch(navigationServiceProvider);
    final group = AutoSizeGroup();
    final refreshState = GlobalKey<RefreshIndicatorState>();

    if (state is BookDetailsStateLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is BookDetailsStateLoaded) {
      final progress = Utils.getProgess(item: state.book);

      return Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            key: refreshState,
            onRefresh: () async {
              await bookDetails.refreshForDownloads();
              await tracksDetails.refreshForDownloads();
            },
            child: CustomScrollView(
              key: const PageStorageKey('book-details'),
              physics: const AlwaysScrollableScrollPhysics(),
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
                    if (kIsWeb || (!Platform.isIOS && !Platform.isAndroid))
                      IconButton(
                        onPressed: () => refreshState.currentState?.show(),
                        icon: const Icon(Icons.refresh),
                      ),
                    if (state.book!.cached ||
                        (!state.book!.downloading &&
                            (state.chapters?.any((chapter) => chapter.cached) ??
                                false)))
                      IconButton(
                        onPressed: () async {
                          downloadService?.deleteDownload(
                            state.book!,
                          );
                          bookDetails.refreshForDownloads();
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                    if (state.book!.downloading)
                      Stack(
                        children: [
                          if (!kIsWeb &&
                              !Platform.isWindows &&
                              !Platform.isLinux)
                            const Positioned(
                              left: 9.0,
                              top: 13.0,
                              child: Center(
                                child: SizedBox(
                                  height: 30.0,
                                  width: 30.0,
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          if (kIsWeb || Platform.isWindows || Platform.isLinux)
                            const Positioned(
                              left: 5.0,
                              top: 13.0,
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
                                icon: const Icon(Icons.cancel_rounded)),
                          ),
                        ],
                      ),
                    if (!state.book!.downloading && !state.book!.cached)
                      IconButton(
                        icon: const Icon(Icons.file_download_outlined),
                        onPressed: () async {
                          downloadService?.downloadBook(
                            state.book!,
                            state.chapters!,
                          );
                          bookDetails.refreshForDownloads();
                        },
                      ),
                    if (state.book?.played ?? false)
                      IconButton(
                        color: Colors.deepPurple,
                        icon: const Icon(Icons.check),
                        onPressed: () async {
                          await bookDetails.markUnplayed();
                        },
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.check),
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
                          constraints: const BoxConstraints(maxWidth: 250),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    state.book?.largeThumbnail?.toString() ??
                                        state.book?.artUri.toString() ??
                                        '',
                                fit: BoxFit.scaleDown,
                                errorWidget: (context, string, stack) {
                                  return const Icon(Icons.book);
                                },
                              ),
                              if (progress > 0)
                                Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: LinearProgressIndicator(
                                        minHeight: 6,
                                        value: progress,
                                        backgroundColor: Colors.transparent,
                                        // Theme.of(context).cardTheme.color,
                                      )),
                                )
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          child: const Icon(Icons.play_arrow),
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            playbackController.playFromId(state.book!.id);
                            // navigationService.pushNamed(
                            //   Routes.Player,
                            //   arguments: state.book,
                            // );
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
                        if (state.book!.narrator != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Narrated by ${state.book!.narrator!}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        Text((state.book?.duration) != null
                            ? Utils.friendlyDuration(state.book!.duration!)
                            : Utils.friendlyDurationFromItems(state.chapters!)),
                        const Divider(),
                        const ButtonBar(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 0.0,
                      ),
                      child: ExpandableNotifier(
                        child: Column(
                          children: [
                            Expandable(
                              collapsed: Column(
                                children: [
                                  SizedBox(
                                    height: 45,
                                    child: Html(
                                      data:
                                          state.book!.displayDescription ?? '',
                                    ),
                                  ),
                                  ExpandableButton(
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
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
                                  Html(
                                    shrinkWrap: true,
                                    data: state.book!.displayDescription ?? '',
                                  ),
                                  ExpandableButton(
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
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
                Consumer(builder: (context, ref, child) {
                  final trackState =
                      ref.watch(trackDetailsStateProvider(mediaId));
                  if (trackState is TrackDetailsStateLoaded &&
                      (trackState.chapters?.isNotEmpty ?? false)) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final chapter = trackState.chapters![index];
                          return Stack(
                            children: [
                              ListTile(
                                leading: chapter.cached
                                    ? const Icon(Icons.offline_pin)
                                    : null,
                                onTap: () async {
                                  await playbackController
                                      .playFromId(state.book!.id);
                                  await playbackController
                                      .skipToQueueItem(index);
                                },
                                title: AutoSizeText(
                                  chapter.title,
                                  group: group,
                                  maxLines: 2,
                                ),
                                subtitle: Text(
                                  Utils.getTimeValue(chapter.duration),
                                ),
                              ),
                              if (chapter.downloadProgress != 0 &&
                                  !chapter.cached)
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: LinearProgressIndicator(
                                      minHeight: 6.0,
                                      value: chapter.downloadProgress,
                                      backgroundColor:
                                          Theme.of(context).cardColor,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                        childCount: trackState.chapters!.length,
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }),
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
