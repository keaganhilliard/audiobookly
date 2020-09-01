import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/cubit/authors/authors_cubit.dart';
import 'package:audiobookly/cubit/authors/authors_state.dart';
// import 'package:audiobookly/screens/book_view.dart';
import 'package:audiobookly/screens/books_view.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
// import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final ServerCommunicator _communicator = Provider.of(context);
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    return ScaffoldWithoutFooter(
      title: Text('Authors'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return context.bloc<AuthorsCubit>().getAuthors();
        },
        child: BlocConsumer<AuthorsCubit, AuthorsState>(
          builder: (context, state) {
            if (state is AuthorsStateInitial) _refresher.currentState.show();
            if (state is AuthorsStateLoaded)
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
            else if (state is AuthorsStateErrorDetails)
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(state.message),
                    ),
                    RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: _refresher.currentState.show,
                      child: Text('Retry'),
                    )
                  ],
                ),
              );
            else
              return Container();
          },
          listener: (context, state) {
            if (state is AuthorsStateInitial) {
              _refresher.currentState.show();
            }
          },
        ),
      ),
    );
  }
}
