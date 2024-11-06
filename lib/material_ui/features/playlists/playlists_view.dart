import 'dart:io';

import 'package:audiobookly/constants/aspect_ratios.dart';
import 'package:audiobookly/domain/playlists/playlists_notifier.dart';
import 'package:audiobookly/domain/playlists/playlists_state.dart';
import 'package:audiobookly/material_ui/widgets/ab_error_widget.dart';
import 'package:audiobookly/material_ui/widgets/cover_item.dart';
import 'package:audiobookly/material_ui/widgets/responsive_grid_view.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';

class PlaylistsView extends HookConsumerWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWithoutFooter(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      title: const Text('Playlists'),
      body: PlaylistsComponent(),
    );
  }
}

class PlaylistsComponent extends HookConsumerWidget {
  const PlaylistsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<RefreshIndicatorState> refresher =
        GlobalKey<RefreshIndicatorState>();
    final booksProvider = ref.watch(playlistsStateProvider.notifier);

    return RefreshIndicator(
      key: refresher,
      onRefresh: booksProvider.refresh,
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(playlistsStateProvider);
          switch (state) {
            case PlaylistsStateInitial():
              refresher.currentState?.show();
              return CustomScrollView();
            case PlaylistsStateLoaded(:final playlists):
              return ResponsiveGridView(
                itemAspectRatio: singleTitleGridAspectRatio,
                items: playlists,
                itemBuilder: (playlist) {
                  return CoverItem(
                    onTap: () {
                      router.pushId(playlist.id, extra: playlist.name);
                    },
                    thumbnailUrl: playlist.artPath,
                    title: playlist.name,
                    icon: CupertinoIcons.music_note_list,
                    showTitle: true,
                  );
                },
              );
            case PlaylistsStateError(:final message):
              return ABErrorWidget(
                retry: () {
                  refresher.currentState?.show();
                },
                message: message,
              );
            default:
              return CustomScrollView();
          }
        },
      ),
    );
  }
}
