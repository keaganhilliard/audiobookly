import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/widgets/ab_sliver_activity_indicator.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorsView extends HookConsumerWidget {
  final String? title;
  final String? previousPageTitle;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  AuthorsView({
    super.key,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authorsStateProvider);
    return AbScaffold(
        child: state.when(
      initial: () => const SliverToBoxAdapter(),
      loaded: (authors, total, page) => AbGrid(
        childCount: authors!.length,
        childBuilder: (context, index) {
          final author = authors[index];
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
      loading: () => const AbSliverActivityIndicator(),
      error: (message) => const SliverToBoxAdapter(),
    ));
  }
}
