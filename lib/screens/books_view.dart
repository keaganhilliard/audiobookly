import 'package:audiobookly/ui/book_list_element.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/viewmodels/books_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';

class AlbumWidget extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String subtitle;

  AlbumWidget({this.thumbnailUrl, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: thumbnailUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(8.0, 2.0, 0, 1.0),
            subtitle: Text(subtitle),
            title: Text(title),
          ),
        ],
      ),
    );
  }
}

class BooksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlexLibrary _library = Provider.of(context);
    final PlexServerV2 _server = Provider.of(context);

    return BaseWidget<BooksViewModel>(
        model: BooksViewModel(server: _server),
        onModelReady: (model) {
          model.fetchAllAlbums(_library.key);
        },
        builder: (context, model, child) {
          return model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(10.0),
                  children: model.books.map((book) {
                    return AlbumWidget(
                      thumbnailUrl: _server.getUrlWithToken(book.thumb),
                      title: book.title,
                      subtitle: book.parentTitle,
                    );
//                    return BookListElement(
//                        progress: 0.0,
////                title: Text(book.title),
////                subTitle: Text(book.parentTitle),
//                        thumbnailUrl: _server.getUrlWithToken(book
//                            .thumb) //'${_server.mainConnection.uri}/photo/:/transcode?width=100&height=100&X-Plex-Token=${_server.accessToken}&url=${Uri.encodeComponent(book.thumb)}',
//                        );

//              return
//                GridTile(
//                footer: GestureDetector(
//                  onTap: () {},
//                  child: GridTileBar(
//                    backgroundColor: Colors.black45,
//                    title: _GridTitleText(book.title),
//                    subtitle: _GridTitleText(book.parentTitle),
//                  ),
//                ),
//                child: CachedNetworkImage(
//                  imageUrl: _server.getUrlWithToken(book.thumb),),
//              );
                  }).toList(),
                );
//              : GridView.builder(
//                  padding: EdgeInsets.all(10),
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2),
//                  itemCount: model.books.length,
//                  itemBuilder: (context, index) {
//                    final PlexAlbum book = model.books[index];
//                    return
////                      GridTile(
////                      child: Text(book.parentTitle),
////                      header: CachedNetworkImage(imageUrl: _server.getUrlWithToken(book.thumb),),
////                      footer: ListTile(
////                        title: Text(book.title),
////                      ),
////                    );
//                      GridTile(
//                        footer: GestureDetector(
//                          onTap: () { },
//                          child: GridTileBar(
//                            backgroundColor: Colors.black45,
//                            title: _GridTitleText(book.title),
//                            subtitle: _GridTitleText(book.parentTitle),
//                          ),
//                        ),
//                        child: CachedNetworkImage(imageUrl: _server.getUrlWithToken(book.thumb),),
//                      );
//                  },
//                );
        });
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}
