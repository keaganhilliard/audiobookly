import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/domain/series/series_notifier.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class SeriesView extends HookConsumerWidget {
  const SeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final seriesProvider = ref.watch(seriesStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Series'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: () async {
          return seriesProvider.refresh();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(seriesStateProvider);
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (series) => ResponsiveGridView<MediaItem>(
                items: series,
                itemBuilder: (author) {
                  return OpenContainer(
                    closedElevation: 0.0,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) =>
                        BooksView(mediaId: author.id, title: author.title),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: openContainer,
                      thumbnailUrl: author.artUri?.toString(),
                      title: author.title,
                      placeholder: CupertinoIcons
                          .rectangle_fill_on_rectangle_angled_fill,
                      showTitle: true,
                    ),
                  );
                },
              ),
              error: (message) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Could not fetch series, is the device online?',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      refresher.currentState!.show();
                    },
                    child: const Text('Retry'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
