import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/material_ui/widgets/ab_error_widget.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:audiobookly/utils/utils.dart';

class BooksView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;

  const BooksView({super.key, this.mediaId, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = ref.watch(booksStateProvider(mediaId).notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        booksProvider.refreshKey.currentState?.show();
      },
      title: Text(title ?? 'Books'),
      body: RefreshIndicator(
        key: booksProvider.refreshKey,
        onRefresh: () async {
          return booksProvider.refresh();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(booksStateProvider(mediaId));
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (books, currentParent, totalItems) {
                return ResponsiveGridView<MediaItem>(
                  itemAspectRatio: doubleTitleGridAspectRatio,
                  items: books,
                  itemBuilder: (book) {
                    return CoverItem(
                      onTap: () async {
                        router.pushEnumWithId(Routes.book, book.id);
                      },
                      thumbnailUrl: book.artUri?.toString(),
                      title: book.title,
                      subtitle: book.artist,
                      progress: Utils.getProgress(item: book),
                      played: book.played,
                      icon: CupertinoIcons.book_fill,
                    );
                  },
                );
              },
              error: (message, error, stack) {
                return ABErrorWidget(
                  message: message,
                  error: error,
                  stack: stack,
                  retry: booksProvider.refresh,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
