import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/material_ui/widgets/rewind_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TracksView extends HookConsumerWidget {
  TracksView({Key? key}) : super(key: key);

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final currentItem = useStream(playbackController.currentMediaItemStream);
    final queue = useStream(playbackController.queueStream);

    List<MediaItem>? items = queue.data;
    MediaItem? item = currentItem.data;
    final currentTrackIndex = items?.indexWhere(
            (current) => current.id == item!.extras!['currentTrack']) ??
        0;
    return items == null
        ? const Center(
            child: CupertinoActivityIndicator(radius: 30),
          )
        : ScrollablePositionedList.builder(
            initialScrollIndex: currentTrackIndex != -1 ? currentTrackIndex : 0,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final MediaItem track = items[index];
              final totalTrackDigits = items.length.toString().length;
              final bool currentTrack = index == currentTrackIndex;
              return Stack(
                children: [
                  if (currentTrack)
                    Positioned.fill(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: HookBuilder(
                            builder: (context) {
                              final position =
                                  useStream(playbackController.positionStream);
                              double scalar = 0;
                              if (position.hasData && position.data != null) {
                                final currentTrackPosition = position.data! -
                                    item!.currentTrackStartingPosition;
                                scalar = currentTrackPosition.inMilliseconds /
                                    item.currentTrackLength.inMilliseconds;
                              }
                              return Container(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth *
                                    (scalar > 0 ? scalar : 0),
                                color: const Color.fromRGBO(103, 58, 183, 0.3),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  CupertinoListTile(
                    leading: Text(
                      (index + 1).toString().padLeft(totalTrackDigits, '0'),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(128, 128, 128, 0.9),
                      ),
                    ),
                    onTap: () {
                      if (track.id != item!.id) {
                        playbackController.skipToQueueItem(index);
                      }
                    },
                    title: Text(
                      track.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    additionalInfo: Text(
                        '${Utils.format(Duration(milliseconds: track.duration!.inMilliseconds))}'),
                  ),
                ],
              );
            },
          );
  }
}
