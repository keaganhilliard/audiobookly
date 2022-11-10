import 'package:audiobookly/mac_ui/features/welcome/welcome_view.dart';
import 'package:audiobookly/mac_ui/features/home/home.dart';
import 'package:audiobookly/mac_ui/features/login_form/login_form_view.dart';
import 'package:audiobookly/material_ui/widgets/auth_widget.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class MacApp extends HookConsumerWidget {
  const MacApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosApp(
      navigatorKey: ref.read(navigationServiceProvider).navigatorKey,
      title: 'Audiobookly',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark().copyWith(
        iconTheme: MacosThemeData.dark().iconTheme.copyWith(
              color: Colors.deepPurple,
            ),
        primaryColor: Colors.deepPurple,
        pushButtonTheme: MacosThemeData.dark().pushButtonTheme.copyWith(
              color: Colors.deepPurple,
            ),
        // iconButtonTheme: MacosThemeData.dark().iconButtonTheme.copyWith(
        //       backgroundColor: Colors.deepPurple,
        //     ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: AuthWidget(
        authorizedBuilder: (context) => Home(),
        errorBuilder: (context, message) => Container(),
        loadingBuilder: (context) => const CupertinoActivityIndicator(
          radius: 30.0,
        ),
        unauthorizedBuilder: (context) => MacosSheet(
            child: CupertinoTabView(builder: (context) => const WelcomeView())),
      ),
    );
  }
}
