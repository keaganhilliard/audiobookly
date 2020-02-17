import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/viewmodels/book_view_model.dart';

class BookView extends StatelessWidget {
  final PlexAlbum book;
  final PlexServerV2 server;

  BookView({
    this.book,
    this.server,
  });

  @override
  Widget build(context) {
    return BaseWidget<BookViewModel>(
      onModelReady: (model) {
        model.getAllTracks(book.ratingKey);
      },
      model: BookViewModel(server: server),
      builder: (context, model, child) {
        final int totalTrackDigits = model.tracks.length.toString().length;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              book.title,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  NavigationService().push(MaterialPageRoute(
                    builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('Tracks'),
                        ),
                        body: model.busy
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: model.tracks.length,
                                itemBuilder: (context, index) {
                                  final PlexTrack track = model.tracks[index];

                                  return Container(
                                    color: Colors.black,
                                    child: ListTile(
                                      // trailing: Icon(Icons.),

                                      title: Text(
                                        '${track.index.toString().padLeft(totalTrackDigits, '0')} - ${track.title}',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                          '${Utils.format(Duration(milliseconds: track.duration))}'),
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ));
                },
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    bottom: 16.0,
                    top: 16.0,
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Hero(
                      tag: book.title,
                      child: CachedNetworkImage(
                        fit: BoxFit.scaleDown,
                        imageUrl: server.getUrlWithToken(book.thumb),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 80.0,
                  right: 80.0,
                  bottom: 8.0,
                  top: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //   book.title,
                          //   style: Theme.of(context).textTheme.headline6,
                          // ),
                          Text(
                            book.parentTitle,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            model.busy ? 'Calculating...' : model.duration,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    // left: 80.0,
                    // right: 80.0,
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        model.currentTrack == null
                            ? Text('')
                            : Text(model.currentTrack.title),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                model.currentTrack == null
                                    ? '00:00'
                                    : Utils.format(
                                        Duration(
                                            milliseconds:
                                                model.currentTrack.viewOffset),
                                      ),
                              ),
                              Expanded(
                                child: Slider(
                                  value: model.currentTrack == null
                                      ? 50
                                      : model.currentTrack.viewOffset
                                          .toDouble(),
                                  onChanged: (newVal) {},
                                  min: 0,
                                  max: model.currentTrack == null
                                      ? 100
                                      : model.currentTrack.duration.toDouble(),
                                  activeColor: Theme.of(context).accentColor,
                                  label: '${book.title} • ${book.parentTitle}',
                                ),
                              ),
                              Text(
                                model.currentTrack == null
                                    ? '00:00'
                                    : Utils.format(
                                        Duration(
                                          milliseconds:
                                              model.currentTrack.duration,
                                        ),
                                      ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            getIconButton(
                              icon: Icon(Icons.alarm),
                              onPressed: () {},
                              size: 25.0,
                            ),
                            getIconButton(
                              icon: Icon(Icons.replay_30),
                              onPressed: () {},
                            ),
                            getIconButton(
                              icon: Icon(Icons.play_circle_filled),
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                              size: 60.0,
                            ),
                            getIconButton(
                              icon: Icon(Icons.forward_30),
                              onPressed: () {},
                            ),
                            InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              onTap: () => {},
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Text(
                                  '1.40x',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ), //............
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
        // }
      },
    );
  }

  IconButton getIconButton(
      {Icon icon, Function onPressed, double size = 35.0, Color color}) {
    return IconButton(
      icon: icon,
      iconSize: size,
      onPressed: onPressed,
      color: color,
    );
  }
}
