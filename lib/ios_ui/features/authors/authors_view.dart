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
    return LayoutBuilder(builder: (context, constraints) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        resizeToAvoidBottomInset: false,
        child: AbGridView(
          title: 'Authors',
          onRefresh: ref.read(authorsStateProvider.notifier).refresh,
          child: ref.watch(authorsStateProvider).when(
                initial: () => const SliverToBoxAdapter(),
                loaded: (authors, total, page) => SliverGrid(
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (constraints.maxWidth / 250).ceil(),
                  ),
                ),
                loading: () => const SliverFillRemaining(
                  child: Center(
                    child: CupertinoActivityIndicator(radius: 30),
                  ),
                ),
                error: (message) => SliverFillRemaining(
                  child: Center(
                    child: Text('$message'),
                  ),
                ),
              ),
        ),
      );
    });
  }
}
