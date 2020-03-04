import 'package:audiobookly/core/utils/book_search_delegate.dart';
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
            onPressed: () {},
          )
        ],
      ),
      body: body,
    );
  }
}
