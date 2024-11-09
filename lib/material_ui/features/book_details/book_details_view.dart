import 'dart:io';
import 'package:audiobookly/domain/track_details/track_details_notifier.dart';
import 'package:audiobookly/domain/track_details/track_details_state.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/domain/book_details/book_details_notifier.dart';
import 'package:audiobookly/domain/book_details/book_details_state.dart';
import 'package:audiobookly/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:expandable/expandable.dart';
import 'package:audiobookly/utils/utils.dart';

String getListenText(double progress, Book book) {
  final timeLeft = Utils.getTimeLeft(book);
  if (book.read || (timeLeft.isEmpty && progress > 0)) {
    return 'Listen Again';
  } else if (progress > 0) {
    return "Listen ($timeLeft left)";
  } else {
    return "Start Listening";
  }
}

class BookDetailsView extends HookConsumerWidget {
  final String mediaId;
  const BookDetailsView({required this.mediaId, super.key});

  Widget _loadingIndicator() =>
      const Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher = GlobalKey();
    final bookDetails = ref.watch(bookDetailsStateProvider(mediaId).notifier);
    final tracksDetails =
        ref.watch(trackDetailsStateProvider(mediaId).notifier);
    final state = ref.watch(bookDetailsStateProvider(mediaId));
    final downloadService = ref.watch(downloadServiceProvider);
    final playbackController = GetIt.I<PlaybackController>();
    final group = AutoSizeGroup();
    final expandableController = useState(ExpandableController());

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          key: refresher,
          onRefresh: () async {
            await bookDetails.refreshForDownloads();
            await tracksDetails.refreshForDownloads();
          },
          child: Builder(builder: (context) {
            switch (state) {
              case BookDetailsStateInitial():
                refresher.currentState?.show();
                return CustomScrollView();
              case BookDetailsStateLoading():
                return _loadingIndicator();
              case BookDetailsStateError(:final message):
                return Center(child: Text('Something went wrong $message'));
              case BookDetailsStateLoaded(:final book, :final tracks):
                return CustomScrollView(
                  key: const PageStorageKey('book-details'),
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: true,
                      backgroundColor: Theme.of(context).canvasColor,
                      centerTitle: true,
                      floating: true,
                      pinned: true,
                      title: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(book!.title),
                      ),
                      actions: [
                        // if (kIsWeb || (!Platform.isIOS && !Platform.isAndroid))
                        //   IconButton(
                        //     onPressed: () =>
                        //         bookDetails.refreshKey.currentState?.show(),
                        //     icon: const Icon(Icons.refresh),
                        //   ),
                        switch (book.downloadStatus) {
                          DownloadStatus.succeeded => IconButton(
                              onPressed: () async {
                                downloadService?.cancelBookDownload(
                                  book,
                                );
                              },
                              icon: const Icon(Icons.delete_forever),
                            ),
                          DownloadStatus.downloading => Stack(
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
                                        downloadService
                                            ?.cancelBookDownload(book);
                                      },
                                      icon: const Icon(Icons.cancel_rounded)),
                                ),
                              ],
                            ),
                          _ => IconButton(
                              icon: const Icon(Icons.file_download_outlined),
                              onPressed: () async {
                                downloadService?.downloadBook(
                                  book,
                                  tracks!,
                                );
                              },
                            ),
                        },
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
                              height: 300,
                              constraints: const BoxConstraints(maxWidth: 300),
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
                                  if (Utils.getProgress(book: book) > 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: LinearProgressIndicator(
                                              minHeight: 8,
                                              value: book.progress,
                                              color: Colors.deepPurple,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.2),
                                            ),
                                          ),
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
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                            left: 32.0,
                            right: 32.0,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 250),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                playbackController.playFromId(book.id);
                              },
                              child: Text(
                                getListenText(book.progress, book),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 32.0,
                            right: 32.0,
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 250),
                            child: ElevatedButton(
                              onPressed: () {
                                if (book.read) {
                                  bookDetails.markUnplayed();
                                } else {
                                  bookDetails.markPlayed();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                "Mark as ${book.read ? 'unread' : 'read'}",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (book.series != null && book.series!.isNotEmpty)
                              CommaLinkList(
                                items: book.series!,
                                onTap: (series) => context.push(
                                  '/series/${series.id}',
                                  extra: series.name,
                                ),
                                getText: (series) =>
                                    '${series.name} #${series.position}',
                              ),
                            if (book.authors != null &&
                                book.authors!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CommaLinkList(
                                  prefixText: 'Written by',
                                  items: book.authors!,
                                  onTap: (author) => context.push(
                                    '/authors/${author.id}',
                                    extra: author.name,
                                  ),
                                  getText: (author) => author.name,
                                ),
                              ),
                            if (book.authors == null || book.authors!.isEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Written by ${book.author}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            if (book.narrators?.isNotEmpty == true)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommaLinkList(
                                  prefixText: 'Narrated by',
                                  items: book.narrators!,
                                  onTap: (name) => context.push(
                                    '/narrators/$name',
                                    extra: name,
                                  ),
                                  getText: (name) => name,
                                ),
                              ),
                            if (book.narrators == null ||
                                book.narrators!.isEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CommaLinkList(
                                  prefixText: 'Narrated by',
                                  items: book.narrator.split(', '),
                                  onTap: (name) => context.push(
                                    '/narrators/$name',
                                    extra: name,
                                  ),
                                  getText: (name) => name,
                                ),
                              ),
                            Text(
                              (book.duration) != Duration.zero
                                  ? book.duration.timeLeft
                                  : Utils.friendlyDurationFromTracks(tracks!),
                            ),
                            Divider(
                              color: Colors.grey.shade700,
                            ),
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
                            controller: expandableController.value,
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
                    Consumer(
                      builder: (context, ref, child) {
                        final trackState = ref.watch(
                          trackDetailsStateProvider(mediaId),
                        );
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
                      },
                    ),
                  ],
                );
            }
          }),
        ),
      ),
    );
  }
}

class CommaLinkList<T> extends StatelessWidget {
  const CommaLinkList({
    super.key,
    required this.items,
    required this.onTap,
    required this.getText,
    this.prefixText,
  });
  final List<T> items;
  final Function(T) onTap;
  final String Function(T) getText;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: prefixText != null ? '$prefixText ' : '',
        style: DefaultTextStyle.of(context).style,
        children: [
          for (final (index, item) in items.indexed) ...[
            TextSpan(
                text: getText(item),
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTap(item);
                  }),
            if (index < items.length - 1)
              const TextSpan(
                text: ', ',
              ),
          ],
        ],
      ),
    );
  }
}
