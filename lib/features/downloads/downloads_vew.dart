import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/features/downloads/downloads_notifier.dart';
import 'package:audiobookly/features/downloads/downloads_state.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/widgets/book_grid_item.dart';
import 'package:audiobookly/widgets/responsive_grid_view.dart';
import 'package:audiobookly/widgets/scaffold_without_footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/utils/utils.dart';

class Downloads extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refresher =
        GlobalKey<RefreshIndicatorState>();

    final downloadsProvider = useProvider(downloadsStateProvider.notifier);
    final playbackController = useProvider(playbackControllerProvider);
    final navigationService = useProvider(navigationServiceProvider);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid,
      showDownloads: false,
      onRefresh: () {
        _refresher.currentState!.show();
      },
      title: Text('Downloads'),
      body: RefreshIndicator(
        key: _refresher,
        onRefresh: () async {
          print('refreshing');
          return downloadsProvider.getBooks();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer(
                builder: (context, watch, child) {
                  final state = watch(downloadsStateProvider);
                  if (state is DownloadsStateInitial)
                    _refresher.currentState!.show();
                  if (state is DownloadsStateLoaded) {
                    // if (state.currentParent != mediaId)
                    // _refresher.currentState!.show();
                    return ResponsiveGridView<MediaItem>(
                      items: state.books,
                      itemBuilder: (book) {
                        return BookGridItem(
                          onTap: () async {
                            playbackController.playFromId(book.id);
                            navigationService.pushNamed(
                              Routes.Player,
                              arguments: book,
                            );
                          },
                          thumbnailUrl: book.artUri.toString(),
                          title: book.title,
                          subtitle: book.artist,
                          progress: book.duration != null
                              ? book.viewOffset.inMilliseconds /
                                  book.duration!.inMilliseconds
                              : 0,
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
                          Container(
                            child: Text(state.message!),
                          ),
                          ElevatedButton(
                            onPressed: _refresher.currentState!.show,
                            child: Text('Retry'),
                          )
                        ],
                      ),
                    );
                  } else
                    return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
