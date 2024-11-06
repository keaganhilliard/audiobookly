import 'dart:io';

import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/collections/collections_notifier.dart';
import 'package:audiobookly/domain/collections/collections_state.dart';
import 'package:audiobookly/material_ui/widgets/ab_error_widget.dart';
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

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Collections'),
      body: CollectionsComponent(),
    );
  }
}

class CollectionsComponent extends HookConsumerWidget {
  const CollectionsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();
    final booksProvider = ref.watch(collectionsStateProvider.notifier);

    return RefreshIndicator(
      key: refresher,
      onRefresh: () async {
        return booksProvider.refresh();
      },
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(collectionsStateProvider);
          switch (state) {
            case CollectionsStateInitial():
              refresher.currentState?.show();
            case CollectionsStateLoaded(:final collections):
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
            case CollectionsStateError(:final message):
              return ABErrorWidget(
                message: message,
                retry: () {
                  refresher.currentState?.show();
                },
              );
            default:
          }
          return CustomScrollView();
        },
      ),
    );
  }
}
