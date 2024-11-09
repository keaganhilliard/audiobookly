import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/widgets/seek_bar.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/audio/sleep_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/interactive_slider/interactive_slider.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/material_ui/features/tracks/tracks_view.dart';
import 'package:audiobookly/material_ui/widgets/forward_button.dart';
import 'package:audiobookly/material_ui/widgets/playback_position.dart';
import 'package:audiobookly/material_ui/widgets/rewind_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
// import 'package:cast/cast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';
import 'package:palette_generator/palette_generator.dart';

class PlayerView extends HookConsumerWidget {
  final MediaItem? book;

  String getDurationLeftText(int? currentPosition, int? duration,
      [double rate = 1.0]) {
    String text = '';
    if (currentPosition != null && duration != null) {
      int durationLeft = duration - currentPosition;
      String durationLeftText =
          Duration(milliseconds: (durationLeft / rate).round()).timeLeft;
      text =
          '${(currentPosition / duration * 100).toStringAsFixed(0)}% ${durationLeftText.isNotEmpty ? '($durationLeftText left)' : ''}';
    }
    return text;
  }

  const PlayerView({this.book, super.key});

  final playerDim = 40.0;

  @override
  Widget build(context, ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final playbackState = useStream(playbackController.playbackStateStream);
    final mediaItem = useStream(playbackController.currentMediaItemStream);
    final prefs = ref.watch(preferencesProvider);
    final dominantColor = useState(Colors.transparent);

    final PlaybackState? state = playbackState.data;
    final MediaItem? item = mediaItem.data;
    final sleepService = GetIt.I<SleepService>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(1, 1),
            colors: <Color>[
              dominantColor.value,
              const Color.fromRGBO(32, 32, 32, 1)
            ],
            tileMode: TileMode.decal,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                        ),
                        child: PageView(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      // height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageBuilder: (context, imageProvider) {
                                          PaletteGenerator.fromImageProvider(
                                            imageProvider,
                                          ).then((paletteGenerator) {
                                            dominantColor.value =
                                                paletteGenerator
                                                    .dominantColor!.color;
                                          });
                                          return Image(
                                            image: imageProvider,
                                          );
                                        },
                                        errorWidget: (context, error, child) =>
                                            const Icon(Icons.book),
                                        imageUrl:
                                            (book?.largeThumbnail?.toString() ??
                                                book?.artUri?.toString())!,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (defaultTargetPlatform ==
                                      TargetPlatform.iOS)
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 300.0,
                                          right: 8.0,
                                        ),
                                        child: Container(
                                          width: playerDim,
                                          height: playerDim,
                                          padding: EdgeInsets.all(0),
                                          margin: EdgeInsets.all(0),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(
                                                playerDim / 2),
                                          ),
                                          child: AirPlayIconButton(
                                            constraints:
                                                BoxConstraints.expand(),
                                            // color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: SingleChildScrollView(
                                  child: Text(
                                    book!.displayDescription ??
                                        'Nothing to see here',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: TracksView(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      book?.album ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    book?.artist ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  if (book?.narrator != null)
                    Text(
                      "Read by ${book!.narrator}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                ],
              ),
            ),
            if (item != null)
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    // left: 80.0,
                    // right: 80.0,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              bottom: 16.0,
                              right: 16.0,
                            ),
                            child:
                                PlaybackPosition(builder: (context, position) {
                              return Text(
                                getDurationLeftText(
                                  (prefs.useChapterProgressBar
                                          ? item.currentTrackStartingPosition
                                              .inMilliseconds
                                          : 0) +
                                      (position?.inMilliseconds ?? 0),
                                  item.totalDuration.inMilliseconds,
                                  state?.speed ?? 1.0,
                                ),
                              );
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.skip_previous),
                                onPressed: () {
                                  playbackController.skipToPrevious();
                                },
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_next),
                                onPressed: () {
                                  playbackController.skipToNext();
                                },
                              ),
                            ],
                          ),
                          // if (prefs.useChapterProgressBar)
                          //   Padding(
                          //     padding: const EdgeInsets.only(
                          //       left: 8.0,
                          //       right: 8.0,
                          //     ),
                          //     child: PlaybackPosition(
                          //         builder: (context, position) {
                          //       return SeekBar(
                          //         padding: EdgeInsets.all(8.0),
                          //         duration: item.totalDuration,
                          //         position: item.currentTrackStartingPosition +
                          //             (position ?? Duration.zero),
                          //         enabled: false,
                          //         // onChangeEnd: (val) async {
                          //         //   await playbackController
                          //         //       .seek(val.inMilliseconds);
                          //         // },
                          //       );
                          //     }),
                          //   ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child:
                                PlaybackPosition(builder: (context, position) {
                              return SeekBar(
                                padding: EdgeInsets.all(8.0),
                                duration: item.duration,
                                position: position,
                                onChangeEnd: (val) async {
                                  await playbackController
                                      .seek(val.inMilliseconds);
                                },
                              );
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              HookBuilder(
                                builder: (context) {
                                  final timeLeft = useStream(
                                      sleepService.getTimeLeftStream());
                                  return AbIconButton(
                                    icon: timeLeft.hasData &&
                                            timeLeft.data != null
                                        ? Text(
                                            Utils.getTimeValue(timeLeft.data),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              // color: Colors.white,
                                              fontSize: 9.0,
                                            ),
                                          )
                                        : const Icon(Icons.snooze),
                                    onPressed: () async {
                                      final time = await showDialog<Duration?>(
                                        context: context,
                                        builder: (context) {
                                          return SimpleDialog(
                                            title: const Text('Start timer'),
                                            children: [
                                              AbDialogOption(
                                                label: 'Stop timer',
                                                minutes: 0,
                                              ),
                                              AbDialogOption(
                                                label: 'End of chapter',
                                                minutes: 1,
                                              ),
                                              AbDialogOption(
                                                label: '10 minutes',
                                                minutes: 10,
                                              ),
                                              AbDialogOption(
                                                label: '15 minutes',
                                                minutes: 15,
                                              ),
                                              AbDialogOption(
                                                label: '30 minutes',
                                                minutes: 30,
                                              ),
                                              AbDialogOption(
                                                label: '45 minutes',
                                                minutes: 45,
                                              ),
                                              AbDialogOption(
                                                label: '1 hour',
                                                minutes: 60,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (time == Duration.zero) {
                                        sleepService.cancelTimer();
                                      } else if (time ==
                                          const Duration(minutes: 1)) {
                                        sleepService.endOfChapter();
                                      } else if (time != null) {
                                        sleepService.beginTimer(time);
                                      }
                                    },
                                    size: 25.0,
                                  );
                                },
                              ),
                              // AbIconButton(
                              //   icon: const Icon(Icons.skip_previous),
                              //   onPressed: () {
                              //     playbackController.skipToPrevious();
                              //   },
                              // ),
                              RewindButton(iconSize: 35),
                              Stack(
                                children: [
                                  Positioned.fill(
                                    child: state?.processingState ==
                                                AudioProcessingState
                                                    .buffering ||
                                            state?.processingState ==
                                                AudioProcessingState.loading
                                        ? const CircularProgressIndicator(
                                            strokeWidth: 8.0,
                                          )
                                        : Container(),
                                  ),
                                  AbIconButton(
                                    icon: state?.playing ??
                                            false ||
                                                state?.processingState ==
                                                    AudioProcessingState
                                                        .buffering
                                        ? const Icon(Icons.pause_circle_filled)
                                        : const Icon(Icons.play_circle_filled),
                                    onPressed: () async {
                                      if (state?.playing ??
                                          false ||
                                              state?.processingState ==
                                                  AudioProcessingState
                                                      .buffering) {
                                        playbackController.pause();
                                      } else {
                                        playbackController.play();
                                      }
                                      HapticFeedback.mediumImpact();
                                    },
                                    size: 60,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                              ForwardButton(iconSize: 35),
                              // AbIconButton(
                              //   icon: const Icon(Icons.skip_next),
                              //   onPressed: () {
                              //     playbackController.skipToNext();
                              //   },
                              // ),
                              IconButton(
                                onPressed: () => {
                                  showModalBottomSheet(
                                      clipBehavior: Clip.antiAlias,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.0),
                                          topRight: Radius.circular(15.0),
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0),
                                        ),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return HookBuilder(builder: (context) {
                                          final state = useStream(
                                              playbackController
                                                  .playbackStateStream);
                                          final dragState =
                                              useState<double?>(null);
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              top: 40.0,
                                              bottom: 40.0,
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                const Text('Playback Speed'),
                                                if (state.hasData)
                                                  InteractiveSlider(
                                                    unfocusedOpacity: 0.8,
                                                    foregroundColor:
                                                        Colors.deepPurple,
                                                    segmentDividerColor:
                                                        Colors.grey.shade800,
                                                    initialProgress:
                                                        ((state.data?.speed ??
                                                                    1) -
                                                                1) /
                                                            2,
                                                    onChanged: (value) {
                                                      dragState.value = value;
                                                    },
                                                    onProgressUpdated: (val) {
                                                      playbackController
                                                          .setSpeed(val);
                                                    },
                                                    numberOfSegments: 40,
                                                    min: 1.0,
                                                    max: 3.0,
                                                    startIcon: const Text(
                                                      '1.00',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    endIcon: const Text(
                                                      '3.00',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                    "${dragState.value?.toStringAsFixed(2) ?? state.data?.speed.toStringAsFixed(2)}x")
                                              ],
                                            ),
                                          );
                                        });
                                      })
                                },
                                icon: Text(
                                  '${state?.speed.toStringAsFixed(2)}x',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    // color: Colors.white,
                                    fontSize: 9.0,
                                  ),
                                ),
                              ),
                              // if (defaultTargetPlatform == TargetPlatform.iOS)
                              //   AirPlayIconButton()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class AbIconButton extends StatelessWidget {
  const AbIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 35,
    this.color,
  });
  final Widget icon;
  final VoidCallback onPressed;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: size,
      onPressed: onPressed,
      color: color,
    );
  }
}

class AbDialogOption extends StatelessWidget {
  const AbDialogOption({
    super.key,
    required this.label,
    required this.minutes,
  });

  final String label;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: Text(label),
      onPressed: () {
        Navigator.pop(
          context,
          Duration(minutes: minutes),
        );
      },
    );
  }
}
