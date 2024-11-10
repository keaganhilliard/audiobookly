import 'dart:io';

import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/downloads/downloads_notifier.dart';
import 'package:audiobookly/domain/downloads/downloads_state.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Downloads extends HookConsumerWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final downloadsProvider = ref.watch(downloadsStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      showDownloads: false,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Downloads'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: () async {
          return downloadsProvider.getBooks();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  switch (ref.watch(downloadsStateProvider)) {
                    case DownloadsStateInitial():
                      refresher.currentState!.show();
                    case DownloadsStateError(:final message):
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(message ?? 'Unknown'),
                            ElevatedButton(
                              onPressed: refresher.currentState!.show,
                              child: const Text('Retry'),
                            )
                          ],
                        ),
                      );
                    case DownloadsStateLoaded(:final books):
                      return ResponsiveGridView(
                        itemAspectRatio: doubleTitleGridAspectRatio,
                        items: books,
                        itemBuilder: (book) {
                          return CoverItem(
                            onTap: () async {
                              context.push('/books/${book.id}');
                            },
                            thumbnailUrl: book.artPath,
                            title: book.title,
                            subtitle: book.author,
                            itemId: book.id,
                            icon: CupertinoIcons.book_fill,
                          );
                        },
                      );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
