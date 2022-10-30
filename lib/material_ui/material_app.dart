import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/domain/auth/auth_notifier.dart';
import 'package:audiobookly/material_ui/features/offline/offline_view.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/navigation/navigation_service.dart';
import 'package:audiobookly/material_ui/features/player/mini_player.dart';
import 'package:audiobookly/material_ui/features/welcome_view/welcome_view.dart';
import 'package:audiobookly/material_ui/widgets/adaptive_scaffold.dart';
import 'package:audiobookly/material_ui/widgets/auth_widget.dart';
import 'package:audiobookly/material_ui/widgets/router.dart' as r;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/models/preferences.dart';

class AbMaterialApp extends HookConsumerWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final routeMap = [
    Routes.Home,
    Routes.Authors,
    Routes.Books,
    Routes.Collections,
    Routes.Series,
  ];

  AbMaterialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.watch(navigationServiceProvider);
    final db = ref.watch(databaseServiceProvider);
    final currentIndex = useState(0);
    // timeDilation = 7.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audiobookly',
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: r.Router.generateRoute,
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
      home: AuthWidget(
        loadingBuilder: (context) => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        authorizedBuilder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return !await _navigatorKey.currentState!.maybePop();
            },
            child: AdaptiveScaffold(
                title: const Text('Audiobookly'),
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
                    const MiniPlayer(),
                  ],
                ),
                currentIndex: currentIndex.value,
                onNavigationIndexChange: (index) {
                  if (index != currentIndex.value) {
                    String oldRoute = routeMap[currentIndex.value];
                    String newRoute = routeMap[index];
                    currentIndex.value = index;
                    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      newRoute,
                      ModalRoute.withName(oldRoute),
                    );
                  }
                },
                destinations: [
                  const Destination(
                    title: 'Home',
                    icon: Icons.home,
                  ),
                  const Destination(
                    title: 'Authors',
                    icon: Icons.person,
                  ),
                  const Destination(
                    title: 'Books',
                    icon: Icons.book,
                  ),
                  const Destination(
                    title: 'Collections',
                    icon: Icons.collections_bookmark,
                  ),
                  if (db.getPreferencesSync().serverType ==
                      ServerType.audiobookshelf)
                    const Destination(title: 'Series', icon: Icons.window),
                ]),
          );
        },
        unauthorizedBuilder: (context) => const WelcomeView(),
        errorBuilder: (context, error) => Scaffold(
          body: Consumer(
            builder: (context, ref, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                        'Could not connect to server, is the device online?'),
                  ),
                  ElevatedButton(
                    child: const Text('Offline Mode'),
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).checkToken();
                      ref.read(navigationServiceProvider).push(
                          MaterialPageRoute(
                              builder: (context) => const Offline()));
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Retry?'),
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).checkToken();
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
