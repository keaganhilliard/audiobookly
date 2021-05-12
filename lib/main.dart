import 'dart:async';
import 'dart:io';
import 'package:audio_service_platform_interface/audio_service_platform_interface.dart';
import 'package:audio_service_platform_interface/no_op_audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/services/device_info/device_info_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/services/shared_preferences/shared_preferences_service.dart';
import 'package:audiobookly/features/player/mini_player.dart';
import 'package:audiobookly/features/welcome_view/welcome_view.dart';
import 'package:audiobookly/widgets/adaptive_scaffold.dart';
import 'package:audiobookly/widgets/auth_widget.dart';
import 'package:audiobookly/widgets/router.dart' as r;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final info = await getDeviceInfo();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // final store = await getStore();

  PlaybackController controller;
  if (kIsWeb || (!Platform.isWindows && !Platform.isLinux)) {
    final handler = await initAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  } else {
    final handler = await initDesktopAudioHandler();
    controller = AudioHandlerPlaybackController(handler);
  }

  runApp(
    ProviderScope(
      overrides: [
        if (controller != null)
          playbackControllerProvider.overrideWithValue(
            controller,
          ),
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(prefs),
        ),
        deviceInfoServiceProvider.overrideWithValue(
          DeviceInfoService(info),
        ),
        // databaseServiceProvider.overrideWithValue(
        //   DatabaseService(store),
        // )
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
      title: 'Audiobookly',
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: r.Router.generateRoute,
      theme: ThemeData(
        brightness: Brightness.dark,
        indicatorColor: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        sliderTheme: SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        canvasColor: Colors.grey[900],
      ),
      darkTheme: ThemeData(
        accentColor: Colors.deepPurple,
        indicatorColor: Colors.deepPurple,
        sliderTheme: SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        brightness: Brightness.dark,
        canvasColor: Colors.grey[900],
      ),
      home: AuthWidget(
        authorizedBuilder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return !await _navigatorKey.currentState.maybePop();
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
                    _navigatorKey.currentState.pushNamedAndRemoveUntil(
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
