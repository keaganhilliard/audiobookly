import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/viewmodels/tracks_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TracksView extends HookWidget {
  TracksView();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TracksViewModel>(
        model: TracksViewModel(),
        // onModelReady: (model) => itemScrollController.scrollTo(
        //     index: model.currentItemIndex,
        //     duration: Duration(milliseconds: 500)),
        builder: (context, model, child) {
          return MultiProvider(
            providers: [
              StreamProvider.value(value: PlaybackController().queueStream),
              StreamProvider.value(
                  value: PlaybackController().playbackStateStream),
              StreamProvider.value(
                  value: PlaybackController().currentMediaItemStream),
            ],
            child: Builder(builder: (context) {
              PlaybackState state = Provider.of(context);
              List<MediaItem> items = Provider.of(context);
              MediaItem item = Provider.of(context);
              final currentTrackIndex = items.indexWhere(
                  (current) => current.id == item.extras['currentTrack']);
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Tracks'),
                    actions: <Widget>[
                      if ((state != null))
                        IconButton(
                          icon: Icon(Icons.replay_30),
                          onPressed: () {
                            model.rewind();
                          },
                        ),
                      if (!(state?.playing ?? false))
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            model.play();
                          },
                        ),
                      if ((state?.playing ?? false))
                        IconButton(
                          icon: Icon(Icons.pause),
                          onPressed: () {
                            model.pause();
                          },
                        ),
                      IconButton(
                        icon: Icon(Icons.file_download),
                        onPressed: () {
                          if (items.isNotEmpty)
                            model.downloadAllTracks(items);
                          else
                            print('Fucking empty');
                        },
                      )
                    ],
                  ),
                  body: items == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ScrollablePositionedList.builder(
                          initialScrollIndex: model.currentItemIndex,
                          itemScrollController: itemScrollController,
                          itemPositionsListener: itemPositionsListener,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final MediaItem track = items[index];
                            final totalTrackDigits =
                                items.length.toString().length;
                            final bool currentTrack =
                                index == currentTrackIndex;
                            return Container(
                              color: currentTrack
                                  ? Colors.black
                                  : Theme.of(context).canvasColor,
                              child: ListTile(
                                onTap: () {
                                  print('Skipping to ${item.id}');
                                  if (track.id != item.id)
                                    PlaybackController()
                                        .skipToQueueItem(track.id);
                                },
                                trailing: currentTrack
                                    ? IconButton(
                                        icon: Icon(Icons.poll),
                                        onPressed: () {},
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.file_download),
                                        onPressed: () {
                                          print('Something');
                                          model.downloadAllTracks(
                                              items.sublist(index));
                                          // model.handleDownload(track);
                                        },
                                      ),
                                title: Text(
                                  '${(index + 1).toString().padLeft(totalTrackDigits, '0')}${track.title == null || track.title.isEmpty ? '' : ' - ' + track.title}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                    '${Utils.format(Duration(milliseconds: track.duration.inMilliseconds))}'),
                              ),
                            );
                          },
                        )
                  // });
                  );
            }),
          );
        });
  }
}
