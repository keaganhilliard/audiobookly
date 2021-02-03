import 'package:animations/animations.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/screens/book_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaItem item = Provider.of(context);
    PlaybackState state = Provider.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
      child: OpenContainer(
        openBuilder: (_, closeContainer) {
          MediaItem item = Provider.of(context);
          return BookView(
            book: item,
          );
        },
        // clipBehavior: Clip.antiAlias,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        closedColor: Theme.of(context).accentColor,
        closedElevation: 20,
        closedBuilder: (context, openContainer) => InkWell(
          radius: 2000,
          onTap: () {
            // if (openContainer != null)
            openContainer();
            // else
            // NavigationService().pushNamed(Routes.Book, arguments: item);
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
                    //forward_10/forward_30
                    color: Colors.white,
                    icon: Icon(Icons.replay_30),
                    iconSize: 25,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    autofocus: false,
                    onPressed: PlaybackController().rewind,
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
                        ? PlaybackController().pause
                        : PlaybackController().play,
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.close),
                    iconSize: 25,
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    autofocus: false,
                    onPressed: PlaybackController().stop,
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
}
