import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/material_ui/widgets/ab_error_widget.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
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
        refresher.currentState!.show();
      },
      title: Text(title ?? 'Books'),
      body: RefreshIndicator(
        key: refresher,
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
                  items: books,
                  itemBuilder: (book) {
                    return OpenContainer(
                      closedElevation: 0,
                      useRootNavigator: false,
                      closedColor: Theme.of(context).canvasColor,
                      openColor: Theme.of(context).canvasColor,
                      openBuilder: (context, closeContainer) =>
                          BookDetailsView(mediaId: book.id),
                      closedBuilder: (context, openContainer) => BookGridItem(
                        onTap: () async {
                          openContainer();
                        },
                        thumbnailUrl: book.artUri?.toString(),
                        title: book.title,
                        subtitle: book.artist,
                        progress: Utils.getProgress(item: book),
                        played: book.played,
                        placeholder: CupertinoIcons.book_fill,
                      ),
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
