import 'dart:async';
import 'dart:io';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/device_info_service.dart';
import 'package:audiobookly/core/services/navigation_service.dart';
import 'package:audiobookly/core/services/playback_controller.dart';
import 'package:audiobookly/core/services/shared_preferences_service.dart';
import 'package:audiobookly/new_project_structure/state_notifiers/player/mini_player.dart';
import 'package:audiobookly/screens/welcome_view.dart';
import 'package:audiobookly/ui/adaptive_scaffold.dart';
import 'package:audiobookly/ui/auth_widget.dart';
import 'package:audiobookly/ui/router.dart' as r;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final info = await getDeviceInfo();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(prefs),
        ),
        deviceInfoServiceProvider.overrideWithValue(
          DeviceInfoService(info),
        )
      ],
      child: AudiobooklyApp(),
    ),
  );
}

Future<DeviceInfo> getDeviceInfo() async {
  if (kIsWeb || Platform.isWindows) {
    return DeviceInfo(
      uniqueId: 'AUDIOBOOKLY_WEB',
      model: 'Chrome',
      version: '0.0.1.0',
      platform: 'Chrome',
    );
  } else if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return DeviceInfo(
      uniqueId: androidDeviceInfo.androidId,
      model: androidDeviceInfo.model,
      version: androidDeviceInfo.version.release,
      platform: 'Android',
    );
  } else if (Platform.isIOS) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return DeviceInfo(
      uniqueId: iosInfo.identifierForVendor,
      model: iosInfo.model,
      platform: 'iOS',
      version: iosInfo.systemVersion,
    );
  } else {
    return DeviceInfo(
      uniqueId: 'AUDIOBOOKLY_WEB',
      model: 'Chrome',
      version: '0.0.1.0',
      platform: 'Unknown',
    );
  }
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
    final _currentIndex = useState(0);
    // timeDilation = 7.0;
    return MaterialApp(
      title: 'Audiobookly',
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: r.Router.generateRoute,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepPurple,
        canvasColor: Colors.grey[900],
      ),
      darkTheme: ThemeData(
        accentColor: Colors.deepPurple,
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
