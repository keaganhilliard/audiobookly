import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/widgets/book_list_element.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/utils/utils.dart';

class HomeRow extends StatelessWidget {
  // final List<MediaItem> books;
  final String title;
  final List<MediaItem> items;
  final double height;
  const HomeRow({Key key, this.title, this.items, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            height: height,
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
                  title: book.title,
                  subtitle: book?.artist ?? '',
                  played: book.played,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
