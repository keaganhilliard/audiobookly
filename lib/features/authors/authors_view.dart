import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/features/authors/authors_notifier.dart';
import 'package:audiobookly/features/authors/authors_state.dart';
import 'package:audiobookly/features/books/books_view.dart';
import 'package:audiobookly/widgets/book_grid_item.dart';
import 'package:audiobookly/widgets/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';

class AuthorsView extends HookWidget {
  AuthorsView();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = useProvider(authorsStateProvider.notifier);

    return ScaffoldWithoutFooter(
      title: Text('Authors'),
      body: RefreshIndicator(
        color: Theme.of(context).accentColor,
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return booksProvider.getAuthors();
        },
        child: Consumer(
          builder: (context, reader, child) {
            final state = reader(authorsStateProvider);
            if (state is AuthorsStateInitial) _refresher.currentState!.show();
            if (state is AuthorsStateLoaded) {
              return ResponsiveGridView<MediaItem>(
                items: state.authors,
                itemBuilder: (author) {
                  return OpenContainer(
                    closedElevation: 0.0,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) => BooksView(
                      mediaId: author.id,
                      title: author.title,
                    ),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: openContainer,
                      thumbnailUrl: author.artUri.toString(),
                      title: author.title,
                    ),
                  );
                },
              );
            } else if (state is AuthorsStateErrorDetails)
              return Column(
                children: [
                  Text('Could not fetch authors, is the device online?'),
                  TextButton(
                    onPressed: () {
                      _refresher.currentState!.show();
                    },
                    child: Text('Retry'),
                  )
                ],
              );
            else
              return Container();
          } as Widget Function(BuildContext, T Function<T>(ProviderBase<Object?, T>), Widget?),
        ),
      ),
    );
  }
}
