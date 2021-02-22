import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:audiobookly/utils/utils.dart';

class Destination {
  final String title;
  final IconData icon;

  const Destination({
    @required this.title,
    @required this.icon,
  });
}

class ScaffoldState {
  final Widget title;
  final List<Widget> actions;
  final Widget body;
  final int currentIndex;
  final List<Destination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  final FloatingActionButton floatingActionButton;
  final Widget trailing;

  ScaffoldState({
    this.title,
    this.body,
    this.actions = const [],
    @required this.currentIndex,
    @required this.destinations,
    this.onNavigationIndexChange,
    this.floatingActionButton,
    this.trailing,
  });
}

class AdaptiveScaffold extends HookWidget {
  final ScaffoldState state;

  AdaptiveScaffold({
    Widget title,
    Widget body,
    List<Widget> actions = const [],
    @required int currentIndex,
    @required List<Destination> destinations,
    ValueChanged<int> onNavigationIndexChange,
    FloatingActionButton floatingActionButton,
    Widget trailing,
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
        // appBar: AppBar(
        //   title: state.title,
        //   actions: state.actions,
        // ),
        body: Row(
          children: [
            NavigationRail(
              elevation: 10.0,
              backgroundColor: Theme.of(context).canvasColor,
              selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
              selectedLabelTextStyle: TextStyle(
                color: Theme.of(context).accentColor,
              ),
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
              onDestinationSelected: state.onNavigationIndexChange ?? (_) {},
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[900],
            ),
            Expanded(
              child: state.body,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: state.body,
      // appBar: AppBar(
      //   title: state.title,
      //   actions: state.actions,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).textTheme.headline6.color,
        selectedItemColor: Colors.deepPurpleAccent,
        // backgroundColor: Theme.of(context).accentColor,
        elevation: 40.0,
        items: [
          for (var destination in state.destinations)
            BottomNavigationBarItem(
              icon: Icon(destination.icon),
              label: destination.title,
            ),
        ],
        currentIndex: state.currentIndex,
        onTap: state.onNavigationIndexChange,
      ),
      floatingActionButton: state.floatingActionButton,
    );
  }
}
