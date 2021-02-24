import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/features/tracks/tracks_view.dart';
import 'package:audiobookly/widgets/seek_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marquee_widget/marquee_widget.dart';

class PlayerView extends HookWidget {
  final MediaItem book;

  String genDurationString(List<MediaItem> tracks) {
    int total =
        tracks.fold(0, (total, track) => total + track.duration.inMilliseconds);
    return genDuration(total);
  }

  String genDuration(int durationInMilliseconds) {
    if (durationInMilliseconds == null) return 'Calculating...';
    Duration durObj = Duration(milliseconds: durationInMilliseconds);

    int hours = durObj.inHours;
    int minutes = durObj.inMinutes.remainder(60);

    return '$hours hours and $minutes minutes';
  }

  String getDurationLeftText(int currentPosition, int duration) {
    String text = '';
    if (currentPosition != null && duration != null) {
      int durationLeft = duration - currentPosition;
      String durationLeftText = genDuration(durationLeft);
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
    final playbackState = useProvider(playbackStateProvider);
    final mediaItem = useProvider(currentItemProvider);
    final playbackController = useProvider(playbackControllerProvider);
    final navigationService = useProvider(navigationServiceProvider);

    final state = playbackState.data.value;
    final item = mediaItem.data.value;

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
                              imageUrl: book?.largeThumbnail ?? book?.artUri,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            if (book.displayDescription?.isNotEmpty ?? false)
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
                                                  child: Text(
                                                      book.displayDescription),
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
                if (item != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 8.0),
                    child: Text(
                      item?.album ?? book?.album ?? '',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    book?.artist ?? '',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    genDuration(book?.duration?.inMilliseconds ??
                        item?.duration?.inMilliseconds ??
                        0),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
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
                          child: Marquee(
                            child: StreamBuilder<Duration>(
                                stream: AudioService.getPositionStream(),
                                builder: (context, snapshot) {
                                  return Text(getDurationLeftText(
                                      snapshot?.data?.inMilliseconds,
                                      item?.duration?.inMilliseconds));
                                }),
                          ),
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
                                child: StreamBuilder<Duration>(
                                    stream: AudioService.getPositionStream(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null &&
                                          item != null) {
                                        // final timeLeft = getDurationLeftText(
                                        //   snapshot.data.inMilliseconds -
                                        //       item.extras[
                                        //           'currentTrackStartingPosition'],
                                        //   item.extras['currentTrackLength'],
                                        // );
                                        return Center(
                                            child: Text('${item.title}'));
                                      }
                                      return Center(
                                          child: Text('${item.title}'));
                                    })),
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
                          child: StreamBuilder<Duration>(
                              stream: AudioService.getPositionStream(),
                              builder: (context, snapshot) {
                                return SeekBar(
                                    duration: item?.duration,
                                    position: snapshot?.data,
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
                            getIconButton(
                              icon: Icon(Icons.alarm),
                              onPressed: () {},
                              size: 25.0,
                            ),
                            getIconButton(
                              icon: Icon(Icons.replay_30),
                              onPressed: playbackController.rewind,
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
                                  color: Theme.of(context).accentColor,
                                  size: 60,
                                ),
                              ],
                            ),
                            getIconButton(
                              icon: Icon(Icons.forward_30),
                              onPressed: playbackController.fastForward,
                            ),
                            StreamBuilder<Duration>(
                                stream: AudioService.getPositionStream(),
                                builder: (context, snapshot) {
                                  return IconButton(
                                    onPressed: () => {
                                      showModalBottomSheet(
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
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
                                                    value: state.speed,
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
                                      '${state.speed.toStringAsFixed(2)}x',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        // color: Colors.white,
                                        fontSize: 11.0,
                                      ),
                                    ), //............
                                  );
                                }),
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

    // return StreamBuilder(
    //   stream: Rx.combineLatest2(
    //     playbackController.playbackStateStream,
    //     playbackController.currentMediaItemStream,
    //     (PlaybackState a, MediaItem b) => PlayerState(b, a),
    //   ),
    //   builder: (context, AsyncSnapshot<PlayerState> snapshot) {
    //     if (snapshot.hasData) {
    //       final state = snapshot.data.state;
    //       final item = snapshot.data.item;
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text(
    //             book?.album ?? book?.title ?? '',
    //           ),
    //           actions: <Widget>[
    //             IconButton(
    //               icon: Icon(Icons.list),
    //               onPressed: () {
    //                 NavigationService().push(MaterialPageRoute(
    //                   builder: (context) {
    //                     return TracksView();
    //                   },
    //                 ));
    //               },
    //             )
    //           ],
    //         ),
    //         body: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   Expanded(
    //                     flex: 1,
    //                     child: Center(
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(
    //                             bottom: 16.0, left: 16.0, right: 16.0),
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(15.0),
    //                           ),
    //                           clipBehavior: Clip.antiAlias,
    //                           child: Stack(
    //                             children: [
    //                               CachedNetworkImage(
    //                                 fit: BoxFit.cover,
    //                                 imageUrl:
    //                                     book?.largeThumbnail ?? book?.artUri,
    //                                 placeholder: (context, url) => Center(
    //                                   child: CircularProgressIndicator(),
    //                                 ),
    //                               ),
    //                               if (book.displayDescription?.isNotEmpty ??
    //                                   false)
    //                                 Positioned(
    //                                   bottom: 5.0,
    //                                   right: 5.0,
    //                                   child: Opacity(
    //                                     opacity: 1,
    //                                     child: IconButton(
    //                                       color: Colors.grey[100],
    //                                       icon: Icon(Icons.info_outline),
    //                                       onPressed: () async {
    //                                         showModalBottomSheet(
    //                                             context: context,
    //                                             builder: (context) {
    //                                               return SingleChildScrollView(
    //                                                 child: Container(
    //                                                   child: Padding(
    //                                                     padding:
    //                                                         const EdgeInsets
    //                                                             .all(18.0),
    //                                                     child: Text(book
    //                                                         .displayDescription),
    //                                                   ),
    //                                                 ),
    //                                               );
    //                                             });
    //                                       },
    //                                     ),
    //                                   ),
    //                                 ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   if (item != null) ...[
    //                     Text(
    //                       item?.album ?? book?.album ?? '',
    //                       style: Theme.of(context).textTheme.headline5,
    //                     ),
    //                     Text(
    //                       book?.artist ?? '',
    //                       style: Theme.of(context).textTheme.subtitle2,
    //                     ),
    //                     Text(
    //                       genDuration(book?.duration?.inMilliseconds ??
    //                           item?.duration?.inMilliseconds ??
    //                           0),
    //                       style: Theme.of(context).textTheme.subtitle2,
    //                     ),
    //                   ],
    //                 ],
    //               ),
    //             ),
    //             if (item != null)
    //               Expanded(
    //                 flex: 0,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: 30.0,
    //                     // left: 80.0,
    //                     // right: 80.0,
    //                   ),
    //                   child: Center(
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(bottom: 8.0),
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: <Widget>[
    //                           Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 16.0, bottom: 16.0, right: 16.0),
    //                             child: Marquee(
    //                               child: StreamBuilder<Duration>(
    //                                   stream: AudioService.getPositionStream(),
    //                                   builder: (context, snapshot) {
    //                                     return Text(getDurationLeftText(
    //                                         snapshot?.data?.inMilliseconds,
    //                                         item?.duration?.inMilliseconds));
    //                                   }),
    //                             ),
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             mainAxisSize: MainAxisSize.max,
    //                             children: [
    //                               IconButton(
    //                                 icon: Icon(Icons.skip_previous),
    //                                 onPressed: () {
    //                                   playbackController.skipToPrevious();
    //                                 },
    //                               ),
    //                               Expanded(
    //                                   child: StreamBuilder<Duration>(
    //                                       stream:
    //                                           AudioService.getPositionStream(),
    //                                       builder: (context, snapshot) {
    //                                         if (snapshot.data != null &&
    //                                             item != null) {
    //                                           final timeLeft =
    //                                               getDurationLeftText(
    //                                             snapshot.data.inMilliseconds -
    //                                                 item.extras[
    //                                                     'currentTrackStartingPosition'],
    //                                             item.extras[
    //                                                 'currentTrackLength'],
    //                                           );
    //                                           return Center(
    //                                               child: Text('${item.title}'));
    //                                         }
    //                                         return Center(
    //                                             child: Text('${item.title}'));
    //                                       })),
    //                               IconButton(
    //                                 icon: Icon(Icons.skip_next),
    //                                 onPressed: () {
    //                                   playbackController.skipToNext();
    //                                 },
    //                               ),
    //                             ],
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.only(
    //                               left: 8.0,
    //                               right: 8.0,
    //                             ),
    //                             child: StreamBuilder<Duration>(
    //                                 stream: AudioService.getPositionStream(),
    //                                 builder: (context, snapshot) {
    //                                   return SeekBar(
    //                                       duration: item?.duration,
    //                                       position: snapshot?.data,
    //                                       onChangeEnd: (val) async {
    //                                         await playbackController
    //                                             .seek(val.inMilliseconds);
    //                                       });
    //                                 }),
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             mainAxisSize: MainAxisSize.max,
    //                             children: <Widget>[
    //                               getIconButton(
    //                                 icon: Icon(Icons.alarm),
    //                                 onPressed: () {},
    //                                 size: 25.0,
    //                               ),
    //                               getIconButton(
    //                                 icon: Icon(Icons.replay_30),
    //                                 onPressed: playbackController.rewind,
    //                               ),
    //                               Stack(
    //                                 children: [
    //                                   Positioned.fill(
    //                                     child: state?.processingState ==
    //                                                 AudioProcessingState
    //                                                     .buffering ||
    //                                             state?.processingState ==
    //                                                 AudioProcessingState.loading
    //                                         ? CircularProgressIndicator()
    //                                         : Container(),
    //                                   ),
    //                                   getIconButton(
    //                                     icon: state?.playing ??
    //                                             false ||
    //                                                 state?.processingState ==
    //                                                     AudioProcessingState
    //                                                         .buffering
    //                                         ? Icon(Icons.pause_circle_filled)
    //                                         : Icon(Icons.play_circle_filled),
    //                                     onPressed: state?.playing ??
    //                                             false ||
    //                                                 state?.processingState ==
    //                                                     AudioProcessingState
    //                                                         .buffering
    //                                         ? playbackController.pause
    //                                         : playbackController.play,
    //                                     color: Theme.of(context).accentColor,
    //                                     size: 60,
    //                                   ),
    //                                 ],
    //                               ),
    //                               getIconButton(
    //                                 icon: Icon(Icons.forward_30),
    //                                 onPressed: playbackController.fastForward,
    //                               ),
    //                               StreamBuilder<Duration>(
    //                                   stream: AudioService.getPositionStream(),
    //                                   builder: (context, snapshot) {
    //                                     return IconButton(
    //                                       onPressed: () => {
    //                                         showModalBottomSheet(
    //                                             clipBehavior: Clip.antiAlias,
    //                                             shape: RoundedRectangleBorder(
    //                                               borderRadius:
    //                                                   BorderRadius.only(
    //                                                 topLeft:
    //                                                     Radius.circular(15.0),
    //                                                 topRight:
    //                                                     Radius.circular(15.0),
    //                                                 bottomLeft:
    //                                                     Radius.circular(15.0),
    //                                                 bottomRight:
    //                                                     Radius.circular(15.0),
    //                                               ),
    //                                             ),
    //                                             context: context,
    //                                             builder: (context) {
    //                                               return Padding(
    //                                                 padding:
    //                                                     const EdgeInsets.only(
    //                                                   top: 40.0,
    //                                                   bottom: 40.0,
    //                                                   left: 16.0,
    //                                                   right: 16.0,
    //                                                 ),
    //                                                 child: Column(
    //                                                   mainAxisSize:
    //                                                       MainAxisSize.min,
    //                                                   children: <Widget>[
    //                                                     Text('Playback Speed'),
    //                                                     ValueSlider(
    //                                                       prefix: Text('1.00'),
    //                                                       value: state.speed,
    //                                                       onChangeEnd: (val) {
    //                                                         playbackController
    //                                                             .setSpeed(val);
    //                                                       },
    //                                                       max: 2.0,
    //                                                       min: 1.0,
    //                                                       postfix: Text('2.00'),
    //                                                     )
    //                                                   ],
    //                                                 ),
    //                                               );
    //                                             })
    //                                       },
    //                                       icon: Text(
    //                                         '${state.speed.toStringAsFixed(2)}x',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w600,
    //                                           // color: Colors.white,
    //                                           fontSize: 11.0,
    //                                         ),
    //                                       ), //............
    //                                     );
    //                                   }),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               )
    //           ],
    //         ),
    //       );
    //     }
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
    // PlaybackState state = playbackState.data?.value;
    // MediaItem item = currentItem.data?.value;
    // print(state.position);
  }

  IconButton getIconButton(
      {Icon icon, Function onPressed, double size = 35.0, Color color}) {
    return IconButton(
      icon: icon,
      iconSize: size,
      onPressed: onPressed,
      color: color,
    );
  }
}

class ValueSlider extends HookWidget {
  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChangeEnd;
  final Widget prefix;
  final Widget postfix;

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
        prefix,
        Expanded(
          child: Slider(
            label: _currentProgress.value.toStringAsFixed(2),
            value: _currentProgress.value,
            onChangeStart: (val) {
              _seeking.value = true;
            },
            onChanged: (newVal) {
              print('From hook');
              _currentProgress.value = newVal;
            },
            onChangeEnd: (val) {
              _seeking.value = false;
              onChangeEnd(val);
            },
            min: min,
            max: max,
            divisions: 20,
            activeColor: Theme.of(context).accentColor,
          ),
        ),
        // Text(
        //   max.toStringAsFixed(2),
        // )
        postfix,
      ],
    );
  }
}
