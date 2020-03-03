import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/viewmodels/home_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/book_list_element.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(communicator: Provider.of(context)),
      onModelReady: (model) async {
        model.getRecentlyAdded();
        model.getRecentPlayed();
      },
      builder: (context, model, child) {
        return ScaffoldWithoutFooter(
          title: Text('Audiobookly'),
          body: model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 40),
                    physics: AlwaysScrollableScrollPhysics(),

                    // shrinkWrap: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...getBookRow(
                          model.recentlyPlayed,
                          'In Progress',
                          context,
                        ),
                        ...getBookRow(
                          model.recentlyAdded,
                          'Recently Added',
                          context,
                        ),
                        // Expanded(
                        //   child: BookRow(
                        //     books: model.recentlyPlayed,
                        //     title: 'In Progress',
                        //   ),
                        // ),
                        // Expanded(
                        //   child: BookRow(
                        //     books: model.recentlyAdded,
                        //     title: 'Recently Added',
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  onRefresh: () async {
                    await model.onRefresh();
                  }),
          // ListView(
          //     padding: EdgeInsets.only(bottom: 30.0),
        );
      },
    );
  }
}

class BookRow extends StatelessWidget {
  final List<MediaItem> books;
  final String title;
  const BookRow({Key key, this.books, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
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
              // Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final MediaItem book = books[index];
                  return BookListElement(
                    onTap: () {
                      NavigationService()
                          .pushNamed(Routes.Book, arguments: book.id);
                    },
                    progress: 0,
                    thumbnailUrl: book.artUri,
                    title: Text(
                      book.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subTitle: book.artist != null
                        ? Text(
                            book.artist,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                  );
                },
              )),
        ]);
  }
}

List<Widget> getBookRow(
    List<MediaItem> books, String title, BuildContext context) {
  return [
    Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 10, 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        )),
    SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * 0.3
            : MediaQuery.of(context).size.height * 0.71,
        // Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            final MediaItem book = books[index];
            return BookListElement(
              onTap: () {
                NavigationService().pushNamed(Routes.Book, arguments: book.id);
              },
              progress: 0,
              thumbnailUrl: book.artUri,
              title: Text(
                book.title,
                overflow: TextOverflow.ellipsis,
              ),
              subTitle: book.artist != null
                  ? Text(
                      book.artist,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
            );
          },
        ))
  ];
}
