import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/domain/collections/collections_notifier.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class CollectionsView extends HookConsumerWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = ref.watch(collectionsStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Collections'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: () async {
          return booksProvider.refresh();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(collectionsStateProvider);
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (collections) {
                return ResponsiveGridView<Collection>(
                  items: collections,
                  itemBuilder: (collection) {
                    return OpenContainer(
                      key: Key(collection.name),
                      closedElevation: 0.0,
                      closedColor: Theme.of(context).canvasColor,
                      openColor: Theme.of(context).canvasColor,
                      openBuilder: (context, closeContainer) => BooksView(
                          mediaId: collection.id, title: collection.name),
                      closedBuilder: (context, openContainer) => BookGridItem(
                        onTap: openContainer,
                        thumbnailUrl: collection.artPath,
                        title: collection.name,
                        placeholder: Icons.collections_bookmark,
                        showTitle: true,
                      ),
                    );
                  },
                );
              },
              error: (message) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Could not fetch collections, is the device online?',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        booksProvider.refresh();
                      },
                      child: const Text('Retry'),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CollectionsComponent extends HookConsumerWidget {
  const CollectionsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksProvider = ref.watch(collectionsStateProvider.notifier);

    return RefreshIndicator(
      key: booksProvider.refreshKey,
      onRefresh: () async {
        return booksProvider.refresh();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(collectionsStateProvider);
          return state.maybeWhen(
            orElse: () => CustomScrollView(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (collections) {
              return ResponsiveGridView<Collection>(
                itemAspectRatio: singleTitleGridAspectRatio,
                items: collections,
                itemBuilder: (collection) {
                  return CoverItem(
                    onTap: () {
                      router.pushId(
                        collection.id,
                        extra: collection.name,
                      );
                    },
                    thumbnailUrl: collection.artPath,
                    title: collection.name,
                    icon:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    showTitle: true,
                  );
                },
              );
            },
            error: (message) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Could not fetch collections, is the device online?',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      booksProvider.refresh();
                    },
                    child: const Text('Retry'),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
