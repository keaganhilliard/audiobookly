import 'package:audiobookly/material_ui/features/downloads/downloads_view.dart';
import 'package:audiobookly/utils/book_search_delegate.dart';
import 'package:audiobookly/material_ui/features/settings/settings_view.dart';
import 'package:flutter/material.dart';

class ScaffoldWithoutFooter extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final bool refresh;
  final bool showDownloads;
  final VoidCallback? onRefresh;
  final TabBar? tabBar;

  const ScaffoldWithoutFooter({
    super.key,
    this.title,
    this.body,
    this.refresh = false,
    this.showDownloads = true,
    this.onRefresh,
    this.tabBar,
  });

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).canvasColor,
        title: title,
        // actions: [
        //   if (refresh)
        //     IconButton(
        //       icon: const Icon(Icons.refresh),
        //       onPressed: () {
        //         onRefresh?.call();
        //       },
        //     ),
        //   if (showDownloads)
        //     IconButton(
        //       icon: const Icon(Icons.download_done),
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => const Downloads(),
        //           ),
        //         );
        //       },
        //     ),
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: BookSearchDelegate(),
        //       );
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     onPressed: () async {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => Scaffold(
        //             appBar: AppBar(
        //               title: const Text('Settings'),
        //             ),
        //             body: const SettingsView(),
        //           ),
        //         ),
        //       );
        //     },
        //   )
        // ],
      ),
      body: body,
    );
  }
}

class TabbedScaffold extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final bool refresh;
  final bool showDownloads;
  final VoidCallback? onRefresh;
  final TabBar? tabBar;

  const TabbedScaffold({
    super.key,
    this.title,
    this.body,
    this.refresh = false,
    this.showDownloads = true,
    this.onRefresh,
    this.tabBar,
  });

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: title,
        // actions: [
        // if (refresh)
        //   IconButton(
        //     icon: const Icon(Icons.refresh),
        //     onPressed: () {
        //       onRefresh?.call();
        //     },
        //   ),
        //   if (showDownloads)
        //     IconButton(
        //       icon: const Icon(Icons.download_done),
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => const Downloads(),
        //           ),
        //         );
        //       },
        //     ),
        //   IconButton(
        //     icon: const Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(
        //         context: context,
        //         delegate: BookSearchDelegate(),
        //       );
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     onPressed: () async {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => Scaffold(
        //             appBar: AppBar(
        //               title: const Text('Settings'),
        //             ),
        //             body: const SettingsView(),
        //           ),
        //         ),
        //       );
        //     },
        //   )
        // ],
        bottom: tabBar,
      ),
      body: body,
    );
  }
}
