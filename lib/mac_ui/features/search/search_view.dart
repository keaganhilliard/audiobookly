import 'package:audiobookly/domain/search/search_notifier.dart';
import 'package:audiobookly/mac_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:audiobookly/utils/utils.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchStateProvider);
    return state.when(
      initial: () => Center(
        child: Text(
          'Type something to search',
          style: MacosTheme.of(context).typography.largeTitle,
        ),
      ),
      loading: () => const Center(
          child: CupertinoActivityIndicator(
        radius: 30.0,
      )),
      error: (message) => Center(
        child: Text(
          message ?? 'Error in search',
          style: MacosTheme.of(context).typography.largeTitle,
        ),
      ),
      loaded: (authorResults, bookResults, seriesResults) {
        return CustomScrollView(
          slivers: [
            if (authorResults != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    'Authors',
                    style: MacosTheme.of(context).typography.largeTitle,
                  ),
                ),
              ),
            if (authorResults != null)
              AbGrid(
                childCount: authorResults.length,
                childBuilder: (context, index) {
                  final author = authorResults[index];
                  return GridItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BooksView(
                            mediaId: author.id,
                          ),
                        ),
                      );
                    },
                    thumbnailUrl: author.artUri?.toString(),
                    title: author.title,
                    placeholder: CupertinoIcons.person_2_fill,
                    showTitle: true,
                  );
                },
              ),
            if (seriesResults != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    'Series',
                    style: MacosTheme.of(context).typography.largeTitle,
                  ),
                ),
              ),
            if (seriesResults != null)
              AbGrid(
                childCount: seriesResults.length,
                childBuilder: (context, index) {
                  final serie = seriesResults[index];
                  return GridItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BooksView(
                            title: serie.title,
                            previousPageTitle: 'Search',
                            mediaId: serie.id,
                          ),
                        ),
                      );
                    },
                    thumbnailUrl: serie.artUri?.toString(),
                    title: serie.title,
                    placeholder:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    showTitle: true,
                  );
                },
              ),
            if (bookResults != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    'Books',
                    style: MacosTheme.of(context).typography.largeTitle,
                  ),
                ),
              ),
            if (bookResults != null)
              AbGrid(
                childCount: bookResults.length,
                childBuilder: (context, index) {
                  final book = bookResults[index];
                  return GridItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => BookDetailsView(
                            mediaId: book.id,
                          ),
                        ),
                      );
                    },
                    thumbnailUrl: book.artUri?.toString(),
                    title: book.title,
                    placeholder: CupertinoIcons.book_fill,
                    showTitle: false,
                    played: book.played,
                    progress: book.played ? 0 : Utils.getProgress(item: book),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
