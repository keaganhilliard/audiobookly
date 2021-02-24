import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/features/player/player_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MiniPlayer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final playbackState = useProvider(playbackStateProvider);
    final mediaItem = useProvider(currentItemProvider);
    final playbackController = useProvider(playbackControllerProvider);

    if (playbackState.data != null &&
        playbackState.data.value?.processingState !=
            AudioProcessingState.idle) {
      final state = playbackState.data.value;
      final item = mediaItem.data.value;
      return Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
        child: OpenContainer(
          openBuilder: (_, closeContainer) {
            return PlayerView(
              book: item,
            );
          },
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          closedColor: Theme.of(context).accentColor,
          closedElevation: 20,
          closedBuilder: (context, openContainer) => InkWell(
            radius: 2000,
            onTap: () {
              openContainer();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 65,
                    child: Row(children: [
                      CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: item?.artUri,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 8.0),
                          title: Marquee(
                            child: Text(
                              item?.title ?? '',
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: Text(
                            item?.artist ?? '',
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.replay_30),
                      iconSize: 25,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      autofocus: false,
                      onPressed: playbackController.rewind,
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: state?.playing ?? false
                          ? Icon(Icons.pause)
                          : Icon(Icons.play_arrow),
                      iconSize: 25,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      autofocus: false,
                      onPressed: state?.playing ?? false
                          ? playbackController.pause
                          : playbackController.play,
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.close),
                      iconSize: 25,
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      autofocus: false,
                      onPressed: playbackController.stop,
                    )
                  ],
                ),
              ],
            ),
          ),
          // borderOnForeground: true,
        ),
      );
    }
    return Container();
  }
}
