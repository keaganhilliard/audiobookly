import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future pushNamed(String routeName, {arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future push(Route route) {
    return navigatorKey.currentState.push(route);
  }

  Future pushReplacement(Route route) {
    return navigatorKey.currentState.pushReplacement(route);
  }

  Future pushReplacementNamed(String routeName, {arguments}) {
    return navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
