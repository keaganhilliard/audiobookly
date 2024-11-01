import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  Widget? buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return const Column(
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

    return Consumer(
      builder: (context, ref, child) {
        final repo = ref.watch(mediaRepositoryProvider);
        return FutureBuilder<List<ModelUnion>>(
          future: repo?.search(query),
          builder: (context, results) {
            if (!results.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (results.data!.isNotEmpty) {
                return ResponsiveGridView<ModelUnion>(
                    items: results.data!.toList(),
                    itemBuilder: (item) {
                      return switch (item) {
                        BookValue(
                          value: Book(
                            :final id,
                            :final title,
                            :final artPath,
                            :final author
                          )
                        ) =>
                          CoverItem(
                            onTap: () {
                              context.push('/books/$id');
                            },
                            title: title,
                            subtitle: author,
                            thumbnailUrl: artPath,
                            showTitle: false,
                          ),
                        AuthorValue(
                          value: Author(:final id, :final name, :final artPath)
                        ) =>
                          CoverItem(
                            onTap: () => context.push(
                              '/${id.replaceFirst('@', '')}',
                              extra: name,
                            ),
                            title: name,
                            subtitle: "Author",
                            thumbnailUrl: artPath,
                            showTitle: true,
                            icon: CupertinoIcons.person_2_fill,
                          ),
                        SeriesValue(
                          value: Series(:final id, :final name, :final artPath)
                        ) =>
                          CoverItem(
                            onTap: () => context.push(
                              '/${id.replaceFirst('@', '')}',
                              extra: name,
                            ),
                            title: name,
                            subtitle: "Series",
                            thumbnailUrl: artPath,
                            showTitle: true,
                            icon: CupertinoIcons
                                .rectangle_fill_on_rectangle_angled_fill,
                          ),
                        _ => const CoverItem(
                            showTitle: true,
                            title: 'Unknown',
                          )
                      };
                    });
              } else {
                return const Column(
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
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return const Column();
  }
}
