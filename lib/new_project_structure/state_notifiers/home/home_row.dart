import 'package:audio_service/audio_service.dart';
// import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/viewmodels/book_row_view_model.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/book_list_element.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/utils/utils.dart';

class HomeRow extends StatelessWidget {
  // final List<MediaItem> books;
  final String title;
  final List<MediaItem> items;
  final double height;
  const HomeRow({Key key, this.title, this.items, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    print(deviceData.size.width);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            )),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: SizedBox(
            height: height ??
                (deviceData.orientation == Orientation.portrait ||
                        deviceData.size.width > 600
                    ? deviceData.size.height * 0.3
                    : deviceData.size.height * 0.71),
            // Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final MediaItem book = items[index];
                return BookListElement(
                  onTap: () async {
                    PlaybackController().playItem(book);
                    NavigationService().pushNamed(Routes.Book, arguments: book);
                  },
                  progress: book.viewOffset.inMilliseconds /
                      book.duration.inMilliseconds,
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
  }
}
