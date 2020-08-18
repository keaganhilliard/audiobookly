import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/utils/book_search_delegate.dart';
import 'package:audiobookly/screens/settings_view.dart';
import 'package:audiobookly/screens/test_db.dart';
import 'package:flutter/material.dart';

class ScaffoldWithoutFooter extends StatelessWidget {
  final Widget title;
  final Widget body;

  ScaffoldWithoutFooter({this.title, this.body});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
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
              NavigationService()
                  .push(MaterialPageRoute(builder: (context) => TestDb()));
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
