import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/viewmodels/tracks_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/utils/utils.dart';

class TracksView extends StatelessWidget {
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
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: !snapshot.hasData
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : StreamBuilder<MediaItem>(
                            stream: AudioService.currentMediaItemStream,
                            builder: (context, item) {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final MediaItem track = snapshot.data[index];
                                  final totalTrackDigits =
                                      snapshot.data.length.toString().length;

                                  return Container(
                                    color: item.hasData && track == item.data
                                        ? Colors.grey[900]
                                        : Colors.black,
                                    child: ListTile(
                                      onTap: () {
                                        print('Skipping to ${item.data.id}');
                                        if (track.id != item.data.id)
                                          AudioService.skipToQueueItem(
                                              track.id);
                                      },
                                      trailing:
                                          item.hasData && track == item.data
                                              ? Icon(Icons.bookmark_border)
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
                            }));
              });
        });
  }
}
