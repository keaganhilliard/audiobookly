import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/mac_ui/features/book_details/book_details_view.dart';
import 'package:audiobookly/mac_ui/features/tracks/tracks_view.dart';
import 'package:audiobookly/mac_ui/features/settings/settings_view.dart';
import 'package:audiobookly/mac_ui/features/authors/authors_view.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/features/collections/collections_view.dart';
import 'package:audiobookly/mac_ui/features/home/home_toolbar.dart';
import 'package:audiobookly/mac_ui/features/home/home_view.dart';
import 'package:audiobookly/mac_ui/features/series/series_view.dart';
import 'package:audiobookly/mac_ui/widgets/lazy_indexed_stack.dart';
import 'package:audiobookly/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final lifecycle = useAppLifecycleState();
    print(lifecycle);
    return PlatformMenuBar(
      menus: const [
        PlatformMenu(
          label: 'Audiobookly',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.about,
            ),
            PlatformProvidedMenuItem(
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
        PlatformMenu(
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
                    return Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: MacosScaffold(children: [
                        ContentArea(
                          builder: (context, scrollController) =>
                              const SettingsView(),
                        )
                      ]),
                    );
                  },
                );
              },
            );
          }),
          minWidth: 200.0,
        ),
        endSidebar: Sidebar(
          topOffset: 59,
          builder: (context, scrollController) => TracksView(
            controller: scrollController,
          ),
          minWidth: 250,
          startWidth: 250,
          isResizable: false,
          shownByDefault: false,
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
                    //SearchViewStub
                    CupertinoTabView(builder: (context) {
                      return Container();
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
