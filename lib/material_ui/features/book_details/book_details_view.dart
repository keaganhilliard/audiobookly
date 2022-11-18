import 'dart:io';
import 'package:audiobookly/domain/track_details/track_details_notifier.dart';
import 'package:audiobookly/domain/track_details/track_details_state.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/domain/book_details/book_details_notifier.dart';
import 'package:audiobookly/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';

class BookDetailsView extends HookConsumerWidget {
  final String mediaId;
  const BookDetailsView({required this.mediaId, Key? key}) : super(key: key);

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetails = ref.watch(bookDetailsStateProvider(mediaId).notifier);
    final tracksDetails =
        ref.watch(trackDetailsStateProvider(mediaId).notifier);
    final state = ref.watch(bookDetailsStateProvider(mediaId));
    final downloadService = ref.watch(downloadServiceProvider);
    final playbackController = GetIt.I<PlaybackController>();
    // final navigationService = ref.watch(navigationServiceProvider);
    final group = AutoSizeGroup();
    final refreshState = GlobalKey<RefreshIndicatorState>();

    return state.when(
      initial: _loadingIndicator,
      loading: _loadingIndicator,
      error: (message) => Center(child: Text('Something went wrong $message')),
      loaded: (book, tracks) {
        final progress = Utils.getProgress(book: book);

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
                      child: Text(book!.title),
                    ),
                    actions: [
                      if (kIsWeb || (!Platform.isIOS && !Platform.isAndroid))
                        IconButton(
                          onPressed: () => refreshState.currentState?.show(),
                          icon: const Icon(Icons.refresh),
                        ),
                      if (book.downloadStatus == DownloadStatus.succeeded ||
                          (book.downloadStatus != DownloadStatus.downloading &&
                              (tracks?.any((track) => track.isDownloaded) ??
                                  false)))
                        IconButton(
                          onPressed: () async {
                            downloadService?.deleteDownload(
                              book,
                            );
                            bookDetails.refreshForDownloads();
                          },
                          icon: const Icon(Icons.delete_forever),
                        ),
                      if (book.downloadStatus == DownloadStatus.downloading)
                        Stack(
                          children: [
                            if (!kIsWeb &&
                                !Platform.isWindows &&
                                !Platform.isLinux &&
                                !Platform.isMacOS)
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
                            if (kIsWeb ||
                                Platform.isWindows ||
                                Platform.isLinux ||
                                Platform.isMacOS)
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
                                    downloadService?.cancelBookDownload(book);
                                  },
                                  icon: const Icon(Icons.cancel_rounded)),
                            ),
                          ],
                        ),
                      if (book.downloadStatus == DownloadStatus.none ||
                          book.downloadStatus == DownloadStatus.none)
                        IconButton(
                          icon: const Icon(Icons.file_download_outlined),
                          onPressed: () async {
                            downloadService?.downloadBook(
                              book,
                              tracks!,
                            );
                            // bookDetails.refreshForDownloads();
                          },
                        ),
                      if (book.read)
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
                                  imageUrl: book.largeArtPath ?? book.artPath,
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
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            onPressed: () {
                              playbackController.playFromId(book.id);
                              // navigationService.pushNamed(
                              //   Routes.Player,
                              //   arguments: item,
                              // );
                            },
                            child: const Icon(Icons.play_arrow),
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
                          //   item!.title,
                          //   maxLines: 3,
                          //   style: TextStyle(fontSize: 20.0),
                          //   textAlign: TextAlign.center,
                          // ),
                          // Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'By ${book.author}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (book.narrator != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Narrated by ${book.narrator}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          Text((book.duration) != Duration.zero
                              ? Utils.friendlyDuration(book.duration)
                              : Utils.friendlyDurationFromTracks(tracks!)),
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
                              Expandable(
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
                                        child: Text('More'),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  Consumer(builder: (context, ref, child) {
                    final trackState =
                        ref.watch(trackDetailsStateProvider(mediaId));
                    if (trackState is TrackDetailsStateLoaded &&
                        (trackState.tracks?.isNotEmpty ?? false)) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final track = trackState.tracks![index];
                            return Stack(
                              children: [
                                ListTile(
                                  leading: track.isDownloaded
                                      ? const Icon(Icons.offline_pin)
                                      : null,
                                  onTap: () async {
                                    await playbackController
                                        .playFromId(book.id);
                                    await playbackController
                                        .skipToQueueItem(index);
                                  },
                                  title: AutoSizeText(
                                    track.title,
                                    group: group,
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
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
                                        backgroundColor:
                                            Theme.of(context).cardColor,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                          childCount: trackState.tracks!.length,
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
      },
    );
  }
}
