import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/material_ui/features/player/player_view.dart';
import 'package:audiobookly/material_ui/widgets/rewind_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: InkWell(
              radius: 2000,
              onTap: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => PlayerView(
                    book: item,
                  ),
                );
              },
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy < -20) {
                    showBarModalBottomSheet(
                      context: context,
                      builder: (context) => PlayerView(
                        book: item,
                      ),
                    );
                  }
                },
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
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, message, something) =>
                                const Icon(Icons.book),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: const EdgeInsets.only(left: 8.0),
                              title: Text(
                                item.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                item.artist ?? '',
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
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
                        RewindButton(
                          iconSize: 25,
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                        ),
                        IconButton(
                            color: Colors.white,
                            icon: state.playing
                                ? const Icon(Icons.pause)
                                : const Icon(Icons.play_arrow),
                            iconSize: 25,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            autofocus: false,
                            onPressed: () {
                              if (state.playing) {
                                playbackController.pause();
                              } else {
                                playbackController.play();
                              }
                              HapticFeedback.mediumImpact();
                            }),
                        IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.close),
                          iconSize: 25,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 10),
                          autofocus: false,
                          onPressed: playbackController.stop,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    }
    return Container();
  }
}
