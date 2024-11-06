import 'dart:async';
import 'package:audiobookly/material_ui/material_ui.dart' as material;
import 'package:audiobookly/material_ui/widgets/adaptive_scaffold.dart';
import 'package:audiobookly/material_ui/widgets/scaffold_without_footer.dart';
import 'package:audiobookly/models/preferences.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/singletons.dart';
import 'package:audiobookly/utils/book_search_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  home('/'),
  login('/login'),
  absLogin('/login/abs'),
  libraryBooks('/library/books'),
  libraryAuthors('/library/authors'),
  librarySeries('/library/series'),
  libraryPlaylists('/library/playlists'),
  libraryCollections('/library/collections'),
  books('/books'),
  book('/books/:id'),
  authors('/authors'),
  author('/authors/:id'),
  narrator('/narrators/:name'),
  playlists('/playlists'),
  playlist('/playlists/:id'),
  collections('/collections'),
  collection('/collections/:id'),
  series('/series'),
  serie('/series/:id'),
  selectLibrary('/select-library'),
  settings('/settings'),
  downloads('/downloads'),
  search('/search'),
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
final rootKey = GlobalKey<NavigatorState>();
final homeKey = GlobalKey<NavigatorState>();
final authorsKey = GlobalKey<NavigatorState>();
final prefsNotifier = PreferencesNotifier();
final router = GoRouter(
  navigatorKey: rootKey,
  refreshListenable: GoRouterRefreshStream(
    getIt<DatabaseService>().watchPreferences(),
  ),
  redirect: (context, state) {
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
      builder: (context, state) => const material.WelcomeView(),
    ),
    GoRoute(
      path: Routes.absLogin.path,
      builder: (context, state) => const material.AbsLogin(),
    ),
    GoRoute(
      path: Routes.selectLibrary.path,
      builder: (context, state) => const material.LibrarySelectView(),
    ),
    ShellRoute(
      routes: [
        GoRoute(
          path: Routes.home.path,
          builder: (context, state) => const material.HomeView(),
        ),
        GoRoute(
          path: Routes.authors.path,
          builder: (context, state) => const material.AuthorsView(),
        ),
        GoRoute(
          path: Routes.settings.path,
          builder: (context, state) => const ScaffoldWithoutFooter(
            title: Text('Settings'),
            body: material.SettingsView(),
          ),
        ),
        GoRoute(
          path: Routes.books.path,
          builder: (context, state) => const material.LibraryView(),
        ),
        GoRoute(
          path: Routes.series.path,
          builder: (context, state) => const material.SeriesView(),
        ),
        GoRoute(
          path: Routes.playlists.path,
          builder: (context, state) => const material.PlaylistsComponent(),
        ),
        GoRoute(
            path: Routes.playlist.path,
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return material.BooksView(
                mediaId: "@playlists/$id",
                title: '${state.extra}',
              );
            }),
        GoRoute(
            path: Routes.narrator.path,
            builder: (context, state) {
              final name = state.pathParameters['name'];
              return material.BooksView(
                mediaId: "@narrators/$name",
                title: '$name',
              );
            }),
        GoRoute(
            path: Routes.collection.path,
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return material.BooksView(
                mediaId: "@collections/$id",
                title: '${state.extra}',
              );
            }),
        GoRoute(
          path: Routes.book.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return material.BookDetailsView(mediaId: "$id");
          },
        ),
        GoRoute(
          path: Routes.author.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return material.AuthorView(
              authorId: '$id',
            );
          },
        ),
        GoRoute(
          path: Routes.serie.path,
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return material.BooksView(
              mediaId: '@series/$id',
              title: '${state.extra}',
            );
          },
        ),
        GoRoute(
          path: Routes.search.path,
          builder: (context, state) {
            return HookBuilder(builder: (context) {
              final shouldShowSearch = useState(false);
              if (!shouldShowSearch.value) {
                shouldShowSearch.value = true;
                Future.delayed(
                  const Duration(milliseconds: 1),
                  () => showSearch(
                    // ignore: use_build_context_synchronously
                    context: context,
                    delegate: BookSearchDelegate(),
                  ),
                );
              }
              return Container();
            });
          },
        ),
        GoRoute(
          path: Routes.downloads.path,
          builder: (context, state) {
            return const material.Downloads();
          },
        ),
      ],
      builder: (context, state, child) {
        return AbMaterialApp(
          child: child,
        );
      },
    ),
  ],
);

final routeMap = [
  Routes.home,
  Routes.books,
  Routes.downloads,
  Routes.settings,
  Routes.search,
];

extension GoRouterEnums on BuildContext {
  goEnum(Routes route, {Object? extra}) => go(route.path, extra: extra);
}

extension GoEnum on GoRouter {
  goEnum(Routes route, {Object? extra}) => go(route.path, extra: extra);
  pushEnum(Routes route, {Object? extra}) => push(route.path, extra: extra);
  pushId(String id, {Object? extra}) =>
      push(id.replaceAll("@", "/"), extra: extra);
  pushEnumWithId(Routes route, String id, {Object? extra}) =>
      push(route.path.replaceAll(":id", id), extra: extra);
}

class AbMaterialApp extends HookWidget {
  final Widget child;

  const AbMaterialApp({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
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
      destinations: const [
        Destination(
          title: 'Home',
          icon: CupertinoIcons.house_fill,
        ),
        Destination(
          title: 'Library',
          icon: CupertinoIcons.book_solid,
        ),
        Destination(
          title: 'Downloads',
          icon: Icons.download_done_rounded,
        ),
        Destination(title: 'Settings', icon: CupertinoIcons.settings),
        Destination(title: 'Search', icon: CupertinoIcons.search),
      ],
    );
  }
}
