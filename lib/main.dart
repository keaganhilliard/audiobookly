import 'dart:async';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/features/player/mini_player.dart';
import 'package:audiobookly/features/welcome_view/welcome_view.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/widgets/adaptive_scaffold.dart';
import 'package:audiobookly/widgets/auth_widget.dart';
import 'package:audiobookly/widgets/router.dart' as r;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final info = await getDeviceInfo();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await registerSingletons();

  runApp(
    ProviderScope(
      overrides: [
        playbackControllerProvider.overrideWithValue(
          getIt<PlaybackController>(),
        ),
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(prefs),
        ),
        deviceInfoServiceProvider.overrideWithValue(
          DeviceInfoService(info),
        ),
        databaseServiceProvider.overrideWithValue(
          getIt<DatabaseService>(),
        )
      ],
      child: AudiobooklyApp(),
    ),
  );
}

class AudiobooklyApp extends HookWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final routeMap = [
    Routes.Home,
    Routes.Authors,
    Routes.Books,
    Routes.Collections,
  ];

  @override
  Widget build(BuildContext context) {
    final navigationService = useProvider(navigationServiceProvider);
    final _currentIndex = useState(0);
    // timeDilation = 7.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audiobookly',
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: r.Router.generateRoute,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        appBarTheme: AppBarTheme(),
        brightness: Brightness.light,
        indicatorColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        sliderTheme: SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        // canvasColor: Colors.grey[900],
      ),
      darkTheme: ThemeData(
        indicatorColor: Colors.deepPurple,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          color: Colors.black,
        ),
        accentColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple,
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
        ),
        sliderTheme: SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        brightness: Brightness.dark,
        // canvasColor: Colors.grey[900],
      ),
      home: AuthWidget(
        authorizedBuilder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return !await _navigatorKey.currentState!.maybePop();
            },
            child: AdaptiveScaffold(
                title: Text('Audiobookly'),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Navigator(
                        key: _navigatorKey,
                        onGenerateRoute: r.Router.generateRoute,
                        initialRoute: Routes.Home,
                      ),
                    ),
                    MiniPlayer(),
                  ],
                ),
                currentIndex: _currentIndex.value,
                onNavigationIndexChange: (index) {
                  if (index != _currentIndex.value) {
                    String oldRoute = routeMap[_currentIndex.value];
                    String newRoute = routeMap[index];
                    _currentIndex.value = index;
                    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        newRoute, ModalRoute.withName(oldRoute));
                  }
                },
                destinations: [
                  Destination(
                    title: 'Home',
                    icon: Icons.home,
                  ),
                  Destination(
                    title: 'Authors',
                    icon: Icons.person,
                  ),
                  Destination(
                    title: 'Books',
                    icon: Icons.book,
                  ),
                  Destination(
                    title: 'Collections',
                    icon: Icons.collections_bookmark,
                  ),
                ]),
          );
        },
        unauthorizedBuilder: (context) => WelcomeView(),
      ),
    );
  }
}
