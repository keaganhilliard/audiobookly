import 'package:audiobookly/domain/playlists/playlists_notifier.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/widgets/ab_grid_view.dart';
import 'package:audiobookly/ios_ui/widgets/grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistsView extends HookConsumerWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsProvider = ref.watch(playlistsStateProvider.notifier);
    final state = ref.watch(playlistsStateProvider);
    return LayoutBuilder(builder: (context, constraints) {
      return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        resizeToAvoidBottomInset: false,
        child: AbGridView(
          title: 'Playlists',
          onRefresh: () async {
            await playlistsProvider.refresh();
          },
          child: state.when(
            initial: () => const SliverToBoxAdapter(),
            loaded: (playlists) => SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: playlists!.length,
                (context, index) {
                  final playlist = playlists[index];
                  return GridItem(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => BooksView(
                            mediaId: playlist.id,
                            title: playlist.name,
                            previousPageTitle: 'Playlists',
                          ),
                        ),
                      );
                    },
                    thumbnailUrl: playlist.artPath,
                    title: playlist.name,
                    placeholder:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    showTitle: true,
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (constraints.maxWidth / 250).ceil(),
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CupertinoActivityIndicator(radius: 30),
              ),
            ),
            error: (message) => const SliverToBoxAdapter(),
          ),
        ),
      );
    });
  }
}
