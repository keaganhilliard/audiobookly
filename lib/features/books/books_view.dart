import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/features/book_details/book_details_view.dart';
import 'package:audiobookly/features/books/books_notifier.dart';
import 'package:audiobookly/features/books/books_state.dart';
import 'package:audiobookly/widgets/book_grid_item.dart';
import 'package:audiobookly/widgets/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';
import 'package:audiobookly/utils/utils.dart';

class BooksView extends HookWidget {
  final String mediaId;
  final String title;

  BooksView({this.mediaId, this.title});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = useProvider(booksStateProvider(mediaId).notifier);

    return ScaffoldWithoutFooter(
      title: Text(title ?? 'Books'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return booksProvider.getBooks();
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(booksStateProvider(mediaId));
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
                      thumbnailUrl: book.artUri.toString(),
                      title: book.title,
                      subtitle: book.artist,
                      progress: book.viewOffset.inMilliseconds /
                          book.duration.inMilliseconds,
                      played: book.played,
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
                    Container(
                      child: Text(state.message),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).accentColor,
                      ),
                      onPressed: _refresher.currentState.show,
                      child: Text('Retry'),
                    )
                  ],
                ),
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
