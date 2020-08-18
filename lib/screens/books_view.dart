import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/now_playing_controller.dart';
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
  final List<MediaItem> albums;

  BooksView({this.mediaId, this.title, this.albums});

  @override
  Widget build(BuildContext context) {
    final ServerCommunicator communicator = Provider.of(context);

    return ScaffoldWithoutFooter(
      title: Text(title ?? 'Books'),
      body: BaseWidget<BooksViewModel>(
          model: BooksViewModel(communicator: communicator),
          onModelReady: (model) {
            if (this.albums != null)
              model.setAlbums(albums);
            else
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
                child: ResponsiveGridView<MediaItem>(
                  items: model.books,
                  itemBuilder: (book) {
                    return BookGridItem(
                      onTap: () async {
                        await NowPlayingController.to.playItem(book);
                        // if (!AudioService.running) await startAudioService();
                        // await AudioService.playFromMediaId(book.id);
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
                ),
              );
            }
          }),
    );
  }
}
