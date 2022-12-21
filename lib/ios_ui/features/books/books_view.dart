import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/ios_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class BooksView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;
  final String? previousPageTitle;

  const BooksView({
    super.key,
    this.mediaId,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksProvider = ref.watch(booksStateProvider(mediaId).notifier);
    final state = ref.watch(booksStateProvider(mediaId));
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
      resizeToAvoidBottomInset: false,
      child: AbGridView(
        title: title ?? 'Books',
        previousPageTitle: previousPageTitle,
        onSearchChanged: mediaId == null ? booksProvider.onSearch : null,
        onRefresh: () async {
          await booksProvider.refresh();
        },
        child: state.when(
          initial: () => const SliverToBoxAdapter(),
          loaded: (books, mediaId, totalItems) => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: books!.length,
              (context, index) {
                final book = books[index];
                return GridItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => BookDetailsView(mediaId: book.id),
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              crossAxisCount: 3,
            ),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(radius: 30),
            ),
          ),
          error: (message, error, stack) => const SliverToBoxAdapter(),
        ),
      ),
    );
  }
}
