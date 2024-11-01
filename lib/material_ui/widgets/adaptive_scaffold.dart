import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:audiobookly/utils/utils.dart';

class Destination {
  final String title;
  final IconData icon;

  const Destination({
    required this.title,
    required this.icon,
  });
}

class ScaffoldState {
  final Widget? title;
  final List<Widget> actions;
  final Widget? body;
  final int currentIndex;
  final List<Destination> destinations;
  final ValueChanged<int>? onNavigationIndexChange;
  final FloatingActionButton? floatingActionButton;
  final Widget? trailing;

  ScaffoldState({
    this.title,
    this.body,
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
    super.key,
    Widget? title,
    Widget? body,
    List<Widget> actions = const [],
    required int currentIndex,
    required List<Destination> destinations,
    ValueChanged<int>? onNavigationIndexChange,
    FloatingActionButton? floatingActionButton,
    Widget? trailing,
  }) : state = ScaffoldState(
          title: title,
          body: body,
          actions: actions,
          currentIndex: currentIndex,
          destinations: destinations,
          onNavigationIndexChange: onNavigationIndexChange,
          floatingActionButton: floatingActionButton,
          trailing: trailing,
        );

  @override
  Widget build(BuildContext context) {
    if (Utils.isLargeScreen(context)) {
      return Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 20,
                ),
                Expanded(
                  child: NavigationRail(
                    elevation: 10.0,
                    backgroundColor: Theme.of(context).canvasColor,
                    leading: state.floatingActionButton,
                    destinations: [
                      for (var destination in state.destinations)
                        NavigationRailDestination(
                          icon: Icon(destination.icon),
                          label: Text(destination.title),
                        ),
                    ],
                    labelType: NavigationRailLabelType.all,
                    trailing: state.trailing,
                    selectedIndex: state.currentIndex,
                    onDestinationSelected:
                        state.onNavigationIndexChange ?? (_) {},
                  ),
                ),
              ],
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[800],
            ),
            Expanded(
              child: state.body!,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: state.body,
      bottomNavigationBar: NavigationBar(
        // unselectedItemColor: Theme.of(context).textTheme.titleLarge!.color,
        // selectedItemColor: Colors.deepPurpleAccent,
        elevation: 40.0,
        destinations: [
          for (var destination in state.destinations)
            NavigationDestination(
              icon: Icon(destination.icon),
              label: destination.title,
            ),
        ],
        selectedIndex: state.currentIndex,
        onDestinationSelected: state.onNavigationIndexChange,
      ),
      floatingActionButton: state.floatingActionButton,
    );
  }
}
