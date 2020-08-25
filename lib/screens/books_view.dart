import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/books/books_cubit.dart';
import 'package:audiobookly/cubit/books/books_state.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class BooksView extends StatelessWidget {
  final String mediaId;
  final String title;
  final List<MediaItem> albums;

  BooksView({this.mediaId, this.title, this.albums});

  @override
  Widget build(BuildContext context) {
    final ServerCommunicator _communicator = Provider.of(context);
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    return ScaffoldWithoutFooter(
      title: Text(title ?? 'Books'),
      body: BlocProvider(
        create: (context) => BooksCubit(_communicator),
        child: Builder(
          builder: (context) => RefreshIndicator(
            key: _refresher,
            onRefresh: () async {
              print('refreshing');
              return BlocProvider.of<BooksCubit>(context).getBooks(mediaId);
            },
            child: BlocConsumer<BooksCubit, BooksState>(
              builder: (context, state) {
                if (state is BooksStateInitial) _refresher.currentState.show();
                if (state is BooksStateLoaded)
                  return ResponsiveGridView<MediaItem>(
                    items: state.books,
                    itemBuilder: (book) {
                      return BookGridItem(
                        onTap: () async {
                          await PlaybackController().playItem(book);
                          NavigationService().pushNamed(
                            Routes.Book,
                            arguments: book,
                          );
                        },
                        thumbnailUrl: book.artUri,
                        title: book.title,
                        subtitle: book.artist,
                      );
                    },
                  );
                else
                  return Container();
              },
              listener: (context, state) {
                if (state is BooksStateInitial) {
                  _refresher.currentState.show();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
