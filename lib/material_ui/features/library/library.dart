import 'package:audiobookly/material_ui/material_ui.dart';
import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(text: 'Books'),
              Tab(text: 'Authors'),
              Tab(text: 'Series'),
              Tab(text: 'Playlists'),
              Tab(text: 'Collections'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BooksView(),
            AuthorsView(),
            SeriesView(),
            PlaylistsView(),
            CollectionsView(),
          ],
        ),
      ),
    );
  }
}
