import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/viewmodels/tracks_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:provider/provider.dart';

class TracksView extends StatelessWidget {
  TracksView();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TracksViewModel>(
        model: TracksViewModel(),
        builder: (context, model, child) {
          return MultiProvider(
            providers: [
              StreamProvider.value(value: AudioService.queueStream),
              StreamProvider.value(value: AudioService.playbackStateStream),
              StreamProvider.value(value: AudioService.currentMediaItemStream),
            ],
            child: Builder(builder: (context) {
              PlaybackState state = Provider.of(context);
              List<MediaItem> items = Provider.of(context);
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Tracks'),
                    actions: <Widget>[
                      if (state?.basicState != BasicPlaybackState.none)
                        IconButton(
                          icon: Icon(Icons.replay_30),
                          onPressed: () {
                            model.rewind();
                          },
                        ),
                      if (state?.basicState == BasicPlaybackState.paused)
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            model.play();
                          },
                        ),
                      if (state?.basicState == BasicPlaybackState.playing)
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
                      : ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            MediaItem item = Provider.of(context);
                            final MediaItem track = items[index];
                            final totalTrackDigits =
                                items.length.toString().length;
                            final bool currentTrack = item != null &&
                                track.id == item.extras['currentTrack'];
                            return Container(
                              color: currentTrack
                                  ? Colors.black
                                  : Theme.of(context).canvasColor,
                              child: ListTile(
                                onTap: () {
                                  print('Skipping to ${item.id}');
                                  if (track.id != item.id)
                                    AudioService.skipToQueueItem(track.id);
                                },
                                trailing:
                                    currentTrack ? Icon(Icons.poll) : null,
                                title: Text(
                                  '${(index + 1).toString().padLeft(totalTrackDigits, '0')}${track.title == null || track.title.isEmpty ? '' : ' - ' + track.title}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                    '${Utils.format(Duration(milliseconds: track.duration))}'),
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
