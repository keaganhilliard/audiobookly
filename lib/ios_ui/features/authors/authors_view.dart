import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorsView extends HookConsumerWidget {
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorsProvider = ref.watch(authorsStateProvider.notifier);
    final state = ref.watch(authorsStateProvider);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      resizeToAvoidBottomInset: false,
      child: AbGridView(
        title: 'Authors',
        onRefresh: () async {
          await authorsProvider.refresh();
        },
        child: state.when(
          initial: () => const SliverToBoxAdapter(),
          loaded: (authors) => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: authors!.length,
              (context, index) {
                final author = authors[index];
                return GridItem(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => BooksView(
                          mediaId: author.id,
                          title: author.title,
                          previousPageTitle: 'Authors',
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          ),
          loading: () => const SliverFillRemaining(
            child: Center(
              child: CupertinoActivityIndicator(radius: 30),
            ),
          ),
          error: (message) => const SliverToBoxAdapter(),
        ),
      ),
    );
  }
}
