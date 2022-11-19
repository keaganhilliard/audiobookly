import 'package:audiobookly/domain/authors/authors_notifier.dart';
import 'package:audiobookly/domain/books/books_notifier.dart';
import 'package:audiobookly/domain/collections/collections_notifier.dart';
import 'package:audiobookly/domain/home/home_notifier.dart';
import 'package:audiobookly/domain/search/search_notifier.dart';
import 'package:audiobookly/domain/series/series_notifier.dart';
import 'package:audiobookly/mac_ui/features/search/search_view.dart';
import 'package:audiobookly/mac_ui/features/settings/settings_view.dart';
import 'package:audiobookly/mac_ui/features/authors/authors_view.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/features/collections/collections_view.dart';
import 'package:audiobookly/mac_ui/features/home/home_toolbar.dart';
import 'package:audiobookly/mac_ui/features/home/home_view.dart';
import 'package:audiobookly/mac_ui/features/series/series_view.dart';
import 'package:audiobookly/mac_ui/widgets/lazy_indexed_stack.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:audiobookly/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class Home extends HookConsumerWidget {
  Home({super.key});
  final searchDebouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    return PlatformMenuBar(
      menus: [
        PlatformMenu(
          label: 'Audiobookly',
          menus: [
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.about,
            ),
            PlatformMenuItem(
              label: 'Stop playback',
              onSelected: () {
                GetIt.I<PlaybackController>().stop();
              },
            ),
            PlatformMenuItem(
              label: 'Refresh page',
              shortcut:
                  const SingleActivator(LogicalKeyboardKey.keyR, meta: true),
              onSelected: () async {
                switch (currentIndex.value) {
                  case 0:
                    return ref.read(homeStateProvider.notifier).refresh();
                  case 1:
                    return ref
                        .read(booksStateProvider(null).notifier)
                        .refresh();
                  case 2:
                    return ref.read(authorsStateProvider.notifier).refresh();
                  case 3:
                    return ref
                        .read(collectionsStateProvider.notifier)
                        .refresh();
                  case 4:
                    return ref.read(seriesStateProvider.notifier).refresh();
                }
                // GetIt.I<PlaybackController>().stop();
              },
            ),
            const PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.quit,
            ),
          ],
        ),
        // PlatformMenu(
        //   label: 'View',
        //   menus: [
        //     PlatformProvidedMenuItem(
        //       type: PlatformProvidedMenuItemType.toggleFullScreen,
        //     ),
        //   ],
        // ),
        const PlatformMenu(
          label: 'Window',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.minimizeWindow,
            ),
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.zoomWindow,
            ),
          ],
        ),
      ],
      child: MacosWindow(
        sidebar: Sidebar(
          dragClosed: false,
          top: Consumer(builder: (context, ref, child) {
            return MacosSearchField(
              placeholder: 'Search',
              onTap: () {
                currentIndex.value = 5;
              },
              onChanged: (value) {
                searchDebouncer.run(() {
                  ref.read(searchStateProvider.notifier).search(value);
                });
              },
            );
          }),
          builder: (context, scrollController) => SidebarItems(
            onChanged: (value) => currentIndex.value = value,
            currentIndex: currentIndex.value,
            items: [
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.house_fill,
                  // because of library hard coding nonsense
                  color: currentIndex.value == 0
                      ? MacosColors.white
                      : Colors.deepPurple,
                ),
                label: const Text('Home'),
              ),
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.book_solid,
                  color: currentIndex.value == 1
                      ? MacosColors.white
                      : Colors.deepPurple,
                ),
                label: const Text('Books'),
              ),
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.person_2_fill,
                  color: currentIndex.value == 2
                      ? MacosColors.white
                      : Colors.deepPurple,
                ),
                label: const Text('Authors'),
              ),
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.collections_solid,
                  color: currentIndex.value == 3
                      ? MacosColors.white
                      : Colors.deepPurple,
                ),
                label: const Text('Collections'),
              ),
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                  color: currentIndex.value == 4
                      ? MacosColors.white
                      : Colors.deepPurple,
                ),
                label: const Text('Series'),
              ),
              // Hidden item for the search page
              SidebarItem(
                label: Container(),
                selectedColor: MacosColors.transparent,
              )
            ],
          ),
          bottom: Consumer(builder: (context, ref, child) {
            final prefs = ref.watch(preferencesProvider);
            return MacosListTile(
              leading: const MacosIcon(CupertinoIcons.settings),
              title: Text(
                'Settings',
                style: MacosTheme.of(context).typography.headline,
              ),
              subtitle: Text(prefs.username),
              onClick: () {
                showMacosSheet(
                  barrierDismissible: true,
                  barrierLabel: 'Hello',
                  context: context,
                  builder: (context) {
                    return const MacosSheet(
                      child: SettingsView(),
                    );
                  },
                );
              },
            );
          }),
          minWidth: 150.0,
          maxWidth: 200.0,
        ),
        child: Consumer(builder: (context, ref, child) {
          return MacosScaffold(
            toolBar: getHomeToolbar(context, ref),
            children: [
              ContentArea(
                builder: (context, scrollController) => LazyIndexedStack(
                  index: currentIndex.value,
                  children: [
                    CupertinoTabView(builder: (context) {
                      return const HomeView();
                    }),
                    CupertinoTabView(builder: (context) {
                      return BooksView();
                    }),
                    CupertinoTabView(builder: (context) {
                      return AuthorsView();
                    }),
                    CupertinoTabView(builder: (context) {
                      return CollectionsView();
                    }),
                    CupertinoTabView(builder: (context) {
                      return SeriesView();
                    }),
                    CupertinoTabView(builder: (context) {
                      return const SearchView();
                    }),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
