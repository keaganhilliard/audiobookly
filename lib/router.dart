import 'dart:async';
import 'dart:io';

import 'package:audiobookly/ios_ui/ios_ui.dart' as ios;
import 'package:audiobookly/mac_ui/mac_ui.dart' as mac;
import 'package:audiobookly/material_ui/material_ui.dart' as material;
import 'package:audiobookly/material_ui/widgets/adaptive_scaffold.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/database/isar_database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home('/'),
  login('/login'),
  absLogin('/login/abs'),
  library('/library'),
  books('/books'),
  book('/books/:id'),
  authors('/authors'),
  author('/authors/:id'),
  playlists('/playlists'),
  playlist('/playlists/:id'),
  collections('/collections'),
  collection('/collections/:id'),
  series('/series'),
  serie('/series/:id'),
  selectLibrary('/select-library'),
  formLogin('/form-login');

  const Routes(this.path);
  final String path;
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// GoRouter configuration
// state.pathParameters['id']
final prefsNotifier = PreferencesNotifier();
final router = GoRouter(
  refreshListenable: GoRouterRefreshStream(
    getIt<DatabaseService>().watchPreferences(),
  ),
  redirect: (context, state) {
    print(state.fullPath);
    final db = getIt<DatabaseService>();
    final prefs = db.getPreferencesSync();
    if (((state.fullPath ?? '').contains(Routes.login.path) ||
            state.fullPath == Routes.formLogin.path) &&
        prefs.userToken.isEmpty) {
      return null;
    }
    if (prefs.serverType == ServerType.unknown) return Routes.login.path;
    if (prefs.userToken.isEmpty) return Routes.login.path;
    if (prefs.libraryId.isEmpty) return Routes.selectLibrary.path;
    return null;
  },
  routes: [
    GoRoute(
      path: Routes.login.path,
      builder: (context, state) => const PlatformAwareBuilder(
        material: material.WelcomeView(),
        ios: ios.WelcomeView(),
        mac: mac.WelcomeView(),
      ),
    ),
    GoRoute(
      path: Routes.absLogin.path,
      builder: (context, state) => const PlatformAwareBuilder(
        material: material.AbsLogin(),
        ios: ios.AbsLogin(),
        mac: mac.LoginForm(
          serverType: ServerType.audiobookshelf,
        ),
      ),
    ),
    GoRoute(
      path: Routes.selectLibrary.path,
      builder: (context, state) => const PlatformAwareBuilder(
        ios: ios.IosLibrarySelectView(),
        mac: mac.MacosLibrarySelectView(),
        material: material.LibrarySelectView(),
      ),
    ),
    ShellRoute(
      routes: [
        GoRoute(
          path: Routes.home.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.HomeView(),
            mac: mac.Home(),
            ios: const ios.Home(),
          ),
        ),
        GoRoute(
          path: Routes.authors.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.AuthorsView(),
            mac: mac.AuthorsView(),
            ios: const ios.AuthorsView(),
          ),
        ),
        GoRoute(
          path: Routes.library.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.LibraryView(),
            mac: mac.AuthorsView(),
            ios: const ios.AuthorsView(),
          ),
        ),
        GoRoute(
          path: Routes.books.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.BooksView(),
            mac: mac.BooksView(),
            ios: const ios.BooksView(),
          ),
        ),
        GoRoute(
          path: Routes.series.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.SeriesView(),
            mac: mac.SeriesView(),
            ios: const ios.SeriesView(),
          ),
        ),
        GoRoute(
          path: Routes.playlists.path,
          builder: (context, state) => PlatformAwareBuilder(
            material: const material.PlaylistsView(),
            mac: mac.PlaylistsView(),
            ios: const ios.PlaylistsView(),
          ),
        ),
        GoRoute(
          path: Routes.book.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return PlatformAwareBuilder(
              ios: ios.BookDetailsView(mediaId: id!),
              mac: mac.BookDetailsView(mediaId: id),
              material: material.BookDetailsView(mediaId: id),
            );
          },
        ),
        GoRoute(
          path: Routes.author.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return PlatformAwareBuilder(
              ios: ios.BooksView(
                mediaId: '@authors/$id',
                title: '${state.extra}',
              ),
              mac: mac.BooksView(
                mediaId: '@authors/$id',
                title: '${state.extra}',
              ),
              material: material.BooksView(
                mediaId: '@authors/$id',
                title: '${state.extra}',
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.serie.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return PlatformAwareBuilder(
              ios: ios.BooksView(
                mediaId: '@series/$id',
                title: '${state.extra}',
              ),
              mac: mac.BooksView(
                mediaId: '@series/$id',
                title: '${state.extra}',
              ),
              material: material.BooksView(
                mediaId: '@series/$id',
                title: '${state.extra}',
              ),
            );
          },
        ),
      ],
      builder: (context, state, child) {
        return PlatformAwareBuilder(
            ios: AbCupertinoApp(
              child: child,
            ),
            mac: AbMaterialApp(
              child: child,
            ),
            material: AbMaterialApp(
              child: child,
            ));
      },
    ),
  ],
);

final routeMap = [
  Routes.home,
  Routes.library,
  Routes.books,
  Routes.series,
  Routes.playlists,
];

extension GoRouterEnums on BuildContext {
  goEnum(Routes route, {Object? extra}) => go(route.path, extra: extra);
}

class PlatformAwareBuilder extends StatelessWidget {
  final Widget ios;
  final Widget mac;
  final Widget material;

  const PlatformAwareBuilder({
    super.key,
    required this.ios,
    required this.mac,
    required this.material,
  });

  @override
  Widget build(BuildContext context) => switch (getPlatform()) {
        AbsPlatform.mac => mac,
        AbsPlatform.ios => ios,
        _ => material
      };
}

enum AbsPlatform { mac, windows, linux, ios, android, web, unknown }

AbsPlatform? _platform;

AbsPlatform getPlatform() {
  if (_platform == null) {
    if (kIsWeb) {
      _platform = AbsPlatform.web;
    } else if (Platform.isMacOS) {
      _platform = AbsPlatform.mac;
    } else if (Platform.isIOS) {
      _platform = AbsPlatform.ios;
    } else if (Platform.isWindows) {
      _platform = AbsPlatform.windows;
    } else if (Platform.isLinux) {
      _platform = AbsPlatform.linux;
    } else if (Platform.isAndroid) {
      _platform = AbsPlatform.android;
    } else {
      _platform = AbsPlatform.unknown;
    }
  }
  return _platform!;
}

class AbMaterialApp extends HookWidget {
  final Widget child;

  const AbMaterialApp({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final db = getIt<DatabaseService>();
    return AdaptiveScaffold(
      title: const Text('Audiobookly'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: child,
          ),
          const material.MiniPlayer(),
        ],
      ),
      currentIndex: currentIndex.value,
      onNavigationIndexChange: (index) {
        if (index != currentIndex.value) {
          final newRoute = routeMap[index];
          currentIndex.value = index;
          context.goEnum(newRoute);
        }
      },
      destinations: [
        const Destination(
          title: 'Home',
          icon: CupertinoIcons.house_fill,
        ),
        const Destination(
          title: 'Authors',
          icon: CupertinoIcons.person_2_fill,
        ),
        const Destination(
          title: 'Books',
          icon: CupertinoIcons.book_solid,
        ),
        if (db.getPreferencesSync().serverType == ServerType.audiobookshelf)
          const Destination(
            title: 'Series',
            icon: CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
          ),
        const Destination(
          title: 'Playlists',
          icon: CupertinoIcons.music_note_list,
        ),
      ],
    );
  }
}

class AbCupertinoApp extends HookWidget {
  final Widget child;

  const AbCupertinoApp({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
