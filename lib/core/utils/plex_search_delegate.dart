import 'package:audiobookly/core/models/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlexSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    Search theSearch = Provider.of<Search>(context);
    // theSearch.query(query);

    return FutureBuilder(
      future: theSearch.query(query),
      builder: (context, results) {
        if (!results.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          );
        } else {
          if (results.data.length > 0) {
            return ListView.builder(
              itemCount: results.data.length,
              itemBuilder: (context, index) {
                var result = results.data[index];
                return ListTile(
                  title: Text(result.title),
                  subtitle: Text(result.subTitle),
                );
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "No Results Found.",
                  ),
                ),
              ],
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
