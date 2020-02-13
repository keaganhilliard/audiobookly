import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/viewmodels/books_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/constants/app_constants.dart';

class BooksView extends StatelessWidget {
  final String collectionFastKey;
  final String artistId;

  BooksView({
    this.collectionFastKey,
    this.artistId,
  });

  @override
  Widget build(BuildContext context) {
    final PlexLibrary _library = Provider.of(context);
    final PlexServerV2 _server = Provider.of(context);

    return BaseWidget<BooksViewModel>(
        model: BooksViewModel(server: _server),
        onModelReady: (model) {
          if (collectionFastKey != null) {
            model.fetchAlbumsFromCollection(collectionFastKey);
          } else if (artistId != null) {
            model.fetchAlbumsByArtist(artistId);
          } else {
            model.fetchAllAlbums(_library.key);
          }
        },
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async => !await Navigator.of(context).maybePop(),
            child: model.busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    padding: EdgeInsets.all(10.0),
                    children: model.books.map((book) {
                      return BookGridItem(
                        onTap: () {
                          // Navigator.of(
                          //   context,
                          // )
                          NavigationService().pushNamed(
                            Routes.Book,
                            arguments: {
                              'server': _server,
                              'library': _library,
                              'book': book,
                            },
                          );
                        },
                        thumbnailUrl: _server.getUrlWithToken(book
                            .thumb), // '${_server.mainConnection.uri}/photo/:/transcode?width=200&height=200&X-Plex-Token=${_server.accessToken}&upscale=1&url=${Uri.encodeComponent(book.thumb)}',
                        title: book.title,
                        subtitle: book.parentTitle,
                      );
                    }).toList(),
                  ),
          );
        });
  }
}
