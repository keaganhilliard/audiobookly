// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class AdaptiveApp extends HookWidget {
//   const AdaptiveApp({super.key});

//   final destinations = <NavigationDestination>[];

//   @override
//   Widget build(BuildContext context) {
//     // AdaptiveLayout has a number of slots that take SlotLayouts and these
//     // SlotLayouts' configs take maps of Breakpoints to SlotLayoutConfigs.
//     return AdaptiveLayout(
//       // Primary navigation config has nothing from 0 to 600 dp screen width,
//       // then an unextended NavigationRail with no labels and just icons then an
//       // extended NavigationRail with both icons and labels.
//       primaryNavigation: SlotLayout(
//         config: <Breakpoint, SlotLayoutConfig>{
//           Breakpoints.medium: SlotLayout.from(
//             inAnimation: AdaptiveScaffold.leftOutIn,
//             key: const Key('Primary Navigation Medium'),
//             builder: (_) => AdaptiveScaffold.standardNavigationRail(
//               leading: const Icon(Icons.menu),
//               destinations: destinations
//                   .map((_) => AdaptiveScaffold.toRailDestination(_))
//                   .toList(),
//             ),
//           ),
//           Breakpoints.large: SlotLayout.from(
//             key: const Key('Primary Navigation Large'),
//             inAnimation: AdaptiveScaffold.leftOutIn,
//             builder: (_) => AdaptiveScaffold.standardNavigationRail(
//               extended: true,
//               leading: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const <Widget>[
//                   Text(
//                     'REPLY',
//                     style: TextStyle(color: Color.fromARGB(255, 255, 201, 197)),
//                   ),
//                   Icon(Icons.menu_open)
//                 ],
//               ),
//               destinations: destinations
//                   .map((_) => AdaptiveScaffold.toRailDestination(_))
//                   .toList(),
//               trailing: trailingNavRail,
//             ),
//           ),
//         },
//       ),
//       // Body switches between a ListView and a GridView from small to medium
//       // breakpoints and onwards.
//       body: SlotLayout(
//         config: <Breakpoint, SlotLayoutConfig>{
//           Breakpoints.small: SlotLayout.from(
//             key: const Key('Body Small'),
//             builder: (_) => ListView.builder(
//               itemCount: children.length,
//               itemBuilder: (BuildContext context, int index) => children[index],
//             ),
//           ),
//           Breakpoints.mediumAndUp: SlotLayout.from(
//             key: const Key('Body Medium'),
//             builder: (_) =>
//                 GridView.count(crossAxisCount: 2, children: children),
//           )
//         },
//       ),
//       // BottomNavigation is only active in small views defined as under 600 dp
//       // width.
//       bottomNavigation: SlotLayout(
//         config: <Breakpoint, SlotLayoutConfig>{
//           Breakpoints.small: SlotLayout.from(
//             key: const Key('Bottom Navigation Small'),
//             inAnimation: AdaptiveScaffold.bottomToTop,
//             outAnimation: AdaptiveScaffold.topToBottom,
//             builder: (_) => BottomNavigationBarTheme(
//               data: const BottomNavigationBarThemeData(
//                   selectedItemColor: Colors.black),
//               child: AdaptiveScaffold.standardBottomNavigationBar(
//                   destinations: destinations),
//             ),
//           )
//         },
//       ),
//     );
//   }

// }