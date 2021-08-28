import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/sleep_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/features/tracks/tracks_view.dart';
import 'package:audiobookly/widgets/playback_position.dart';
import 'package:audiobookly/widgets/rewind_button.dart';
import 'package:audiobookly/widgets/seek_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cast/cast.dart';
import 'package:audiobookly/utils/jump_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayerView extends HookWidget {
  final MediaItem? book;

  String genDurationString(List<MediaItem> tracks) {
    Duration total =
        tracks.fold(Duration.zero, (total, track) => total + track.duration!);
    return Utils.friendlyDuration(total);
  }

  String getDurationLeftText(int? currentPosition, int? duration,
      [double rate = 1.0]) {
    String text = '';
    if (currentPosition != null && duration != null) {
      int durationLeft = duration - currentPosition;
      String durationLeftText = Utils.friendlyDuration(
          Duration(milliseconds: (durationLeft / rate).round()));
      text = (currentPosition / duration * 100).toStringAsFixed(0) +
          '% ($durationLeftText left)';
    }
    return text;
  }

  PlayerView({
    this.book,
  });

  @override
  Widget build(context) {
    final playbackController = useProvider(playbackControllerProvider);
    final playbackState = useStream(playbackController.playbackStateStream);
    final mediaItem = useStream(playbackController.currentMediaItemStream);
    final navigationService = useProvider(navigationServiceProvider);

    final PlaybackState? state = playbackState.data;
    final MediaItem? item = mediaItem.data;
    final sleepService = GetIt.I<SleepService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          book?.album ?? book?.title ?? '',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              navigationService.push(MaterialPageRoute(
                builder: (context) {
                  return TracksView();
                },
              ));
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              errorWidget: (context, error, child) =>
                                  Icon(Icons.book),
                              imageUrl: (book?.largeThumbnail?.toString() ??
                                  book?.artUri?.toString())!,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            // Positioned(
                            //   top: 5.0,
                            //   right: 5.0,
                            //   child: Opacity(
                            //     opacity: 1,
                            //     child: IconButton(
                            //       color: Colors.grey[100],
                            //       icon: Icon(Icons.cast),
                            //       onPressed: () async {
                            //         showModalBottomSheet(
                            //             context: context,
                            //             builder: (context) {
                            //               return SingleChildScrollView(
                            //                 child: Container(
                            //                   child: Padding(
                            //                     padding:
                            //                         const EdgeInsets.all(18.0),
                            //                     child: FutureBuilder<
                            //                         List<CastDevice>>(
                            //                       future: CastDiscoveryService()
                            //                           .search(),
                            //                       builder: (context, snapshot) {
                            //                         if (snapshot.hasError) {
                            //                           return Center(
                            //                             child: Text(
                            //                               'Error: ${snapshot.error.toString()}',
                            //                             ),
                            //                           );
                            //                         } else if (!snapshot
                            //                             .hasData) {
                            //                           return Center(
                            //                             child:
                            //                                 CircularProgressIndicator(),
                            //                           );
                            //                         }

                            //                         if (snapshot
                            //                             .data!.isEmpty) {
                            //                           return Column(
                            //                             children: [
                            //                               Center(
                            //                                 child: Text(
                            //                                   'No Chromecast found',
                            //                                 ),
                            //                               ),
                            //                             ],
                            //                           );
                            //                         }

                            //                         return Column(
                            //                           children: snapshot.data!
                            //                               .map((device) {
                            //                             return ListTile(
                            //                               title:
                            //                                   Text(device.name),
                            //                               onTap: () {
                            //                                 // _connectToYourApp(context, device);
                            //                               },
                            //                             );
                            //                           }).toList(),
                            //                         );
                            //                       },
                            //                     ),
                            //                   ),
                            //                 ),
                            //               );
                            //             });
                            //       },
                            //     ),
                            //   ),
                            // ),
                            if (book!.displayDescription?.isNotEmpty ?? false)
                              Positioned(
                                bottom: 5.0,
                                right: 5.0,
                                child: Opacity(
                                  opacity: 1,
                                  child: IconButton(
                                    color: Colors.grey[100],
                                    icon: Icon(Icons.info_outline),
                                    onPressed: () async {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      18.0),
                                                  child: Text(book!
                                                      .displayDescription!),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 8.0),
                  child: Text(
                    book?.album ?? '',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  book?.artist ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
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
                          child: PlaybackPosition(builder: (context, position) {
                            return Text(
                              getDurationLeftText(
                                  position?.inMilliseconds,
                                  item.duration?.inMilliseconds,
                                  state?.speed ?? 1.0),
                            );
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              icon: Icon(Icons.skip_previous),
                              onPressed: () {
                                playbackController.skipToPrevious();
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Text('${item.title}'),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.skip_next),
                              onPressed: () {
                                playbackController.skipToNext();
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: PlaybackPosition(builder: (context, position) {
                            return SeekBar(
                                duration: item.duration,
                                position: position,
                                onChangeEnd: (val) async {
                                  await playbackController
                                      .seek(val.inMilliseconds);
                                });
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            HookBuilder(
                              builder: (context) {
                                final timeLeft =
                                    useStream(sleepService.getTimeLeftStream());
                                return getIconButton(
                                  icon:
                                      timeLeft.hasData && timeLeft.data != null
                                          ? Text(
                                              Utils.getTimeValue(timeLeft.data),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                // color: Colors.white,
                                                fontSize: 9.0,
                                              ),
                                            )
                                          : Icon(Icons.snooze),
                                  onPressed: () async {
                                    final time = await showDialog<Duration?>(
                                      context: context,
                                      builder: (context) {
                                        Widget createOption(
                                          String label,
                                          int minutes,
                                        ) =>
                                            SimpleDialogOption(
                                              child: Text('$label'),
                                              onPressed: () {
                                                Navigator.pop(
                                                  context,
                                                  Duration(minutes: minutes),
                                                );
                                              },
                                            );
                                        return SimpleDialog(
                                          title: const Text('Start timer'),
                                          children: [
                                            createOption('Stop timer', 0),
                                            // createOption('End of chapter', 1),
                                            createOption('10 minutes', 10),
                                            createOption('15 minutes', 15),
                                            createOption('30 minutes', 30),
                                            createOption('45 minutes', 45),
                                            createOption('1 hour', 60),
                                          ],
                                        );
                                      },
                                    );
                                    if (time == Duration.zero)
                                      sleepService.cancelTimer();
                                    else if (time != null)
                                      sleepService.beginTimer(time);
                                  },
                                  size: 25.0,
                                );
                              },
                            ),
                            RewindButton(
                              iconSize: 35,
                            ),
                            Stack(
                              children: [
                                Positioned.fill(
                                  child: state?.processingState ==
                                              AudioProcessingState.buffering ||
                                          state?.processingState ==
                                              AudioProcessingState.loading
                                      ? CircularProgressIndicator()
                                      : Container(),
                                ),
                                getIconButton(
                                  icon: state?.playing ??
                                          false ||
                                              state?.processingState ==
                                                  AudioProcessingState.buffering
                                      ? Icon(Icons.pause_circle_filled)
                                      : Icon(Icons.play_circle_filled),
                                  onPressed: state?.playing ??
                                          false ||
                                              state?.processingState ==
                                                  AudioProcessingState.buffering
                                      ? playbackController.pause
                                      : playbackController.play,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 60,
                                ),
                              ],
                            ),
                            getIconButton(
                              icon: Icon(Jump.forward_30),
                              onPressed: playbackController.fastForward,
                            ),
                            IconButton(
                              onPressed: () => {
                                showModalBottomSheet(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
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
                                            Text('Playback Speed'),
                                            ValueSlider(
                                              prefix: Text('1.00'),
                                              value: state?.speed ?? 1.0,
                                              onChangeEnd: (val) {
                                                playbackController
                                                    .setSpeed(val);
                                              },
                                              max: 2.0,
                                              min: 1.0,
                                              postfix: Text('2.00'),
                                            )
                                          ],
                                        ),
                                      );
                                    })
                              },
                              icon: Text(
                                '${state?.speed.toStringAsFixed(2)}x',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // color: Colors.white,
                                  fontSize: 9.0,
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
    );
  }

  IconButton getIconButton(
      {required Widget icon,
      Function? onPressed,
      double size = 35.0,
      Color? color}) {
    return IconButton(
      icon: icon,
      iconSize: size,
      onPressed: onPressed as void Function()?,
      color: color,
    );
  }
}

class ValueSlider extends HookWidget {
  final double min;
  final double max;
  final double? value;
  final ValueChanged<double>? onChangeEnd;
  final Widget? prefix;
  final Widget? postfix;

  ValueSlider({
    this.min = 0,
    this.max = 100,
    this.value,
    this.onChangeEnd,
    this.prefix,
    this.postfix,
  });

  @override
  Widget build(BuildContext context) {
    final _currentProgress = useState(value);
    final _seeking = useState(false);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text(
        //   min.toStringAsFixed(2),
        // ),
        prefix!,
        Expanded(
          child: Slider(
            label: _currentProgress.value!.toStringAsFixed(2),
            value: _currentProgress.value!,
            onChangeStart: (val) {
              _seeking.value = true;
            },
            onChanged: (newVal) {
              print('From hook');
              _currentProgress.value = newVal;
            },
            onChangeEnd: (val) {
              _seeking.value = false;
              onChangeEnd!(val);
            },
            min: min,
            max: max,
            divisions: 20,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        // Text(
        //   max.toStringAsFixed(2),
        // )
        postfix!,
      ],
    );
  }
}
