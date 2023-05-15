import 'dart:io';

import 'package:audiobookly/material_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRow extends HookConsumerWidget {
  // final List<MediaItem> books;
  final String? title;
  final List<ModelUnion>? items;
  final double? height;
  const HomeRow({Key? key, this.title, this.items, this.height})
      : super(key: key);

  Widget getListView(PlaybackController playbackController,
      NavigationService navigationService) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: items!.length,
      itemBuilder: (context, index) {
        final ModelUnion item = items![index];

        return item.maybeMap(
          orElse: () => const CoverItem(
            title: 'Good God we have a problem',
          ),
          book: (book) => CoverItem(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BookDetailsView(mediaId: book.value.id);
              }));
            },
            height: height,
            progress: Utils.getProgress(book: book.value),
            thumbnailUrl: book.value.artPath,
            title: book.value.title,
            subtitle: book.value.author,
            played: book.value.read,
          ),
          author: (author) => CoverItem(
            onTap: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BooksView(mediaId: author.value.id);
              }));
            },
            height: height,
            thumbnailUrl: author.value.artPath,
            title: author.value.name,
            icon: Icons.person,
            showTitle: true,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final navigationService = ref.watch(navigationServiceProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 8.0),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SizedBox(
            height: height,
            child: Platform.isLinux || Platform.isWindows
                ? Scrollbar(
                    child: getListView(playbackController, navigationService))
                : getListView(playbackController, navigationService),
          ),
        ),
      ],
    );
  }
}
