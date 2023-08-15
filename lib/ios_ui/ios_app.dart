import 'package:audiobookly/ios_ui/features/home/home.dart';
import 'package:audiobookly/ios_ui/features/welcome/welcome_view.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/material_ui/widgets/auth_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IosApp extends HookConsumerWidget {
  const IosApp({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final navigationService = ref.watch(navigationServiceProvider);
    return CupertinoApp(
    
      // showPerformanceOverlay: true,
      navigatorKey: navigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(103, 58, 183, 1),
      ),
      home: AuthWidget(
        authorizedBuilder: (context) => const Home(),
        errorBuilder: (context, message) => Container(),
        loadingBuilder: (context) => const CupertinoActivityIndicator(
          radius: 30.0,
        ),
        unauthorizedBuilder: (context) => const WelcomeView(),
      ),
    );
  }
}
