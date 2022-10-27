import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/domain/downloads/downloads_notifier.dart';
import 'package:audiobookly/domain/downloads/downloads_state.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class Downloads extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final downloadsProvider = ref.watch(downloadsStateProvider.notifier);
    final playbackController = GetIt.I<PlaybackController>();
    final navigationService = ref.watch(navigationServiceProvider);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      showDownloads: false,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: const Text('Downloads'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          return downloadsProvider.getBooks();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(downloadsStateProvider);
                  if (state is DownloadsStateInitial) {
                    _refresher.currentState!.show();
                  }
                  if (state is DownloadsStateLoaded) {
                    return ResponsiveGridView<MediaItem>(
                      items: state.books,
                      itemBuilder: (book) {
                        return BookGridItem(
                          onTap: () async {
                            Navigator.of(context)
                                .pushNamed(Routes.Book, arguments: book.id);
                            // playbackController.playFromId(book.id);
                            // navigationService.pushNamed(
                            //   Routes.Player,
                            //   arguments: book,
                            // );
                          },
                          thumbnailUrl: book.artUri?.toString(),
                          title: book.title,
                          subtitle: book.artist,
                          progress: Utils.getProgress(item: book),
                          played: book.played,
                        );
                      },
                    );
                  } else if (state is DownloadsStateErrorDetails) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.message!),
                          ElevatedButton(
                            onPressed: _refresher.currentState!.show,
                            child: const Text('Retry'),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
