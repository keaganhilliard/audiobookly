import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService _instance;

  factory NavigationService() {
    if (_instance == null) _instance = NavigationService._internal();
    return _instance;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future pop() {
    return navigatorKey.currentState.maybePop();
  }

  Future pushNamed(String routeName, {arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future pushNamedAndRemoveUntilHome(String routeName, {arguments}) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(Routes.Home),
        arguments: arguments);
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
