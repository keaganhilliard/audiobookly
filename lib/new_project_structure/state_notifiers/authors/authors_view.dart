import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/authors/authors_notifier.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/authors/authors_state.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_state.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_view.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class AuthorsView extends HookWidget {
  AuthorsView();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final booksProvider = useProvider(authorsStateProvider);
    final state = useProvider(authorsStateProvider.state);

    return ScaffoldWithoutFooter(
      title: Text('Authors'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return booksProvider.getAuthors();
        },
        child: Builder(
          builder: (context) {
            if (state is AuthorsStateInitial) _refresher.currentState.show();
            if (state is AuthorsStateLoaded) {
              return ResponsiveGridView<MediaItem>(
                items: state.authors,
                itemBuilder: (author) {
                  return OpenContainer(
                    closedElevation: 0.0,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) =>
                        BooksView(mediaId: author.id, title: author.title),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: openContainer,
                      thumbnailUrl: author.artUri,
                      title: author.title,
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
