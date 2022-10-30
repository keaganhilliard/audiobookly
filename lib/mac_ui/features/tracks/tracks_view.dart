import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/widgets/playback_position.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/material_ui/widgets/rewind_button.dart';
import 'package:cupertino_lists/cupertino_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TracksView extends HookConsumerWidget {
  ScrollController controller;
  TracksView({Key? key, required this.controller}) : super(key: key);

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
        : HookBuilder(
            builder: (context) {
              final keyMap = {for (final item in items) item.id: GlobalKey()};
              final totalTrackDigits = items.length.toString().length;
              return ListView(
                controller: controller,
                children: [
                  for (final entry in items.asMap().entries)
                    Stack(
                      key: keyMap[entry.value.id],
                      children: [
                        if (entry.key == currentTrackIndex)
                          Positioned.fill(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: PlaybackPosition(
                                  builder: (context, position) {
                                    double scalar = 0;
                                    if (position != null) {
                                      final currentTrackPosition = position -
                                          item!.currentTrackStartingPosition;
                                      scalar =
                                          currentTrackPosition.inMilliseconds /
                                              item.currentTrackLength
                                                  .inMilliseconds;
                                    }
                                    return Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: MacosColors.black
                                              .withOpacity(0.5)),
                                      height: constraints.maxHeight,
                                      width: constraints.maxWidth,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                103, 58, 183, 0.3),
                                          ),
                                          height: constraints.maxHeight,
                                          width: constraints.maxWidth *
                                              (scalar > 0 ? scalar : 0),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        CupertinoListTile(
                          // backgroundColor: currentTrack
                          // ? const Color.fromRGBO(103, 58, 183, 0.3)
                          // : null,
                          leading: Text(
                            (entry.key + 1)
                                .toString()
                                .padLeft(totalTrackDigits, '0'),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(128, 128, 128, 0.9),
                            ),
                          ),
                          onTap: () {
                            if (entry.value.id != item!.id) {
                              playbackController.skipToQueueItem(entry.key);
                            }
                          },
                          title: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 99),
                            child: Text(
                              entry.value.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          additionalInfo: entry.key == currentTrackIndex
                              ? PlaybackPosition(builder: (context, position) {
                                  if (position != null) {
                                    final currentTrackPosition = position -
                                        item!.currentTrackStartingPosition;
                                    return Text(
                                        '-${Utils.format(entry.value.duration! - currentTrackPosition)}');
                                  }
                                  return Text(
                                      Utils.format(entry.value.duration!));
                                })
                              : Text(Utils.format(entry.value.duration!)),
                        ),
                      ],
                    )
                ],
              );
            },
          );
  }
}
