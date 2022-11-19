import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
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
        children: const <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        final repo = ref.watch(mediaRepositoryProvider);
        return FutureBuilder<List<MediaItem>>(
          future: repo?.search(query),
          builder: (context, results) {
            if (!results.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (results.data!.isNotEmpty) {
                return ResponsiveGridView<MediaItem>(
                    items: results.data,
                    itemBuilder: (item) {
                      return BookGridItem(
                        onTap: () async {
                          if (item.playable!) {
                            Navigator.of(context).pushNamed(
                              Routes.book,
                              arguments: item.id,
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => BooksView(
                                        mediaId: item.id,
                                        title: item.title,
                                      )),
                            );
                          }
                        },
                        thumbnailUrl: item.artUri?.toString(),
                        title: item.title,
                        subtitle: item.artist,
                        showTitle: !item.playable!,
                      );
                    });
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
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
