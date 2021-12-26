import './adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScaffoldState {
  final Widget? title;
  final List<Widget> actions;
  final Widget body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;
  final FloatingActionButton? floatingActionButton;
  final Widget? trailing;

  ScaffoldState({
    this.title,
    required this.body,
    this.actions = const [],
    required this.currentIndex,
    required this.destinations,
    this.onNavigationIndexChange,
    this.floatingActionButton,
    this.trailing,
  });
}

class AdaptiveScaffold extends HookWidget {
  final ScaffoldState state;
  AdaptiveScaffold({
    Key? key,
    Widget? title,
    required Widget body,
    List<Widget> actions = const [],
    required int currentIndex,
    required List<AdaptiveScaffoldDestination> destinations,
    ValueChanged<int>? onNavigationIndexChange,
    FloatingActionButton? floatingActionButton,
    Widget? trailing,
  })  : state = ScaffoldState(
          title: title,
          body: body,
          actions: actions,
          currentIndex: currentIndex,
          destinations: destinations,
          onNavigationIndexChange: onNavigationIndexChange,
          floatingActionButton: floatingActionButton,
          trailing: trailing,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
      selectedIndex: state.currentIndex,
      destinations: state.destinations,
      appBar: AdaptiveAppBar(
        title: state.title,
        actions: state.actions,
      ),
      body: state.body,
      onDestinationSelected: state.onNavigationIndexChange,
      includeBaseDestinationsInMenu: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    );
  }
}
