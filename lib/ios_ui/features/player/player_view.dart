import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/sleep_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/ios_ui/features/tracks/tracks_view.dart';
import 'package:audiobookly/ios_ui/widgets/forward_button.dart';
import 'package:audiobookly/material_ui/widgets/playback_position.dart';
import 'package:audiobookly/ios_ui/widgets/rewind_button.dart';
import 'package:audiobookly/ios_ui/widgets/seek_bar.dart';
import 'package:better_cupertino_slider/better_cupertino_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
          '${(currentPosition / duration * 100).toStringAsFixed(0)}% ($durationLeftText left)';
    }
    return text;
  }

  const PlayerView({this.book, super.key});

  @override
  Widget build(context, ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final playbackState = useStream(playbackController.playbackStateStream);
    final mediaItem = useStream(playbackController.currentMediaItemStream);

    final PlaybackState? state = playbackState.data;
    final MediaItem? item = mediaItem.data;
    final sleepService = GetIt.I<SleepService>();

    if (state?.processingState == AudioProcessingState.completed) {
      Navigator.of(context).pop();
    }

    final primaryColor = CupertinoTheme.of(context).primaryColor;

    return CupertinoScaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
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
                                child: Container(
                                  // height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    errorWidget: (context, error, child) =>
                                        const Icon(Icons.book),
                                    imageUrl:
                                        (book?.largeThumbnail?.toString() ??
                                            book?.artUri?.toString())!,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                              ),
                              if (book!.displayDescription != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        book!.displayDescription!,
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
                          left: 16.0, right: 16.0, bottom: 8.0),
                      child: Text(
                        book?.album ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Text(
                      book?.artist ?? '',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
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
                                  left: 16.0, bottom: 16.0, right: 16.0),
                              child: PlaybackPosition(
                                  builder: (context, position) {
                                return Text(
                                  getDurationLeftText(
                                    position?.inMilliseconds,
                                    item.duration?.inMilliseconds,
                                    state?.speed ?? 1.0,
                                  ),
                                );
                              }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CupertinoButton(
                                  onPressed: () {
                                    playbackController.skipToPrevious();
                                  },
                                  child: Icon(
                                    Icons.skip_previous,
                                    color: primaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    playbackController.skipToNext();
                                  },
                                  child: Icon(
                                    Icons.skip_next,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                    ),
                                    child: PlaybackPosition(
                                        builder: (context, position) {
                                      return SeekBar(
                                          duration: item.duration,
                                          position: position,
                                          onChangeEnd: (val) async {
                                            await playbackController
                                                .seek(val.inMilliseconds);
                                          });
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                HookBuilder(
                                  builder: (context) {
                                    final timeLeft = useStream(
                                      sleepService.getTimeLeftStream(),
                                    );
                                    return getIconButton(
                                      icon: timeLeft.hasData &&
                                              timeLeft.data != null
                                          ? Text(
                                              Utils.getTimeValue(timeLeft.data),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 9.0,
                                                color: primaryColor,
                                              ),
                                            )
                                          : Icon(
                                              Icons.snooze,
                                              color: primaryColor,
                                            ),
                                      onPressed: () async {
                                        Duration? time;
                                        CupertinoActionSheetAction createOption(
                                          String label,
                                          int minutes,
                                        ) =>
                                            CupertinoActionSheetAction(
                                              child: Text(label),
                                              onPressed: () {
                                                time =
                                                    Duration(minutes: minutes);
                                                Navigator.pop(context);
                                              },
                                            );
                                        await showCupertinoModalPopup<void>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CupertinoActionSheet(
                                            title: const Text('Timer'),
                                            actions: <CupertinoActionSheetAction>[
                                              createOption('Stop timer', 0),
                                              createOption('End of chapter', 1),
                                              createOption('10 minutes', 10),
                                              createOption('15 minutes', 15),
                                              createOption('30 minutes', 30),
                                              createOption('45 minutes', 45),
                                              createOption('1 hour', 60),
                                            ],
                                          ),
                                        );

                                        if (time == Duration.zero) {
                                          sleepService.cancelTimer();
                                        } else if (time ==
                                            const Duration(minutes: 1)) {
                                          sleepService.endOfChapter();
                                        } else if (time != null) {
                                          sleepService.beginTimer(time!);
                                        }
                                      },
                                      size: 25.0,
                                    );
                                  },
                                ),
                                RewindButton(
                                  color: primaryColor,
                                  iconSize: 35,
                                ),
                                Stack(
                                  children: [
                                    Positioned.fill(
                                      child: state?.processingState ==
                                                  AudioProcessingState
                                                      .buffering ||
                                              state?.processingState ==
                                                  AudioProcessingState.loading
                                          ? const Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                height: 60,
                                                width: 60,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 5.0,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                    getIconButton(
                                      icon: state?.playing ??
                                              false ||
                                                  state?.processingState ==
                                                      AudioProcessingState
                                                          .buffering
                                          ? Icon(
                                              Icons.pause_circle_filled,
                                              size: 60,
                                              color: primaryColor,
                                            )
                                          : Icon(
                                              Icons.play_circle_filled,
                                              size: 60,
                                              color: primaryColor,
                                            ),
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
                                    ),
                                  ],
                                ),
                                ForwardButton(
                                  iconSize: 35,
                                  color: primaryColor,
                                ),
                                CupertinoButton(
                                  onPressed: () => {
                                    showCupertinoModalPopup(
                                        context: context,
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              top: 40.0,
                                              bottom: 40.0,
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            child:
                                                HookBuilder(builder: (context) {
                                              final currentSliderValue =
                                                  useState(state?.speed ?? 1.0);
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text(
                                                    'Playback Speed: ${currentSliderValue.value.toStringAsFixed(2)}',
                                                  ),
                                                  ValueSlider(
                                                    prefix: const Text('0.50'),
                                                    value: state?.speed ?? 1.0,
                                                    onChanged: (val) =>
                                                        currentSliderValue
                                                            .value = val,
                                                    onChangeEnd: (val) async {
                                                      await playbackController
                                                          .setSpeed(val);
                                                    },
                                                    max: 3.0,
                                                    min: 0.5,
                                                    postfix: const Text('3.00'),
                                                  )
                                                ],
                                              );
                                            }),
                                          );
                                        })
                                  },
                                  child: Text(
                                    '${state?.speed.toStringAsFixed(2)}x',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                      fontSize: 10.0,
                                    ),
                                  ), //............
                                ),
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
      ),
    );
  }

  CupertinoButton getIconButton({
    required Widget icon,
    Function? onPressed,
    double size = 35.0,
    Color? color,
  }) {
    return CupertinoButton(
      // iconSize: size,
      onPressed: onPressed as void Function()?,
      color: color,
      child: icon,
    );
  }
}

class ValueSlider extends HookWidget {
  final double min;
  final double max;
  final double? value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final Widget? prefix;
  final Widget? postfix;

  const ValueSlider({
    super.key,
    this.min = 0,
    this.max = 100,
    this.value,
    this.onChanged,
    this.onChangeEnd,
    this.prefix,
    this.postfix,
  });

  // This gives us a value rounded to .05
  // so we don't have wild playback rates
  double stepper(double number) {
    return (number * 20).roundToDouble() / 20;
  }

  @override
  Widget build(BuildContext context) {
    final currentProgress = useState(value);
    final seeking = useState(false);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        prefix!,
        Expanded(
          child: BetterCupertinoSlider(
            configure: BetterCupertinoSliderConfigure(
              trackLeftColor: Colors.deepPurple,
              thumbPainter: (canvas, rect) {
                final RRect rrect = RRect.fromRectAndRadius(
                  rect,
                  Radius.circular(rect.shortestSide),
                );
                canvas.drawRRect(rrect, Paint()..color = Colors.deepPurple);
              },
            ),
            value: currentProgress.value!,
            onChangeStart: (val) {
              seeking.value = true;
            },
            onChanged: (newVal) {
              currentProgress.value = stepper(newVal);
              onChanged?.call(stepper(newVal));
              Debouncer(milliseconds: 500).run(() {
                onChangeEnd?.call(stepper(newVal));
              });
            },
            min: min,
            max: max,
          ),
        ),
        postfix!,
      ],
    );
  }
}
