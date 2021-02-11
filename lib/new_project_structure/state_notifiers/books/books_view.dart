import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/book_details/book_details_view.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_notifier.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_state.dart';
import 'package:audiobookly/screens/book_view.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class BooksView extends HookWidget {
  final String mediaId;
  final String title;

  BooksView({this.mediaId, this.title});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = useProvider(booksStateProvider);
    final state = useProvider(booksStateProvider.state);

    return ScaffoldWithoutFooter(
      title: Text(title ?? 'Books'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return booksProvider.getBooks(mediaId);
        },
        child: Builder(
          builder: (context) {
            if (state is BooksStateInitial) _refresher.currentState.show();
            if (state is BooksStateLoaded) {
              if (state.currentParent != mediaId)
                _refresher.currentState.show();
              return ResponsiveGridView<MediaItem>(
                items: state.books,
                itemBuilder: (book) {
                  return OpenContainer(
                    closedElevation: 0,
                    useRootNavigator: true,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) =>
                        BookDetailsView(mediaId: book.id),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: () async {
                        // await PlaybackController().playItem(book);
                        openContainer();
                        // NavigationService().pushNamed(
                        //   Routes.Book,
                        //   arguments: book,
                        // );
                      },
                      thumbnailUrl: book.artUri,
                      title: book.title,
                      subtitle: book.artist,
                    ),
                  );
                },
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
