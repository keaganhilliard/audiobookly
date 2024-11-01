import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/domain/authors/authors_state.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorsView extends HookConsumerWidget {
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      return CupertinoPageScaffold(
        key: UniqueKey(),
        backgroundColor: CupertinoColors.black,
        resizeToAvoidBottomInset: false,
        child: AbGridView(
            title: 'Authors',
            onRefresh: ref.read(authorsStateProvider.notifier).refresh,
            child: switch (ref.watch(authorsStateProvider)) {
              AuthorsStateInitial() => const SliverToBoxAdapter(),
              AuthorsStateLoading() => const SliverFillRemaining(
                  child: Center(
                    child: CupertinoActivityIndicator(radius: 30),
                  ),
                ),
              AuthorsStateLoaded(:final authors) => SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: authors!.length,
                    (context, index) {
                      final author = authors[index];
                      return GridItem(
                        onTap: () {
                          router.pushId(
                            author.id,
                            extra: author.name,
                          );
                        },
                        thumbnailUrl: author.largeArtPath,
                        title: author.name,
                        placeholder: CupertinoIcons.person_2_fill,
                        showTitle: true,
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (constraints.maxWidth / 250).ceil(),
                  ),
                ),
              AuthorsStateError(:final message) => SliverFillRemaining(
                  child: Center(
                    child: Text('$message'),
                  ),
                ),
            }),
      );
    });
  }
}
