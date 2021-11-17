import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/widgets/rewind_button.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TracksView extends HookConsumerWidget {
  TracksView();

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = ref.watch(playbackControllerProvider);
    final playbackState = useStream(playbackController.playbackStateStream);
    final currentItem = useStream(playbackController.currentMediaItemStream);
    final queue = useStream(playbackController.queueStream);

    PlaybackState? state = playbackState.data;
    List<MediaItem>? items = queue.data;
    MediaItem? item = currentItem.data;
    final currentTrackIndex = items?.indexWhere(
            (current) => current.id == item!.extras!['currentTrack']) ??
        0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tracks'),
          actions: <Widget>[
            if ((state != null)) RewindButton(iconSize: 24.0),
            if (!(state?.playing ?? false))
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  playbackController.play();
                },
              ),
            if ((state?.playing ?? false))
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  playbackController.pause();
                },
              ),
          ],
        ),
        body: items == null
            ? const Center(
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
                  return ListTile(
                    leading:
                        track.cached ? const Icon(Icons.offline_pin) : null,
                    onTap: () {
                      print('Skipping to ${item!.id}');
                      if (track.id != item.id) {
                        playbackController.skipToQueueItem(index);
                      }
                    },
                    trailing: currentTrack
                        ? IconButton(
                            icon: const Icon(Icons.poll),
                            onPressed: () {},
                          )
                        : null,
                    // IconButton(
                    //     icon: Icon(Icons.file_download),
                    //     onPressed: () {
                    //       // print('Something');
                    //       // model.downloadAllTracks(items.sublist(index));
                    //       // model.handleDownload(track);
                    //     },
                    //   ),
                    title: Text(
                      '${(index + 1).toString().padLeft(totalTrackDigits, '0')}${track.title.isEmpty ? '' : ' - ' + track.title}',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                        '${Utils.format(Duration(milliseconds: track.duration!.inMilliseconds))}'),
                  );
                },
              )
        // });
        );
  }
}
