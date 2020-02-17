import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/viewmodels/home_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/book_list_element.dart';
import 'package:flutter/material.dart';
import 'package:plex_api/plex_api.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlexServerV2 _server = Provider.of(context);
    final PlexLibrary _library = Provider.of(context);

    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(server: _server),
      onModelReady: (model) {
        model.getRecentlyAdded(_library.key);
        model.getRecentPlayed(_library.key);
      },
      builder: (context, model, child) {
        return ScaffoldWithoutFooter(
          title: Text('Audiobookly'),
          body: model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: EdgeInsets.only(bottom: 30.0),
                  children: [
                    BookRow(
                      books: model.recentlyPlayed,
                      title: 'In Progress',
                      server: _server,
                    ),
                    BookRow(
                      books: model.recentlyAdded,
                      title: 'Recently Added',
                      server: _server,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class BookRow extends StatelessWidget {
  final List<PlexAlbum> books;
  final PlexServerV2 server;
  final String title;
  const BookRow({Key key, this.books, this.server, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 10, 0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              )),
          SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.3
                  : MediaQuery.of(context).size.height * 0.71,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final PlexAlbum book = books[index];
                  print(book.toJson());
                  return BookListElement(
                    onTap: () {
                      NavigationService().pushNamed(Routes.Book, arguments: {
                        'server': server,
                        'book': book,
                      });
                    },
                    progress: index / 5,
                    thumbnailUrl: server.getUrlWithToken(book.thumb),
                    title: Text(
                      book.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subTitle: book.parentTitle != null
                        ? Text(
                            book.parentTitle,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                  );
                },
              )),
        ]);
  }
}
