import 'package:audiobookly/domain/collections/collections_notifier.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:audiobookly/mac_ui/features/home/home_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsView extends HookConsumerWidget {
  final String? title;
  final String? previousPageTitle;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  CollectionsView({
    super.key,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collectionsStateProvider);
    return AbScaffold(
        child: state.when(
      initial: () => const SliverToBoxAdapter(),
      loaded: (collections) => AbGrid(
        childCount: collections!.length,
        childBuilder: (context, index) {
          final collection = collections[index];
          return GridItem(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => BooksView(
                    mediaId: collection.id,
                  ),
                ),
              );
            },
            thumbnailUrl: collection.artUri?.toString(),
            title: collection.title,
            placeholder: CupertinoIcons.collections_solid,
            showTitle: true,
          );
        },
      ),
      loading: () => const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(radius: 30),
        ),
      ),
      error: (message) => const SliverToBoxAdapter(),
    ));
  }
}
