import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
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

        // if (model.busy) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              book.title,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  top: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            book.title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            book.parentTitle,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                          Text(
                            model.busy ? 'Calculating...' : model.duration,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: model.busy
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
                                title: Text(
                              '${track.index.toString().padLeft(totalTrackDigits, '0')} - ${track.title}',
                              overflow: TextOverflow.ellipsis,
                            )),
                          );
                        },
                      ),
              )
            ],
          ),
        );
        // }
      },
    );
  }
}
