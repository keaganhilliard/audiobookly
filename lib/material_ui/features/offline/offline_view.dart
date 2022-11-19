import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/domain/offline/offline_notifier.dart';
import 'package:audiobookly/domain/offline/offline_state.dart';
import 'package:audiobookly/material_ui/features/player/mini_player.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class Offline extends HookConsumerWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();

    final offlineProvider = ref.watch(offlineStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: () {
        refresher.currentState!.show();
      },
      title: const Text('Books'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: () async {
          return offlineProvider.getBooks();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(offlineStateProvider);
                  if (state is OfflineStateInitial) {
                    refresher.currentState!.show();
                  }
                  if (state is OfflineStateLoaded) {
                    return ResponsiveGridView<MediaItem>(
                      items: state.books,
                      itemBuilder: (book) {
                        return BookGridItem(
                          onTap: () async {
                            Navigator.of(context)
                                .pushNamed(Routes.book, arguments: book.id);
                          },
                          thumbnailUrl: book.artUri?.toString(),
                          title: book.title,
                          subtitle: book.artist,
                          progress: Utils.getProgress(item: book),
                          played: book.played,
                        );
                      },
                    );
                  } else if (state is OfflineStateErrorDetails) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(state.message!),
                          ElevatedButton(
                            onPressed: refresher.currentState!.show,
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
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: MiniPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}
