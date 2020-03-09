import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:audiobookly/screens/tracks_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/viewmodels/book_view_model.dart';
import 'package:provider/provider.dart';

class BookView extends StatelessWidget {
  final String bookId;

  BookView({
    this.bookId,
  });

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        StreamProvider<PlaybackState>(
          create: (context) => AudioService.playbackStateStream,
          initialData:
              PlaybackState(basicState: BasicPlaybackState.none, actions: null),
        ),
        StreamProvider<MediaItem>(
          create: (context) => AudioService.currentMediaItemStream,
        ),
      ],
      child: BaseWidget<BookViewModel>(
        onModelReady: (model) {
          model.init(bookId);
        },
        model: BookViewModel(),
        builder: (context, model, child) {
          PlaybackState state = Provider.of(context);
          print('State: ${state.basicState}');
          MediaItem item = Provider.of(context);
          // model.handleDownload(item);

          if (item == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Scaffold(
            appBar: AppBar(
              title: Text(
                item?.album ?? '',
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
            body: Flex(
              direction:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          // left: 32.0,
                          // right: 32.0,
                          // bottom: 16.0,
                          top: 16.0,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.scaleDown,
                                  imageUrl: item?.artUri,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5.0,
                                  right: 5.0,
                                  child: IconButton(
                                    color: Colors.grey[400],
                                    icon: Icon(Icons.info_outline),
                                    onPressed: () async {
                                      print(item.title);
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Text(model
                                                    .book.displayDescription),
                                              ),
                                            );
                                          });
                                      print(model.book.displayDescription);
                                    },
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
                        left: 18.0,
                        right: 18.0,
                        bottom: 8.0,
                        top: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  item?.album ?? '',
                                  style: Theme.of(context).textTheme.headline,
                                ),
                                Text(
                                  item?.artist ?? '',
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                                StreamBuilder<List<MediaItem>>(
                                    stream: AudioService.queueStream,
                                    builder: (context, snapshot) {
                                      return Text(
                                        snapshot.hasData
                                            ? model.genDurationString(
                                                snapshot.data)
                                            : 'Calculating...',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                              child: Text(item?.title ?? ''),
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
                                  return ProgressSlider(
                                    value: state.currentPosition.toDouble(),
                                    onChangeEnd: (val) async {
                                      AudioService.seekTo(val.toInt());
                                    },
                                    min: 0,
                                    max: item?.duration?.toDouble() ?? 100,
                                  );
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
                                onPressed: AudioService.rewind,
                              ),
                              Stack(
                                children: [
                                  Positioned.fill(
                                    child: state?.basicState ==
                                                BasicPlaybackState.buffering ||
                                            state?.basicState ==
                                                BasicPlaybackState
                                                    .fastForwarding
                                        ? CircularProgressIndicator()
                                        : Container(),
                                  ),
                                  getIconButton(
                                    icon: state?.basicState ==
                                            BasicPlaybackState.playing
                                        ? Icon(Icons.pause_circle_filled)
                                        : Icon(Icons.play_circle_filled),
                                    onPressed: state?.basicState ==
                                            BasicPlaybackState.playing
                                        ? AudioService.pause
                                        : AudioService.play,
                                    color: Theme.of(context).accentColor,
                                    size: 60,
                                  ),
                                ],
                              ),
                              getIconButton(
                                icon: Icon(Icons.forward_30),
                                onPressed: AudioService.fastForward,
                              ),
                              StreamBuilder<double>(
                                  stream: Stream.periodic(
                                    Duration(milliseconds: 200),
                                  ),
                                  builder: (context, snapshot) {
                                    return InkWell(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      onTap: () => {
                                        showModalBottomSheet(
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0),
                                                bottomLeft:
                                                    Radius.circular(15.0),
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text('Playback Speed'),
                                                    PlaybackSpeedSlider(
                                                      value: state.speed,
                                                      onChangeEnd: (val) {
                                                        AudioService.customAction(
                                                            'setPlaybackRate',
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
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          top: 15.0,
                                          bottom: 15.0,
                                          left: 10.0,
                                          right: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        child: Text(
                                          '${state.speed.toStringAsFixed(2)}x',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
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
