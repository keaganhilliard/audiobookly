import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/constants/app_constants.dart';

class BookSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    ServerCommunicator theSearch = Provider.of<ServerCommunicator>(context);
    // theSearch.query(query);

    return FutureBuilder<List<MediaItem>>(
      future: theSearch.search(query),
      builder: (context, results) {
        if (!results.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (results.data.length > 0) {
            return ResponsiveGridView<MediaItem>(
                items: results.data,
                itemBuilder: (book) {
                  return BookGridItem(
                    onTap: () async {
                      await PlaybackController().playItem(book);
                      NavigationService().pushNamed(
                        Routes.Book,
                        arguments: book,
                      );
                    },
                    thumbnailUrl: book.artUri,
                    title: book.title,
                    subtitle: book.artist,
                  );
                });
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "No Results Found.",
                  ),
                ),
              ],
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
