import 'dart:async';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/shared_preferences_service.dart';
import 'package:audiobookly/core/viewmodels/root_view_model.dart';
import 'package:audiobookly/cubit/authors/authors_cubit.dart';
import 'package:audiobookly/cubit/books/books_cubit.dart';
import 'package:audiobookly/new_project_structure/main.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/ui/base_widget.dart';
import 'package:audiobookly/ui/router.dart' as r;
import 'package:audiobookly/ui/now_playing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
// import 'package:provider/provider.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/screens/web_app.dart' as web;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      // overrides: [
      //   sharedPreferencesServiceProvider.overrideWithValue(
      //     SharedPreferencesService()..init(),
      //   )
      // ],
      child: AudiobooklyApp(),
    ),
  );
}

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // timeDilation = 7.0;
//     return MaterialApp(
//       title: 'Audiobookly',
//       navigatorKey: NavigationService().navigatorKey,
//       onGenerateRoute: r.Router.generateRoute,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         accentColor: Colors.deepPurple,
//         canvasColor: Colors.grey[900],
//       ),
//       darkTheme: ThemeData(
//         accentColor: Colors.deepPurple,
//         brightness: Brightness.dark,
//         canvasColor: Colors.grey[900],
//       ),
//       home: BaseWidget<RootViewModel>(
//         model: RootViewModel(),
//         onModelReady: (model) => model.init(),
//         builder: (context, model, child) {
//           return MediaQuery.of(context).size.width > 600
//               ?
//               // return ResponsiveBuilder(builder: (context, sizingInfo) {
//               // print(sizingInfo.screenSize);
//               // print(sizingInfo.deviceScreenType);
//               // if (sizingInfo.isTablet || sizingInfo.isDesktop)
//               web.MyHomePage(title: 'Audiobookly', model: model)
//               : MyHomePage(
//                   title: 'Audiobookly',
//                   model: model,
//                 );
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title, this.model}) : super(key: key);
//   final String title;
//   final RootViewModel model;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
//   final _navigatorKey = GlobalKey<NavigatorState>();
//   StreamSubscription notificationSub;
//   int _currentIndex = 0;
//   bool nowPlaying = true;

//   final routeMap = [
//     Routes.Home,
//     Routes.Authors,
//     Routes.Books,
//     Routes.Collections,
//   ];

//   void onNavigationTap(int index) {
//     if (index != _currentIndex) {
//       String oldRoute = routeMap[_currentIndex];
//       String newRoute = routeMap[index];
//       setState(() {
//         _currentIndex = index;
//       });
//       _navigatorKey.currentState
//           .pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(oldRoute));
//     }
//   }

//   @override
//   void initState() {
//     PlaybackController().init();

//     super.initState();
//   }

//   void connect() async {
//     notificationSub ??=
//         AudioService.notificationClickEventStream.listen((event) {
//       print(event);
//       if (PlaybackController().currentMediaItem != null && event)
//         NavigationService().pushNamedAndRemoveUntilHome(Routes.Book,
//             arguments: PlaybackController().currentMediaItem);
//     });
//     PlaybackController().handleResume();
//   }

//   @override
//   Widget build(BuildContext context) {
//     RootViewModel model = widget.model;

//     if (model == null || model.busy) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       return WillPopScope(
//         onWillPop: () async {
//           return !await _navigatorKey.currentState.maybePop();
//         },
//         child: Scaffold(
//           body: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   child: MultiProvider(
//                     providers: [
//                       BlocProvider.value(
//                         value: AuthorsCubit(model.communicator),
//                       ),
//                       BlocProvider.value(
//                         value: BooksCubit(model.communicator),
//                       ),
//                       Provider.value(
//                         value: model.communicator,
//                       ),
//                     ],
//                     child: Navigator(
//                       key: _navigatorKey,
//                       onGenerateRoute: r.Router.generateRoute,
//                       initialRoute: Routes.Home,
//                     ),
//                   ),
//                 ),
//                 MultiProvider(
//                     providers: [
//                       StreamProvider<PlaybackState>(
//                         create: (context) =>
//                             PlaybackController().playbackStateStream,
//                         initialData: PlaybackState(
//                           playing: false,
//                         ),
//                       ),
//                       StreamProvider<MediaItem>(
//                         create: (context) =>
//                             PlaybackController().currentMediaItemStream,
//                       ),
//                     ],
//                     child: Consumer<PlaybackState>(
//                       builder: (context, state, child) {
//                         MediaItem item = Provider.of(context);
//                         if (item != null &&
//                             PlaybackController().currentMediaItem != null &&
//                             state.processingState != AudioProcessingState.idle)
//                           return NowPlaying();
//                         else
//                           return Container();
//                       },
//                     )),
//               ]),
//           bottomNavigationBar: BottomNavigationBar(
//             showUnselectedLabels: true,
//             currentIndex: _currentIndex,
//             onTap: onNavigationTap,
//             unselectedItemColor: Theme.of(context).textTheme.headline6.color,
//             selectedItemColor: Colors.deepPurpleAccent,
//             // backgroundColor: Theme.of(context).accentColor,
//             elevation: 40.0,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Authors',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book),
//                 label: 'Books',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.collections_bookmark),
//                 label: 'Collections',
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }
