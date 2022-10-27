import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/mac_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:audiobookly/mac_ui/features/home/home_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class BooksView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;
  final String? previousPageTitle;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  BooksView({
    super.key,
    this.mediaId,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(booksStateProvider(mediaId));
    return AbScaffold(
      child: state.when(
        initial: () => const SliverToBoxAdapter(),
        loaded: (books, mediaId) => AbGrid(
          childCount: books!.length,
          childBuilder: (context, index) {
            final book = books[index];
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
        loading: () => const SliverFillRemaining(
          child: Center(
            child: CupertinoActivityIndicator(radius: 30),
          ),
        ),
        error: (message) => const SliverToBoxAdapter(),
      ),
    );
  }
}
