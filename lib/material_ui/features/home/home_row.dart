import 'dart:io';

import 'package:audiobookly/material_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/model_union.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/router.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRow extends HookConsumerWidget {
  // final List<MediaItem> books;
  final String? title;
  final List<ModelUnion>? items;
  final double? height;
  const HomeRow({
    super.key,
    this.title,
    this.items,
    this.height,
  });

  Widget getListView(PlaybackController playbackController,
      NavigationService navigationService,
      [ScrollController? scrollController]) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      itemCount: items!.length,
      itemBuilder: (context, index) {
        final ModelUnion item = items![index];

        return switch (item) {
          BookValue(
            value: Book(
              :final id,
              :final progress,
              :final artPath,
              :final read,
              :final author,
              :final title,
            )
          ) =>
            CoverItem(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BookDetailsView(mediaId: id);
                    },
                  ),
                );
              },
              height: height,
              progress: progress,
              thumbnailUrl: artPath,
              title: title,
              subtitle: author,
              played: read,
            ),
          AuthorValue(
            value: Author(
              :final id,
              :final name,
              :final artPath,
            )
          ) =>
            CoverItem(
              onTap: () async {
                router.pushId(id, extra: name);
              },
              height: height,
              thumbnailUrl: artPath,
              title: name,
              icon: CupertinoIcons.person_2_fill,
              showTitle: true,
            ),
          SeriesValue(
            value: Series(
              :final id,
              :final name,
              :final artPath,
            )
          ) =>
            CoverItem(
              onTap: () async {
                router.pushId(id, extra: name);
              },
              height: height,
              thumbnailUrl: artPath,
              title: name,
              icon: CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
              showTitle: true,
            ),
          _ => const CoverItem(
              title: 'Good God we have a problem',
            ),
        };
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playbackController = GetIt.I<PlaybackController>();
    final navigationService = ref.watch(navigationServiceProvider);
    final scrollController = useScrollController(initialScrollOffset: 0.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 8.0),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SizedBox(
            height: height,
            child: Platform.isLinux || Platform.isWindows
                ? Scrollbar(
                    controller: scrollController,
                    child: getListView(
                      playbackController,
                      navigationService,
                      scrollController,
                    ),
                  )
                : getListView(playbackController, navigationService),
          ),
        ),
      ],
    );
  }
}
