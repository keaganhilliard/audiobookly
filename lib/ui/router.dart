import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/screens/authors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/home.dart';
import '../screens/login_form.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.Login:
        return MaterialPageRoute(builder: (_) => LoginForm());
      case Routes.Authors:
        return MaterialPageRoute(builder: (_) => Authors());
      case Routes.Collections:
      case Routes.Books:
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
