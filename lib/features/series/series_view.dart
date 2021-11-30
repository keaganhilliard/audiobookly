import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/features/books/books_view.dart';
import 'package:audiobookly/features/series/series_notifier.dart';
import 'package:audiobookly/features/series/series_state.dart';
import 'package:audiobookly/widgets/book_grid_item.dart';
import 'package:audiobookly/widgets/responsive_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';

class SeriesView extends HookConsumerWidget {
  const SeriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final seriesProvider = ref.watch(seriesStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: const Text('Series'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return seriesProvider.getSeries();
        },
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(seriesStateProvider);
            if (state is SeriesStateInitial) {
              _refresher.currentState!.show();
            }
            if (state is SeriesStateLoaded) {
              return ResponsiveGridView<MediaItem>(
                items: state.series,
                itemBuilder: (author) {
                  return OpenContainer(
                    closedElevation: 0.0,
                    closedColor: Theme.of(context).canvasColor,
                    openColor: Theme.of(context).canvasColor,
                    openBuilder: (context, closeContainer) =>
                        BooksView(mediaId: author.id, title: author.title),
                    closedBuilder: (context, openContainer) => BookGridItem(
                      onTap: openContainer,
                      thumbnailUrl: author.artUri.toString(),
                      title: author.title,
                      placeholder: Icons.window,
                    ),
                  );
                },
              );
            }
            if (state is SeriesStateLoading) {
              return Container();
            } else {
              return Column(
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
                      _refresher.currentState!.show();
                    },
                    child: const Text('Retry'),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
