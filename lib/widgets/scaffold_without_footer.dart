import 'package:audiobookly/features/downloads/downloads_view.dart';
import 'package:audiobookly/utils/book_search_delegate.dart';
import 'package:audiobookly/features/settings/settings_view.dart';
import 'package:flutter/material.dart';

class ScaffoldWithoutFooter extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final bool refresh;
  final bool showDownloads;
  final VoidCallback? onRefresh;

  ScaffoldWithoutFooter({
    this.title,
    this.body,
    this.refresh = false,
    this.showDownloads = true,
    this.onRefresh,
  });

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          if (refresh)
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                onRefresh?.call();
              },
            ),
          if (showDownloads)
            IconButton(
              icon: Icon(Icons.download_done),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Downloads(),
                  ),
                );
              },
            ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BookSearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Settings'),
                    ),
                    body: SettingsView(),
                  ),
                ),
              );
              // showModalBottomSheet(
              //     context: context,
              //     useRootNavigator: true,
              //     clipBehavior: Clip.antiAlias,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(15.0),
              //         topRight: Radius.circular(15.0),
              //         bottomLeft: Radius.circular(15.0),
              //         bottomRight: Radius.circular(15.0),
              //       ),
              //     ),
              //     builder: (context) {
              //       return SettingsView();
              //     });
            },
          )
        ],
      ),
      body: body,
    );
  }
}
