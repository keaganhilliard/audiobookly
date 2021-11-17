import 'package:audiobookly/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationServiceProvider =
    Provider<NavigationService>((ref) => NavigationService());

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future pop([dynamic result]) {
    return navigatorKey.currentState!.maybePop(result);
  }

  Future pushNamed(String routeName, {arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future pushNamedAndRemoveUntilHome(String routeName, {arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(Routes.Home),
        arguments: arguments);
  }

  Future push(Route route) {
    return navigatorKey.currentState!.push(route);
  }

  Future pushReplacement(Route route) {
    return navigatorKey.currentState!.pushReplacement(route);
  }

  Future pushReplacementNamed(String routeName, {arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
