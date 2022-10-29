import 'package:audiobookly/domain/track_details/track_details_notifier.dart';
import 'package:audiobookly/domain/track_details/track_details_state.dart';
import 'package:audiobookly/ios_ui/widgets/bottom_padding.dart';
import 'package:audiobookly/mac_ui/widgets/macos_icon_with_fontweight.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/domain/book_details/book_details_notifier.dart';
import 'package:audiobookly/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:macos_ui/macos_ui.dart';

class BookDetailsView extends HookConsumerWidget {
  final String mediaId;
  const BookDetailsView({required this.mediaId, Key? key}) : super(key: key);

  Widget _loadingIndicator() => const Center(
          child: CupertinoActivityIndicator(
        radius: 40,
      ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetails = ref.watch(bookDetailsStateProvider(mediaId).notifier);
    final tracksDetails =
        ref.watch(trackDetailsStateProvider(mediaId).notifier);
    final state = ref.watch(bookDetailsStateProvider(mediaId));
    final downloadService = ref.watch(downloadServiceProvider);
    final playbackController = GetIt.I<PlaybackController>();
    final mounted = useIsMounted();
    useEffect(() {
      if (mounted()) {
        print('Mounted');
        bookDetails.getDetails();
      }
    }, [mounted()]);

    return state.when(
      initial: _loadingIndicator,
      loading: _loadingIndicator,
      error: (message) => Center(child: Text('Something went wrong $message')),
      loaded: (item, chapters) {
        final progress = Utils.getProgress(item: item);

        return MacosScaffold(
          toolBar: const ToolBar(
            height: 32.0,
            // automaticallyImplyLeading: true,
            dividerColor: MacosColors.transparent,
          ),
          children: [
            ContentArea(builder: (context, scrollController) {
              return CustomScrollView(
                key: const PageStorageKey('book-details'),
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, bottom: 24.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 300,
                              constraints: const BoxConstraints(maxWidth: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        item!.largeThumbnail?.toString() ??
                                            item.artUri?.toString() ??
                                            '',
                                    fit: BoxFit.scaleDown,
                                    errorWidget: (context, string, stack) {
                                      return const Icon(
                                          CupertinoIcons.book_fill);
                                    },
                                  ),
                                  if (progress > 0)
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: LinearProgressIndicator(
                                          minHeight: 6,
                                          value: progress,
                                          color: Colors.deepPurple,
                                          backgroundColor: Colors.transparent,
                                        ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    textAlign: TextAlign.left,
                                    style: MacosTheme.of(context)
                                        .typography
                                        .largeTitle,
                                  ),
                                  Text(
                                    '${item.artist}',
                                    textAlign: TextAlign.left,
                                    style: MacosTheme.of(context)
                                        .typography
                                        .largeTitle
                                        .copyWith(color: Colors.deepPurple),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      top: 4.0,
                                    ),
                                    child: Text(
                                      'Narrated by ${item.narrator}',
                                      textAlign: TextAlign.left,
                                      style: MacosTheme.of(context)
                                          .typography
                                          .title3
                                          .copyWith(
                                              color:
                                                  MacosColors.systemGrayColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                      top: 4.0,
                                    ),
                                    child: Text(
                                      (item.duration) != null
                                          ? Utils.friendlyDuration(
                                              item.duration!)
                                          : Utils.friendlyDurationFromItems(
                                              chapters!),
                                      textAlign: TextAlign.left,
                                      style: MacosTheme.of(context)
                                          .typography
                                          .title3
                                          .copyWith(
                                              color:
                                                  MacosColors.systemGrayColor),
                                    ),
                                  ),
                                  if (item.displayDescription?.isNotEmpty ??
                                      false)
                                    HookBuilder(builder: (context) {
                                      final backgroundColor =
                                          useState(MacosColors.transparent);
                                      return GestureDetector(
                                        onTap: () => showMacosSheet(
                                          barrierDismissible: true,
                                          barrierColor: MacosColors.black
                                              .withOpacity(0.7),
                                          context: context,
                                          builder: (context) => Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 500,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(24.0),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color:
                                                        MacosTheme.of(context)
                                                            .canvasColor),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Text(
                                                            item.displayDescription ??
                                                                '',
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .visible,
                                                            style:
                                                                MacosTheme.of(
                                                                        context)
                                                                    .typography
                                                                    .body,
                                                          ),
                                                        ),
                                                      ),
                                                      PushButton(
                                                        buttonSize:
                                                            ButtonSize.large,
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                        child: const Text(
                                                            'Dismiss'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: MouseRegion(
                                          onEnter: (event) =>
                                              backgroundColor.value =
                                                  MacosColors.systemGrayColor
                                                      .withOpacity(0.2),
                                          onExit: (event) => backgroundColor
                                              .value = MacosColors.transparent,
                                          child: Container(
                                            padding: const EdgeInsets.all(6.0),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: backgroundColor.value,
                                            ),
                                            width: 500.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                                top: 4.0,
                                              ),
                                              child: Text(
                                                item.displayDescription ?? '',
                                                softWrap: true,
                                                maxLines: 9,
                                                overflow: TextOverflow.ellipsis,
                                                style: MacosTheme.of(context)
                                                    .typography
                                                    .body,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PushButton(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0,
                                            vertical: 7.0,
                                          ),
                                          buttonSize: ButtonSize.large,
                                          onPressed: () {
                                            playbackController
                                                .playFromId(item.id);
                                          },
                                          child: Row(
                                            children: [
                                              const MacosIcon(
                                                CupertinoIcons.play_fill,
                                                color: MacosColors.white,
                                                size: 13.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 6.0),
                                                child: Text(
                                                  'Play',
                                                  style: MacosTheme.of(context)
                                                      .typography
                                                      .body,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!item.downloading && !item.cached)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 40.0),
                                            child: MacosIconButton(
                                              backgroundColor: MacosColors
                                                  .systemGrayColor
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              onPressed: () {
                                                downloadService?.downloadBook(
                                                  item,
                                                  chapters!,
                                                );
                                              },
                                              icon:
                                                  const MacosIconWithFontweight(
                                                CupertinoIcons.down_arrow,
                                                fontWeight: FontWeight.w900,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                        if (item.downloading)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 40.0),
                                            child: Stack(
                                              children: [
                                                const Positioned.fill(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.deepPurple,
                                                  ),
                                                ),
                                                MacosIconButton(
                                                  backgroundColor: MacosColors
                                                      .systemGrayColor
                                                      .withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                  onPressed: () {
                                                    downloadService
                                                        ?.downloadBook(
                                                      item,
                                                      chapters!,
                                                    );
                                                  },
                                                  icon:
                                                      const MacosIconWithFontweight(
                                                    CupertinoIcons.stop_fill,
                                                    fontWeight: FontWeight.w900,
                                                    size: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (item.cached)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 40.0),
                                            child: MacosIconButton(
                                              backgroundColor: MacosColors
                                                  .systemGrayColor
                                                  .withOpacity(0.1),
                                              shape: BoxShape.circle,
                                              onPressed: () {
                                                downloadService?.deleteDownload(
                                                  item,
                                                );
                                              },
                                              icon:
                                                  const MacosIconWithFontweight(
                                                CupertinoIcons.delete,
                                                fontWeight: FontWeight.w900,
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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
                            final backgroundColor = index % 2 == 0
                                ? MacosColors.systemGrayColor.withOpacity(0.1)
                                : MacosColors.transparent;
                            return HookBuilder(builder: (context) {
                              final hover = useState(false);
                              return MouseRegion(
                                onEnter: (event) => hover.value = true,
                                onExit: (event) => hover.value = false,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: CupertinoListTile(
                                          leading: Text(
                                            '${index + 1}',
                                            style: MacosTheme.of(context)
                                                .typography
                                                .body
                                                .copyWith(
                                                    color: MacosColors
                                                        .systemGrayColor),
                                          ),
                                          backgroundColor: hover.value
                                              ? MacosColors.systemGrayColor
                                                  .withOpacity(0.3)
                                              : backgroundColor,
                                          trailing: chapter.cached
                                              ? const MacosIcon(CupertinoIcons
                                                  .download_circle_fill)
                                              : null,
                                          onTap: () async {
                                            await playbackController
                                                .playFromId(item.id);
                                            await playbackController
                                                .skipToQueueItem(index);
                                          },
                                          title: Text(
                                            chapter.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: MacosTheme.of(context)
                                                .typography
                                                .body,
                                          ),
                                          additionalInfo: Text(
                                              Utils.getTimeValue(
                                                  chapter.duration),
                                              style: MacosTheme.of(context)
                                                  .typography
                                                  .body
                                                  .copyWith(
                                                      color: MacosColors
                                                          .systemGrayColor)),
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
                                              color: Colors.deepPurple,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            });
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
              );
            }),
          ],
        );
      },
    );
  }
}
