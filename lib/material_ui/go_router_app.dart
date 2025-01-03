// import 'package:audiobookly/domain/auth/auth_notifier.dart';
// import 'package:audiobookly/material_ui/features/offline/offline_view.dart';
import 'package:audiobookly/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AbMaterialApp extends HookConsumerWidget {
  const AbMaterialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final db = ref.watch(databaseServiceProvider);
    // final currentIndex = useState(0);
    // timeDilation = 7.0;
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Audiobookly',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(),
        brightness: Brightness.light,
        indicatorColor: Colors.deepPurple,
        secondaryHeaderColor: Colors.deepPurple,
        sliderTheme: const SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple,
          brightness: Brightness.light,
        ).copyWith(secondary: Colors.deepPurple),
        // canvasColor: Colors.grey[900],
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        indicatorColor: Colors.deepPurple,
        cardTheme: const CardTheme(
          clipBehavior: Clip.antiAlias,
          color: Colors.black,
        ),
        sliderTheme: const SliderThemeData(
          overlayColor: Colors.deepPurple,
          thumbColor: Colors.deepPurple,
          activeTrackColor: Colors.deepPurple,
        ),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurple,
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
        ).copyWith(secondary: Colors.deepPurple),
        // canvasColor: Colors.grey[900],
      ),
    );
  }
}
