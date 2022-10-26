import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/mac_ui/features/home/home.dart';
import 'package:audiobookly/mac_ui/features/home/home_view.dart';
import 'package:audiobookly/mac_ui/widgets/seek_bar.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/material_ui/widgets/playback_position.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

ToolBar getHomeToolbar(BuildContext context) {
  final playbackController = GetIt.I<PlaybackController>();
  return ToolBar(
    dividerColor: MacosColors.transparent,
    decoration: BoxDecoration(
        color: MacosTheme.of(context).canvasColor.withOpacity(0.3)),
    // title: const Text('Audiobookly'),
    height: 60.0,
    actions: [
      ToolBarIconButton(
        label: 'Previous Chapter',
        icon: const MacosIcon(Icons.skip_previous),
        tooltipMessage: 'Previous Chapter',
        showLabel: false,
        onPressed: () {
          playbackController.skipToPrevious();
        },
      ),
      ToolBarIconButton(
        label: 'Rewind',
        icon: const MacosIcon(CupertinoIcons.gobackward_15),
        tooltipMessage: 'Rewind',
        showLabel: false,
        onPressed: () {
          playbackController.fastForward();
        },
      ),
      const PlayPauseButton(),
      ToolBarIconButton(
        label: 'Fast forward',
        icon: const MacosIcon(CupertinoIcons.goforward_30),
        tooltipMessage: 'Fast forward',
        showLabel: false,
        onPressed: () {
          playbackController.fastForward();
        },
      ),
      ToolBarIconButton(
        label: 'Next Chapter',
        icon: const MacosIcon(Icons.skip_next),
        tooltipMessage: 'Next Chapter',
        showLabel: false,
        onPressed: () {
          playbackController.skipToNext();
        },
      ),
      const ToolBarSpacer(spacerUnits: 2.0),
      const NowPlaying(),
      const ToolBarSpacer(spacerUnits: 2.0),
      ToolBarIconButton(
        label: 'Chapters',
        icon: const MacosIcon(CupertinoIcons.list_bullet),
        tooltipMessage: 'Chapters',
        showLabel: false,
        onPressed: () {},
      ),
    ],
  );
}

class PlayPauseButton extends ToolbarItem {
  const PlayPauseButton({super.key});

  @override
  Widget build(BuildContext context, ToolbarItemDisplayMode displayMode) {
    return HookBuilder(builder: (context) {
      final playbackController = GetIt.I<PlaybackController>();
      final playbackState = useStream(playbackController.playbackStateStream);
      var iconButton = ToolBarIconButton(
          label: 'play',
          icon: const MacosIcon(CupertinoIcons.play_arrow_solid),
          tooltipMessage: 'Play',
          showLabel: false,
          onPressed: () {
            playbackController.play();
          });

      if (playbackState.hasData &&
          playbackState.data!.processingState != AudioProcessingState.idle) {
        final PlaybackState state = playbackState.data!;
        if (state.playing) {
          iconButton = ToolBarIconButton(
              label: 'pause',
              icon: const MacosIcon(CupertinoIcons.pause_fill),
              tooltipMessage: 'Pause',
              showLabel: false,
              onPressed: () {
                playbackController.pause();
              });
        }
      }
      return iconButton.build(context, displayMode);
    });
  }
}

class NowPlaying extends ToolbarItem {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context, ToolbarItemDisplayMode displayMode) {
    // if (displayMode == ToolbarItemDisplayMode.inToolbar) {
    // final brightness = MacosTheme.of(context).brightness;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(128, 128, 128, 0.5),
      ),
      constraints: const BoxConstraints(
        minHeight: 26,
        minWidth: 200,
        maxWidth: 600,
        maxHeight: 50,
      ),
      padding: const EdgeInsets.all(0),
      child: HookBuilder(
        builder: (context) {
          final playbackController = GetIt.I<PlaybackController>();
          final mediaItem =
              useStream(playbackController.currentMediaItemStream);
          final playbackState =
              useStream(playbackController.playbackStateStream);

          if (playbackState.hasData &&
              playbackState.data!.processingState !=
                  AudioProcessingState.idle &&
              mediaItem.hasData) {
            final PlaybackState state = playbackState.data!;
            final MediaItem item = mediaItem.data!;
            return Row(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: item.artUri?.toString() ?? '',
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  errorWidget: (context, message, something) =>
                      const MacosIcon(CupertinoIcons.book_fill),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                item.title,
                                style:
                                    MacosTheme.of(context).typography.headline,
                              ),
                            ),
                            Text(
                              '${item.album} - ${item.artist}',
                              style: MacosTheme.of(context)
                                  .typography
                                  .subheadline
                                  .copyWith(color: MacosColors.systemGrayColor),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: PlaybackPosition(
                          builder: (context, position) {
                            return SeekBar(
                              duration: item.duration,
                              position: position,
                              onChangeEnd: (val) async {
                                await playbackController
                                    .seek(val.inMilliseconds);
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing Playing',
                style: MacosTheme.of(context).typography.headline,
              ),
            ],
          );
        },
      ),
    );
  }
}

ToolBar getHomeToolbar2(BuildContext context, WidgetRef ref) {
  final playbackController = GetIt.I<PlaybackController>();

  return ToolBar(
    titleWidth: 600,
    centerTitle: true,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        makeLeadingAction(
          context,
          label: 'Previous Chapter',
          icon: const MacosIcon(Icons.skip_previous),
          tooltipMessage: 'Previous Chapter',
          showLabel: false,
          onPressed: () {
            playbackController.skipToPrevious();
          },
        ),
        makeLeadingAction(
          context,
          label: 'Rewind',
          icon: const MacosIcon(CupertinoIcons.gobackward_15),
          tooltipMessage: 'Rewind',
          showLabel: false,
          onPressed: () {
            playbackController.fastForward();
          },
        ),
        HookBuilder(
          builder: (context) {
            final playbackController = GetIt.I<PlaybackController>();
            final playbackState =
                useStream(playbackController.playbackStateStream);
            var iconButton = makeLeadingAction(context,
                label: 'play',
                icon: const MacosIcon(CupertinoIcons.play_arrow_solid),
                tooltipMessage: 'Play',
                showLabel: false, onPressed: () {
              playbackController.play();
            });

            if (playbackState.hasData &&
                playbackState.data!.processingState !=
                    AudioProcessingState.idle) {
              final PlaybackState state = playbackState.data!;
              if (state.playing) {
                iconButton = makeLeadingAction(context,
                    label: 'pause',
                    icon: const MacosIcon(CupertinoIcons.pause_fill),
                    tooltipMessage: 'Pause',
                    showLabel: false, onPressed: () {
                  playbackController.pause();
                });
              }
            }
            return iconButton;
          },
        ),
        makeLeadingAction(
          context,
          label: 'Fast forward',
          icon: const MacosIcon(CupertinoIcons.goforward_30),
          tooltipMessage: 'Fast forward',
          showLabel: false,
          onPressed: () {
            playbackController.fastForward();
          },
        ),
        makeLeadingAction(
          context,
          label: 'Next Chapter',
          icon: const MacosIcon(Icons.skip_next),
          tooltipMessage: 'Next Chapter',
          showLabel: false,
          onPressed: () {
            playbackController.skipToNext();
          },
        ),
      ],
    ),
    title: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: const Color.fromRGBO(64, 63, 63, 1.0),
      ),
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: 600,
        maxWidth: 600,
        maxHeight: 50,
      ),
      padding: const EdgeInsets.all(0),
      child: HookBuilder(
        builder: (context) {
          final playbackController = GetIt.I<PlaybackController>();
          final mediaItem =
              useStream(playbackController.currentMediaItemStream);
          final playbackState =
              useStream(playbackController.playbackStateStream);

          if (playbackState.hasData &&
              playbackState.data!.processingState !=
                  AudioProcessingState.idle &&
              mediaItem.hasData) {
            final MediaItem item = mediaItem.data!;
            return Row(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: item.artUri?.toString() ?? '',
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  errorWidget: (context, message, something) =>
                      const MacosIcon(CupertinoIcons.book_fill),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                item.title,
                                style:
                                    MacosTheme.of(context).typography.headline,
                              ),
                            ),
                            Text(
                              '${item.album} - ${item.artist}',
                              style: MacosTheme.of(context)
                                  .typography
                                  .subheadline
                                  .copyWith(color: MacosColors.systemGrayColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        // alignment: Alignment.bottomCenter,
                        child: PlaybackPosition(
                          builder: (context, position) {
                            return SeekBar(
                              duration: item.duration,
                              position: position,
                              onChangeEnd: (val) async {
                                await playbackController
                                    .seek(val.inMilliseconds);
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing Playing',
                style: MacosTheme.of(context).typography.headline,
              ),
            ],
          );
        },
      ),
    ),
    dividerColor: MacosColors.transparent,
    decoration: BoxDecoration(
        color: MacosTheme.of(context).canvasColor.withOpacity(0.3)),
    // title: const Text('Audiobookly'),
    height: 60.0,
    actions: [
      ToolBarIconButton(
        label: 'Chapters',
        icon: const MacosIcon(CupertinoIcons.list_bullet),
        tooltipMessage: 'Chapters',
        showLabel: false,
        onPressed: () {
          MacosWindowScope.of(context).toggleEndSidebar();
          // ref.read(showTracks.notifier).state = !ref.read(showTracks);
        },
      ),
    ],
  );
}

Widget makeLeadingAction(
  context, {
  required String label,
  required MacosIcon icon,
  VoidCallback? onPressed,
  required bool showLabel,
  String? tooltipMessage,
}) {
  final brightness = MacosTheme.of(context).brightness;
  return MacosIconButton(
    disabledColor: Colors.transparent,
    icon: MacosIconTheme(
      data: MacosTheme.of(context).iconTheme.copyWith(
            color: brightness.resolve(
              const Color.fromRGBO(0, 0, 0, 0.5),
              const Color.fromRGBO(255, 255, 255, 0.5),
            ),
            size: 20.0,
          ),
      child: icon,
    ),
    onPressed: onPressed,
    boxConstraints: BoxConstraints(
      minHeight: showLabel ? 20 : 26,
      minWidth: 20,
      maxWidth: 48,
      maxHeight: 38,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
  );
}
