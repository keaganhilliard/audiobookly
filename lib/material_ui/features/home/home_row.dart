import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:flutter/material.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRow extends HookConsumerWidget {
  // final List<MediaItem> books;
  final String? title;
  final List<MediaItem>? items;
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
        final MediaItem book = items![index];
        return CoverItem(
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BookDetailsView(mediaId: book.id);
            }));
          },
          height: height,
          progress: Utils.getProgress(item: book),
          thumbnailUrl: book.artUri?.toString(),
          title: book.title,
          subtitle: book.artist ?? '',
          played: book.played,
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
              style: Theme.of(context).textTheme.headline5,
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
