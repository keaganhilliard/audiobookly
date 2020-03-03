import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/screens/authors_view.dart';
import 'package:audiobookly/screens/books_view.dart';
import 'package:audiobookly/screens/book_view.dart';
import 'package:audiobookly/screens/collections_view.dart';
import 'package:audiobookly/screens/login_view.dart';
import 'package:audiobookly/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.Authors:
        return MaterialPageRoute(builder: (_) => AuthorsView());
      case Routes.Books:
        return MaterialPageRoute(builder: (_) => BooksView());
      case Routes.Collections:
        return MaterialPageRoute(builder: (_) => CollectionsView());
      case Routes.Author:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BooksView(
                  mediaId: args['authorId'],
                  title: args['authorName'],
                ));
      case Routes.Collection:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BooksView(
                  mediaId: args['collectionId'],
                  title: args['title'],
                ));
      case Routes.Book:
        return MaterialPageRoute(
            builder: (_) => BookView(
                  bookId: settings.arguments,
                ));
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}
