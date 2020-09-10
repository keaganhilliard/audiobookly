import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:audiobookly/screens/tracks_view.dart';
import 'package:audiobookly/ui/seek_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/viewmodels/book_view_model.dart';
import 'package:provider/provider.dart';

class BookView extends StatelessWidget with WidgetsBindingObserver {
  final MediaItem book;

  BookView({
    this.book,
  });

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(value: AudioService.playbackStateStream),
        StreamProvider.value(value: AudioService.currentMediaItemStream),
      ],
      child: Builder(
        builder: (context) {
          return BaseWidget<BookViewModel>(
            model: BookViewModel(),
            builder: (context, model, child) {
              PlaybackState state = Provider.of(context);
              MediaItem item = Provider.of(context);

              if (book == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    book?.album ?? book?.title ?? '',
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.list),
                      onPressed: () {
                        NavigationService().push(MaterialPageRoute(
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
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  // left: 32.0,
                                  // right: 32.0,
                                  bottom: 16.0,
                                  top: 16.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: book?.largeThumbnail ??
                                            book?.artUri,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
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
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: Text(book
                                                              .displayDescription),
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
                            Text(
                              item?.album ?? book?.album ?? '',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              book?.artist ?? '',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              model.genDuration(
                                  book?.duration?.inMilliseconds ??
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            // left: 80.0,
                            // right: 80.0,
                          ),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Marquee(
                                    child: StreamBuilder<double>(
                                        stream: Stream.periodic(
                                            Duration(milliseconds: 200)),
                                        builder: (context, snapshot) {
                                          return Text(model.getDurationLeftText(
                                              state?.currentPosition
                                                  ?.inMilliseconds,
                                              item?.duration?.inMilliseconds));
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: StreamBuilder<double>(
                                      stream: Stream.periodic(
                                        Duration(milliseconds: 200),
                                      ),
                                      builder: (context, snapshot) {
                                        return SeekBar(
                                            duration: item?.duration,
                                            position: state?.currentPosition,
                                            onChangeEnd: (val) async {
                                              await PlaybackController()
                                                  .seekTo(val.inMilliseconds);
                                            });
                                        // ProgressSlider(
                                        //   value: state?.currentPosition
                                        //           ?.inMilliseconds
                                        //           ?.toDouble() ??
                                        //       0,
                                        //   onChangeEnd: (val) async {
                                        //     PlaybackController()
                                        //         .seekTo(val.toInt());
                                        //   },
                                        //   min: 0,
                                        //   max: item?.duration?.inMilliseconds
                                        //           ?.toDouble() ??
                                        //       100,
                                        // );
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
                                      onPressed: PlaybackController().rewind,
                                    ),
                                    Stack(
                                      children: [
                                        Positioned.fill(
                                          child: state?.processingState ==
                                                      AudioProcessingState
                                                          .buffering ||
                                                  state?.processingState ==
                                                      AudioProcessingState
                                                          .fastForwarding ||
                                                  state?.processingState ==
                                                      AudioProcessingState
                                                          .rewinding
                                              ? CircularProgressIndicator()
                                              : Container(),
                                        ),
                                        getIconButton(
                                          icon: state?.playing ??
                                                  false ||
                                                      state?.processingState ==
                                                          AudioProcessingState
                                                              .buffering
                                              ? Icon(Icons.pause_circle_filled)
                                              : Icon(Icons.play_circle_filled),
                                          onPressed: state?.playing ??
                                                  false ||
                                                      state?.processingState ==
                                                          AudioProcessingState
                                                              .buffering
                                              ? PlaybackController().pause
                                              : PlaybackController().play,
                                          color: Theme.of(context).accentColor,
                                          size: 60,
                                        ),
                                      ],
                                    ),
                                    getIconButton(
                                      icon: Icon(Icons.forward_30),
                                      onPressed:
                                          PlaybackController().fastForward,
                                    ),
                                    StreamBuilder<double>(
                                        stream: Stream.periodic(
                                          Duration(milliseconds: 200),
                                        ),
                                        builder: (context, snapshot) {
                                          return IconButton(
                                            onPressed: () => {
                                              showModalBottomSheet(
                                                  clipBehavior: Clip.antiAlias,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(15.0),
                                                      bottomLeft:
                                                          Radius.circular(15.0),
                                                      bottomRight:
                                                          Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 40.0,
                                                        bottom: 40.0,
                                                        left: 16.0,
                                                        right: 16.0,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(
                                                              'Playback Speed'),
                                                          PlaybackSpeedSlider(
                                                            value: state.speed,
                                                            onChangeEnd: (val) {
                                                              AudioService
                                                                  .setSpeed(
                                                                      val);
                                                            },
                                                            max: 2.0,
                                                            min: 1.0,
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
                                                fontSize: 12.0,
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
                      )
                  ],
                ),
              );
              // }
            },
          );
        },
      ),
    );
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

class ProgressSlider extends StatefulWidget {
  final Function(double newVal) onChangeEnd;
  final double value;
  final double max;
  final double min;
  ProgressSlider({this.onChangeEnd, this.value, this.max, this.min});

  @override
  _ProgressSliderState createState() => _ProgressSliderState();
}

class _ProgressSliderState extends State<ProgressSlider> {
  double _currentProgress;
  bool _seeking = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentProgress = widget.value;
    });
  }

  @override
  void didUpdateWidget(ProgressSlider oldWidget) {
    setState(() {
      if (!_seeking) _currentProgress = widget.value;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Utils.format(
            Duration(milliseconds: _currentProgress.toInt()),
          ),
        ),
        Expanded(
          child: Slider(
            value: _currentProgress,
            onChangeStart: (val) {
              setState(() {
                _seeking = true;
              });
            },
            onChanged: (newVal) {
              setState(() {
                _currentProgress = newVal;
              });
            },
            onChangeEnd: (val) {
              setState(() {
                _seeking = false;
                _currentProgress = _currentProgress;
              });
              widget.onChangeEnd(val);
            },
            min: widget.min ?? 0,
            max: widget.max ?? 100,
            activeColor: Theme.of(context).accentColor,
          ),
        ),
        Text(Utils.format(
          Duration(
            milliseconds: widget.max.toInt(),
          ),
        ))
      ],
    );
  }
}

class PlaybackSpeedSlider extends StatefulWidget {
  final Function(double newVal) onChangeEnd;
  final double value;
  final double max;
  final double min;
  PlaybackSpeedSlider({this.onChangeEnd, this.value, this.max, this.min});
  @override
  _PlaybackSpeedSliderState createState() => _PlaybackSpeedSliderState();
}

class _PlaybackSpeedSliderState extends State<PlaybackSpeedSlider> {
  double _currentProgress;
  bool _seeking = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentProgress = widget.value;
    });
  }

  @override
  void didUpdateWidget(PlaybackSpeedSlider oldWidget) {
    setState(() {
      if (!_seeking) _currentProgress = widget.value;
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.min.toStringAsFixed(2),
        ),
        Expanded(
          child: Slider(
            label: _currentProgress.toStringAsFixed(2),
            value: _currentProgress,
            onChangeStart: (val) {
              setState(() {
                _seeking = true;
              });
            },
            onChanged: (newVal) {
              setState(() {
                _currentProgress = newVal;
              });
            },
            onChangeEnd: (val) {
              setState(() {
                _seeking = false;
                _currentProgress = _currentProgress;
              });
              widget.onChangeEnd(val);
            },
            min: widget.min ?? 0,
            max: widget.max ?? 100,
            divisions: 20,
            activeColor: Theme.of(context).accentColor,
          ),
        ),
        Text(
          widget.max.toStringAsFixed(2),
        )
      ],
    );
  }
}
