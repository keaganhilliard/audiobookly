import 'package:audiobookly/domain/track_details/track_details_notifier.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/domain/book_details/book_details_notifier.dart';
import 'package:audiobookly/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';

class BookDetailsView extends HookConsumerWidget {
  final String mediaId;
  const BookDetailsView({required this.mediaId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetails = ref.watch(bookDetailsStateProvider(mediaId).notifier);
    final state = ref.watch(bookDetailsStateProvider(mediaId));
    final downloadService = ref.watch(downloadServiceProvider);
    final playbackController = GetIt.I<PlaybackController>();

    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        state.maybeWhen(
          orElse: () => const Center(
              child: CupertinoActivityIndicator(
            radius: 40,
          )),
          error: (message) =>
              Center(child: Text('Something went wrong $message')),
          loaded: (book, tracks) {
            final progress = Utils.getProgress(book: book);

            return CupertinoPageScaffold(
              child: CustomScrollView(
                key: const PageStorageKey('book-details'),
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  CupertinoSliverNavigationBar(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    largeTitle: Center(
                      child: Text('${book!.title} Page View'),
                    ),
                    trailing: Builder(
                      builder: (context) {
                        switch (book.downloadStatus) {
                          case DownloadStatus.succeeded:
                            return CupertinoButton(
                              onPressed: () async {
                                downloadService?.deleteDownload(
                                  book,
                                );
                              },
                              child: const Icon(CupertinoIcons.delete_solid),
                            );
                          case DownloadStatus.downloading:
                            return Stack(
                              children: [
                                const Positioned(
                                  left: 13.0,
                                  top: 13.0,
                                  child: SizedBox(
                                    height: 30.0,
                                    width: 30.0,
                                    child: CircularProgressIndicator(
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    downloadService?.cancelBookDownload(book);
                                  },
                                  child: const Icon(
                                    Icons.cancel_rounded,
                                  ),
                                ),
                              ],
                            );
                          default:
                            return CupertinoButton(
                              child: const Icon(
                                  CupertinoIcons.arrow_down_circle_fill),
                              onPressed: () async {
                                downloadService?.downloadBook(
                                  book,
                                  tracks!,
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                  CupertinoSliverRefreshControl(
                    onRefresh: bookDetails.refreshForDownloads,
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
                                  imageUrl: book.largeArtPath ?? book.artPath,
                                  fit: BoxFit.scaleDown,
                                  errorWidget: (context, string, stack) {
                                    return const Icon(CupertinoIcons.book_fill);
                                  },
                                ),
                                if (progress > 0)
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: LinearProgressIndicator(
                                        minHeight: 6,
                                        value: progress,
                                        color: Colors.deepPurple,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  )
                              ],
                            ),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'By ${book.author}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (book.narrator.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Narrated by ${book.narrator}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          Text((book.duration) != Duration.zero
                              ? book.duration.timeLeft
                              : Utils.friendlyDurationFromTracks(tracks!)),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                        left: 32.0,
                        right: 32.0,
                      ),
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(500.0),
                        padding: const EdgeInsets.all(4.0),
                        onPressed: () {
                          playbackController.playFromId(book.id);
                        },
                        color: Colors.deepPurple,
                        child: Text(
                          "Listen${progress > 0 ? ' (${Utils.getTimeLeft(book)} left)' : ''}",
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                        left: 32.0,
                        right: 32.0,
                      ),
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(500.0),
                        padding: const EdgeInsets.all(4.0),
                        onPressed: () {
                          if (book.read) {
                            bookDetails.markUnplayed();
                          } else {
                            bookDetails.markPlayed();
                          }
                        },
                        color: Colors.deepPurple,
                        child: Text(
                          "Mark as ${book.read ? 'unread' : 'read'}",
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Divider(),
                  if (book.description.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 0.0,
                        ),
                        child: ExpandableNotifier(
                          child: Column(
                            children: [
                              Material(
                                textStyle: const TextStyle(color: Colors.white),
                                child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.black),
                                  child: Expandable(
                                    collapsed: Column(
                                      children: [
                                        Text(
                                          book.description,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        ExpandableButton(
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 8.0,
                                            ),
                                            child: Text('Read more'),
                                          ),
                                        )
                                      ],
                                    ),
                                    expanded: Column(
                                      children: [
                                        Text(
                                          book.description,
                                          softWrap: true,
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
                    return trackState.maybeWhen(
                      orElse: () => SliverToBoxAdapter(
                        child: Container(),
                      ),
                      loaded: (tracks, chapters) {
                        if (tracks?.isEmpty ?? true) {
                          return SliverToBoxAdapter(
                            child: Container(),
                          );
                        }
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final track = tracks[index];
                              return Stack(
                                children: [
                                  CupertinoListTile(
                                    trailing: track.isDownloaded
                                        ? const Icon(
                                            CupertinoIcons.download_circle_fill)
                                        : null,
                                    onTap: () async {
                                      await playbackController
                                          .playFromId(book.id);
                                      await playbackController
                                          .skipToQueueItem(index);
                                    },
                                    title: SizedBox(
                                      width: 290,
                                      child: Text(
                                        track.title,
                                        overflow: TextOverflow.ellipsis,
                                        // maxLines: 2,
                                      ),
                                    ),
                                    additionalInfo: Text(
                                      Utils.getTimeValue(track.duration),
                                    ),
                                  ),
                                  if (track.downloadProgress != 0 &&
                                      !track.isDownloaded)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: LinearProgressIndicator(
                                          minHeight: 6.0,
                                          value: track.downloadProgress,
                                          color: Colors.deepPurple,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                            childCount: tracks!.length,
                          ),
                        );
                      },
                    );
                  }),
                  const SliverToBoxAdapter(
                    child: BottomPadding(),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          child: const Text('Second Page'),
        )
      ],
    );
  }
}
