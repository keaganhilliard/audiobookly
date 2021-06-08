import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/providers.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TracksView extends HookWidget {
  TracksView();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    final playbackState = useProvider(playbackStateProvider);
    final queue = useProvider(queueProvider);
    final currentItem = useProvider(currentItemProvider);
    final playbackController = useProvider(playbackControllerProvider);

    PlaybackState? state = playbackState.data?.value;
    List<MediaItem>? items = queue.data?.value;
    MediaItem? item = currentItem.data?.value;
    final currentTrackIndex = items?.indexWhere(
            (current) => current.id == item!.extras!['currentTrack']) ??
        0;
    return Scaffold(
        appBar: AppBar(
          title: Text('Tracks'),
          actions: <Widget>[
            if ((state != null))
              IconButton(
                icon: Icon(Icons.replay_30),
                onPressed: () {
                  playbackController.rewind();
                },
              ),
            if (!(state?.playing ?? false))
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  playbackController.play();
                },
              ),
            if ((state?.playing ?? false))
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  playbackController.pause();
                },
              ),
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () {
                // if (items.isNotEmpty)
                //   playbackController.downloadAllTracks(items);
                // else
                //   print('Fucking empty');
              },
            )
          ],
        ),
        body: items == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ScrollablePositionedList.builder(
                initialScrollIndex: currentTrackIndex,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final MediaItem track = items[index];
                  final totalTrackDigits = items.length.toString().length;
                  final bool currentTrack = index == currentTrackIndex;
                  return Container(
                    color: currentTrack
                        ? Theme.of(context).hoverColor
                        : Theme.of(context).canvasColor,
                    child: ListTile(
                      onTap: () {
                        print('Skipping to ${item!.id}');
                        if (track.id != item.id)
                          playbackController.skipToQueueItem(index);
                      },
                      trailing: currentTrack
                          ? IconButton(
                              icon: Icon(Icons.poll),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: Icon(Icons.file_download),
                              onPressed: () {
                                // print('Something');
                                // model.downloadAllTracks(items.sublist(index));
                                // model.handleDownload(track);
                              },
                            ),
                      title: Text(
                        '${(index + 1).toString().padLeft(totalTrackDigits, '0')}${track.title == null || track.title.isEmpty ? '' : ' - ' + track.title}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          '${Utils.format(Duration(milliseconds: track.duration!.inMilliseconds))}'),
                    ),
                  );
                },
              )
        // });
        );
  }
}
