import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/screens/authors_view.dart';
import 'package:audiobookly/screens/books_view.dart';
import 'package:audiobookly/screens/book_view.dart';
import 'package:audiobookly/screens/collections_view.dart';
import 'package:audiobookly/screens/login_view.dart';
import 'package:audiobookly/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.Authors:
        return MaterialPageRoute(builder: (_) => AuthorsView());
      case Routes.Books:
        return MaterialPageRoute(builder: (_) => BooksView());
      case Routes.Collections:
        return MaterialPageRoute(builder: (_) => CollectionsView());
      case Routes.Author:
        return MaterialPageRoute(
            builder: (_) => BooksView(
                  artistId: settings.arguments,
                ));
      case Routes.Collection:
        return MaterialPageRoute(
            builder: (_) => BooksView(
                  collectionFastKey: settings.arguments,
                ));
      case Routes.Book:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BookView(
                  book: args['book'],
                  server: args['server'],
                ));
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
