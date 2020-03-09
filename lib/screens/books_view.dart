import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/ui/book_grid_item.dart';
import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audiobookly/core/viewmodels/books_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/ui/scaffold_without_footer.dart';

class BooksView extends StatelessWidget {
  final String mediaId;
  final String title;

  BooksView({
    this.mediaId,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ServerCommunicator communicator = Provider.of(context);

    return ScaffoldWithoutFooter(
      title: Text(title ?? 'Books'),
      body: BaseWidget<BooksViewModel>(
          model: BooksViewModel(communicator: communicator),
          onModelReady: (model) {
            model.getAlbums(mediaId);
          },
          builder: (context, model, child) {
            if (model.busy)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              return RefreshIndicator(
                onRefresh: () => model.onRefresh(mediaId),
                child: ResponsiveGridView(
                  children: model.books.map((book) {
                    return BookGridItem(
                      onTap: () {
                        NavigationService().pushNamed(
                          Routes.Book,
                          arguments: book.id,
                        );
                      },
                      thumbnailUrl: book.artUri,
                      title: book.title,
                      subtitle: book.artist,
                    );
                  }).toList(),
                ),
              );
            }
          }),
    );
  }
}
