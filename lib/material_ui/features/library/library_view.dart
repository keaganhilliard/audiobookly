import 'dart:io';

import 'package:audiobookly/material_ui/features/narrators/narrators_view.dart';
import 'package:audiobookly/material_ui/material_ui.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryView extends HookConsumerWidget {
  final String? mediaId;
  final String? title;

  const LibraryView({super.key, this.mediaId, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 6);

    return TabbedScaffold(
      refresh: !kIsWeb && !Platform.isAndroid && !Platform.isIOS,
      // title: Text(title ?? 'Books'),
      tabBar: TabBar(
        isScrollable: true,
        tabs: const [
          Tab(text: "Books"),
          Tab(text: "Authors"),
          Tab(text: "Series"),
          Tab(text: "Playlists"),
          Tab(text: "Collections"),
          Tab(text: "Narrators"),
        ],
        controller: tabController,
        labelColor: Colors.deepPurpleAccent,
        indicatorColor: Colors.deepPurpleAccent,
        dividerColor: Colors.transparent,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const BooksComponent(key: PageStorageKey('books')),
          const AuthorsComponent(key: PageStorageKey('authors')),
          const SeriesComponent(key: PageStorageKey('series')),
          const PlaylistsComponent(key: PageStorageKey('playlists')),
          const CollectionsComponent(key: PageStorageKey('collections')),
          const NarratorsComponent(key: PageStorageKey('narrators')),
        ],
      ),
    );
  }
}
