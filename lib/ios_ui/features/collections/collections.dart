import 'package:audiobookly/domain/collections/collections_notifier.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionsView extends HookConsumerWidget {
  const CollectionsView({super.key});
  final String title = 'Collections';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionsProvider = ref.watch(collectionsStateProvider.notifier);
    final state = ref.watch(collectionsStateProvider);
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      resizeToAvoidBottomInset: false,
      child: AbGridView(
        title: title,
        onRefresh: () async {
          await collectionsProvider.refresh();
        },
        child: state.when(
          initial: () => const SliverToBoxAdapter(),
          loaded: (collections) => SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: collections!.length,
              (context, index) {
                final serie = collections[index];
                return GridItem(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => BooksView(
                          mediaId: serie.id,
                          title: serie.title,
                          previousPageTitle: title,
                        ),
                      ),
                    );
                  },
                  thumbnailUrl: serie.artUri?.toString(),
                  title: serie.title,
                  placeholder: CupertinoIcons.collections_solid,
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
