import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/viewmodels/tracks_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/utils/utils.dart';

class TracksView extends StatelessWidget {
  final List<AudiobooklyMediaItem> items;

  TracksView({this.items});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<TracksViewModel>(
        model: TracksViewModel(),
        builder: (context, model, child) {
          return StreamBuilder<List<MediaItem>>(
              stream: AudioService.queueStream,
              builder: (context, snapshot) {
                return Scaffold(
                    appBar: AppBar(
                      title: Text('Tracks'),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.replay_30),
                          onPressed: () {
                            model.rewind();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.file_download),
                          onPressed: () {
                            if (snapshot.hasData)
                              model.downloadAllTracks(snapshot.data);
                          },
                        )
                      ],
                    ),
                    body: !snapshot.hasData
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : StreamBuilder<PlaybackState>(
                            stream: AudioService.playbackStateStream,
                            builder: (context, playbackStateSnapshot) {
                              return StreamBuilder<double>(
                                  stream: Stream.periodic(
                                    Duration(milliseconds: 200),
                                  ),
                                  builder: (context, _) {
                                    var currentPosition = playbackStateSnapshot
                                        .data.currentPosition;
                                    MediaItem item =
                                        snapshot.data.firstWhere((track) {
                                      if (currentPosition - track.duration <=
                                          0) {
                                        currentPosition = 0;
                                        return true;
                                      } else if (currentPosition != 0) {
                                        currentPosition -= track.duration;
                                      }
                                      return false;
                                    });
                                    return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        final MediaItem track =
                                            snapshot.data[index];
                                        final totalTrackDigits = snapshot
                                            .data.length
                                            .toString()
                                            .length;
                                        final bool currentTrack =
                                            item != null && track == item;

                                        return Container(
                                          color: currentTrack
                                              ? Colors.grey[900]
                                              : Colors.black,
                                          child: ListTile(
                                            onTap: () {
                                              print('Skipping to ${item.id}');
                                              if (track.id != item.id)
                                                AudioService.skipToQueueItem(
                                                    track.id);
                                            },
                                            trailing: currentTrack
                                                ? Icon(Icons.speaker)
                                                : null,
                                            title: Text(
                                              '${(index + 1).toString().padLeft(totalTrackDigits, '0')}${track.title == null || track.title.isEmpty ? '' : ' - ' + track.title}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            subtitle: Text(
                                                '${Utils.format(Duration(milliseconds: track.duration))}'),
                                          ),
                                        );
                                      },
                                    );
                                  });
                            }));
              });
        });
  }
}
