// import 'package:audio_service/audio_service.dart';
// import 'package:audiobookly/core/database/database.dart';
// import 'package:audiobookly/core/services/audio_service.dart';
// import 'package:audiobookly/core/services/navigation_service.dart';
// import 'package:audiobookly/core/services/playback_controller.dart';
// import 'package:audiobookly/core/services/plex_server_communicator.dart';
// import 'package:audiobookly/core/services/server_communicator.dart';
// import 'package:audiobookly/repository/repository.dart';
// import 'package:audiobookly/ui/book_grid_item.dart';
// import 'package:audiobookly/ui/responsive_grid_view.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:audiobookly/core/viewmodels/books_view_model.dart';
// import 'package:audiobookly/ui/base_widget.dart';
// import 'package:audiobookly/core/constants/app_constants.dart';
// import 'package:audiobookly/ui/scaffold_without_footer.dart';

class TestDb extends StatelessWidget {
  TestDb();

  @override
  Widget build(BuildContext context) {
    // final ServerCommunicator communicator = Provider.of(context);
    // Repository.to.refreshDatabase();
    // ScaffoldWithoutFooter()
    return Container();
    // return ScaffoldWithoutFooter(
    //   title: Text('Books'),
    //   body: StreamBuilder<List<BookWithTracks>>(
    //       stream: Repository.to.allBooks,
    //       builder: (context, snapshot) {
    //         return RefreshIndicator(onRefresh: () async {
    //           await Repository.to.refreshDatabase();
    //         }, child: Builder(builder: (context) {
    //           if (snapshot.hasError) {
    //             return Center(
    //               child: Text(snapshot.error.toString()),
    //             );
    //           } else if (!snapshot.hasData) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           } else {
    //             return ResponsiveGridView<BookWithTracks>(
    //                 items: snapshot.data,
    //                 itemBuilder: (bookWithTracks) {
    //                   var book = bookWithTracks.book;
    //                   return BookGridItem(
    //                     onTap: () async {
    //                       await PlaybackController()
    //                           .playFromId(bookWithTracks.book.id);
    //                       // if (!AudioService.running) await startAudioService();
    //                       // await AudioService.playFromMediaId(book.id);
    //                       // NavigationService().pushNamed(
    //                       //   Routes.Book,
    //                       //   arguments: book,
    //                       // );
    //                     },
    //                     thumbnailUrl: communicator.getThumbnailUrl(book.artUrl),
    //                     title: book.title,
    //                     subtitle: bookWithTracks.author.title,
    //                   );
    //                 }
    //                 // snapshot.data.map((bookWithTracks) {
    //                 //   var book = bookWithTracks.book;
    //                 //   return BookGridItem(
    //                 //     onTap: () async {
    //                 //       // await NowPlayingController.to.playItem(bookWithTracks.book.id);
    //                 //       // if (!AudioService.running) await startAudioService();
    //                 //       // await AudioService.playFromMediaId(book.id);
    //                 //       // NavigationService().pushNamed(
    //                 //       //   Routes.Book,
    //                 //       //   arguments: book,
    //                 //       // );
    //                 //     },
    //                 //     thumbnailUrl:
    //                 //         communicator.getThumbnailUrl(book.artUrl),
    //                 //     title: book.title,
    //                 //     subtitle: bookWithTracks.author.title,
    //                 //   );
    //                 // }).toList(),
    //                 );
    //           }
    //         }));
    //       }),
    // );
  }
}
