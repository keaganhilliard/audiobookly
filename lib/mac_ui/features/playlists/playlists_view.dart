import 'package:audiobookly/domain/playlists/playlists_notifier.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/widgets/ab_grid.dart';
import 'package:audiobookly/mac_ui/widgets/ab_scaffold.dart';
import 'package:audiobookly/mac_ui/widgets/grid_item.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistsView extends HookConsumerWidget {
  final String? title;
  final String? previousPageTitle;
  final Debouncer debouncer = Debouncer(milliseconds: 1);

  PlaylistsView({
    super.key,
    this.title,
    this.previousPageTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(playlistsStateProvider);
    return AbScaffold(
        child: state.when(
      initial: () => const SliverToBoxAdapter(),
      loaded: (playlists) => AbGrid(
        childCount: playlists!.length,
        childBuilder: (context, index) {
          final playlist = playlists[index];
          return GridItem(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => BooksView(
                    mediaId: playlist.id,
                  ),
                ),
              );
            },
            thumbnailUrl: playlist.artPath,
            title: playlist.name,
            placeholder: CupertinoIcons.music_note_list,
            showTitle: true,
          );
        },
      ),
      loading: () => const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(radius: 30),
        ),
      ),
      error: (message) => const SliverToBoxAdapter(),
    ));
  }
}
