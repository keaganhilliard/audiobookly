import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/books/books_view.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/home/home_view.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/authors/authors_view.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/player/player_view.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/collections/collections_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.Authors:
        return MaterialPageRoute(builder: (_) => AuthorsView());
      case Routes.Books:
        return MaterialPageRoute(builder: (_) => BooksView());
      case Routes.Collections:
        return MaterialPageRoute(builder: (_) => CollectionsView());
      // case Routes.Author:
      //   Map<String, dynamic> args = settings.arguments;
      //   return MaterialPageRoute(
      //       builder: (_) => BooksView(
      //             mediaId: args['authorId'],
      //             title: args['authorName'],
      //           ));
      // case Routes.Collection:
      //   Map<String, dynamic> args = settings.arguments;
      //   return MaterialPageRoute(
      //       builder: (_) => BooksView(
      //             mediaId: args['collectionId'],
      //             title: args['title'],
      //           ));
      case Routes.Book:
        return MaterialPageRoute(
            builder: (_) => PlayerView(
                  book: settings.arguments,
                ));
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
