import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/viewmodels/book_row_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/book_list_element.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/constants/app_constants.dart';

class BookRow extends StatelessWidget {
  // final List<MediaItem> books;
  final String title;
  final BookRowViewModel model;
  const BookRow({Key key, this.title, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BookRowViewModel>(
      model: model,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 8.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline,
                )),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.3
                        : MediaQuery.of(context).size.height * 0.71,
                // Expanded(
                child: model.busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.items.length,
                        itemBuilder: (context, index) {
                          final MediaItem book = model.items[index];
                          return BookListElement(
                            onTap: () async {
                              PlaybackController().playItem(book);
                              NavigationService()
                                  .pushNamed(Routes.Book, arguments: book);
                            },
                            progress: 0,
                            thumbnailUrl: book.artUri,
                            title: Text(
                              book.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subTitle: book.artist != null
                                ? Text(
                                    book.artist,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : null,
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
