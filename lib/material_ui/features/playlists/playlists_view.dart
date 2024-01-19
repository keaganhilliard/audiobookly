import 'dart:io';

import 'package:animations/animations.dart';
import 'package:audiobookly/domain/playlists/playlists_notifier.dart';
import 'package:audiobookly/material_ui/features/books/books_view.dart';
import 'package:audiobookly/material_ui/widgets/book_grid_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class PlaylistsView extends HookConsumerWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refresher = GlobalKey<RefreshIndicatorState>();
    final booksProvider = ref.watch(playlistsStateProvider.notifier);

    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      onRefresh: refresher.currentState!.show,
      title: const Text('Playlists'),
      body: RefreshIndicator(
        key: refresher,
        onRefresh: booksProvider.refresh,
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(playlistsStateProvider);
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (playlists) {
                return ResponsiveGridView(
                  items: playlists,
                  itemBuilder: (playlist) {
                    return OpenContainer(
                      key: Key(playlist.id),
                      closedElevation: 0.0,
                      closedColor: Theme.of(context).canvasColor,
                      openColor: Theme.of(context).canvasColor,
                      openBuilder: (context, closeContainer) => BooksView(
                        mediaId: playlist.id,
                        title: playlist.name,
                      ),
                      closedBuilder: (context, openContainer) => BookGridItem(
                        onTap: openContainer,
                        thumbnailUrl: playlist.artPath,
                        title: playlist.name,
                        placeholder: CupertinoIcons.music_note_list,
                        showTitle: true,
                      ),
                    );
                  },
                );
              },
              error: (message) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Could not fetch playlists, is the device online?',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        booksProvider.refresh();
                      },
                      child: const Text('Retry'),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
