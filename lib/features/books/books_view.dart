import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/features/book_details/book_details_view.dart';
import 'package:audiobookly/features/books/books_notifier.dart';
import 'package:audiobookly/features/books/books_state.dart';
import 'package:audiobookly/widgets/book_grid_item.dart';
import 'package:audiobookly/widgets/responsive_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';
import 'package:audiobookly/utils/utils.dart';

class BooksView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;

  const BooksView({this.mediaId, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = ref.watch(booksStateProvider!(mediaId).notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: Text(title ?? 'Books'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return booksProvider.getBooks();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(booksStateProvider!(mediaId));
            if (state is BooksStateInitial) _refresher.currentState!.show();
            if (state is BooksStateLoaded) {
              if (state.currentParent != mediaId) {
                _refresher.currentState!.show();
              }
              return ResponsiveGridView<MediaItem>(
                items: state.books,
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
                      thumbnailUrl: book.artUri.toString(),
                      title: book.title,
                      subtitle: book.artist,
                      progress: Utils.getProgess(item: book),
                      played: book.played,
                      placeholder: Icons.book,
                    ),
                  );
                },
              );
            } else if (state is BooksStateErrorDetails) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.message!),
                    ElevatedButton(
                      onPressed: _refresher.currentState!.show,
                      child: const Text('Retry'),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
