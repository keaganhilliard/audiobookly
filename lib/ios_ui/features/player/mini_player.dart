import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/ios_ui/features/player/player_view.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MiniPlayer extends HookConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final mediaItem = useStream(playbackController.currentMediaItemStream);
    final playbackState = useStream(playbackController.playbackStateStream);

    if (playbackState.hasData &&
        playbackState.data!.processingState != AudioProcessingState.idle &&
        mediaItem.hasData) {
      final PlaybackState state = playbackState.data!;
      final MediaItem item = mediaItem.data!;
      return Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < -20) {
                showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) => PlayerView(
                    book: item,
                  ),
                );
              }
            },
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => PlayerView(
                  book: item,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: Row(children: [
                        CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: item.artUri?.toString() ?? '',
                          placeholder: (context, url) => const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                          errorWidget: (context, message, something) =>
                              const Icon(CupertinoIcons.book_fill),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  item.artist ?? '',
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                              // contentPadding: const EdgeInsets.only(left: 8.0),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        onPressed: playbackController.rewind,
                        child: const Icon(
                          CupertinoIcons.gobackward_15,
                          size: 25,
                          color: CupertinoColors.white,
                        ),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        onPressed: state.playing
                            ? playbackController.pause
                            : playbackController.play,
                        child: Icon(
                          state.playing
                              ? CupertinoIcons.pause_solid
                              : CupertinoIcons.play_arrow_solid,
                          size: 25,
                          color: CupertinoColors.white,
                        ),
                      ),
                      CupertinoButton(
                        // color: Colors.white,
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          right: 10,
                        ),
                        onPressed: playbackController.stop,
                        child: const Icon(
                          CupertinoIcons.stop_fill,
                          size: 25,
                          color: CupertinoColors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ));
    }
    return Container();
  }
}
