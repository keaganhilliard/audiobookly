import 'package:audiobookly/ios_ui/features/player/mini_player.dart';
import 'package:audiobookly/ios_ui/features/authors/authors_view.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/features/home/home_view.dart';
import 'package:audiobookly/ios_ui/features/playlists/playlists_view.dart';
import 'package:audiobookly/ios_ui/features/series/series_view.dart';
import 'package:audiobookly/ios_ui/features/settings/settings_view.dart';
import 'package:audiobookly/utils/lazy_indexed_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final showSidebarProvider = StateProvider((ref) => true);

class HomeGoRouter extends HookConsumerWidget {
  const HomeGoRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSidebar = ref.watch(showSidebarProvider);
    final index = useState(0);
    return AdaptiveBuilder(
      layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
        handset: (context, screen) {
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              height: 55.0,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_2_fill),
                  label: 'Authors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.book_solid),
                  label: 'Books',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.rectangle_fill_on_rectangle_angled_fill),
                  label: 'Series',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.music_note_list),
                  label: 'Playlists',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings_solid),
                  label: 'Settings',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              return Stack(
                children: [
                  getTabView(index, false),
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MiniPlayer(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      defaultBuilder: (context, screen) => Row(children: [
        if (showSidebar)
          Container(
            decoration: const BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
            ),
            child: SafeArea(
              child: SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          ref.read(showSidebarProvider.notifier).state =
                              !showSidebar;
                        },
                        child: const Icon(CupertinoIcons.sidebar_left),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: CupertinoListTile(
                          title: const Text('Home'),
                          onTap: () {
                            index.value = 0;
                          },
                          leading: const Icon(CupertinoIcons.house_fill),
                          backgroundColor: index.value == 0
                              ? Colors.grey.withOpacity(0.1)
                              : null,
                          // backgroundColorActivated: Colors.deepPurple,
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: CupertinoListTile(
                          title: const Text('Authors'),
                          onTap: () {
                            index.value = 1;
                          },
                          leading: const Icon(
                            CupertinoIcons.person_2_fill,
                          ),
                          backgroundColor: index.value == 1
                              ? Colors.grey.withOpacity(0.1)
                              : null,
                          // backgroundColorActivated: Colors.deepPurple,
                        ),
                      ),
                      SidebarTile(
                        index: 2,
                        currentIndex: index,
                        label: 'Books',
                        iconData: CupertinoIcons.book_fill,
                      ),
                      SidebarTile(
                        index: 3,
                        currentIndex: index,
                        label: 'Series',
                        iconData: CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                      ),
                      SidebarTile(
                        index: 4,
                        currentIndex: index,
                        label: 'Playlists',
                        iconData: CupertinoIcons.music_note_list,
                      ),
                      SidebarTile(
                        index: 5,
                        currentIndex: index,
                        label: 'Settings',
                        iconData: CupertinoIcons.settings,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: CupertinoScaffold(
            body: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark,
                primaryColor: Color.fromRGBO(103, 58, 183, 1),
              ),
              child: Stack(
                children: [
                  LazyIndexedStack(
                    index: index.value,
                    children: [
                      CupertinoTabView(
                        builder: (context) => const HomeView(
                          showOpenSidebar: true,
                        ),
                      ),
                      CupertinoTabView(
                          builder: (context) => const AuthorsView()),
                      CupertinoTabView(
                        builder: (context) => const BooksView(),
                      ),
                      CupertinoTabView(
                          builder: (context) => const SeriesView()),
                      CupertinoTabView(
                        builder: (context) => const PlaylistsView(),
                      ),
                      CupertinoTabView(
                        builder: (context) => const SettingsView(),
                      ),
                    ],
                  ),
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MiniPlayer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSidebar = ref.watch(showSidebarProvider);
    final index = useState(0);
    return AdaptiveBuilder(
      layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
        handset: (context, screen) {
          return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              height: 55.0,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_fill),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_2_fill),
                  label: 'Authors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.book_solid),
                  label: 'Books',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.rectangle_fill_on_rectangle_angled_fill),
                  label: 'Series',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.music_note_list),
                  label: 'Playlists',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings_solid),
                  label: 'Settings',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              return Stack(
                children: [
                  getTabView(index, false),
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MiniPlayer(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      defaultBuilder: (context, screen) => Row(children: [
        if (showSidebar)
          Container(
            decoration: const BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
            ),
            child: SafeArea(
              child: SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          ref.read(showSidebarProvider.notifier).state =
                              !showSidebar;
                        },
                        child: const Icon(CupertinoIcons.sidebar_left),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: CupertinoListTile(
                          title: const Text('Home'),
                          onTap: () {
                            index.value = 0;
                          },
                          leading: const Icon(CupertinoIcons.house_fill),
                          backgroundColor: index.value == 0
                              ? Colors.grey.withOpacity(0.1)
                              : null,
                          // backgroundColorActivated: Colors.deepPurple,
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: CupertinoListTile(
                          title: const Text('Authors'),
                          onTap: () {
                            index.value = 1;
                          },
                          leading: const Icon(
                            CupertinoIcons.person_2_fill,
                          ),
                          backgroundColor: index.value == 1
                              ? Colors.grey.withOpacity(0.1)
                              : null,
                          // backgroundColorActivated: Colors.deepPurple,
                        ),
                      ),
                      SidebarTile(
                        index: 2,
                        currentIndex: index,
                        label: 'Books',
                        iconData: CupertinoIcons.book_fill,
                      ),
                      SidebarTile(
                        index: 3,
                        currentIndex: index,
                        label: 'Series',
                        iconData: CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                      ),
                      SidebarTile(
                        index: 4,
                        currentIndex: index,
                        label: 'Playlists',
                        iconData: CupertinoIcons.music_note_list,
                      ),
                      SidebarTile(
                        index: 5,
                        currentIndex: index,
                        label: 'Settings',
                        iconData: CupertinoIcons.settings,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: CupertinoScaffold(
            body: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark,
                primaryColor: Color.fromRGBO(103, 58, 183, 1),
              ),
              child: Stack(
                children: [
                  LazyIndexedStack(
                    index: index.value,
                    children: [
                      CupertinoTabView(
                        builder: (context) => const HomeView(
                          showOpenSidebar: true,
                        ),
                      ),
                      CupertinoTabView(
                          builder: (context) => const AuthorsView()),
                      CupertinoTabView(
                        builder: (context) => const BooksView(),
                      ),
                      CupertinoTabView(
                          builder: (context) => const SeriesView()),
                      CupertinoTabView(
                        builder: (context) => const PlaylistsView(),
                      ),
                      CupertinoTabView(
                        builder: (context) => const SettingsView(),
                      ),
                    ],
                  ),
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MiniPlayer(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget getTabView(int index, bool showOpenSidebar) {
  return switch (index) {
    0 => CupertinoTabView(
        builder: (context) => HomeView(
          showOpenSidebar: showOpenSidebar,
        ),
      ),
    1 => CupertinoTabView(builder: (context) => const AuthorsView()),
    2 => CupertinoTabView(builder: (context) => const BooksView()),
    3 => CupertinoTabView(builder: (context) => const SeriesView()),
    4 => CupertinoTabView(builder: (context) => const PlaylistsView()),
    5 => CupertinoTabView(builder: (context) => const SettingsView()),
    _ => CupertinoTabView(builder: (context) => const SizedBox()),
  };
}

class SidebarTile extends StatelessWidget {
  const SidebarTile({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.iconData,
  });
  final int index;
  final ValueNotifier<int> currentIndex;
  final String label;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: CupertinoListTile(
        title: Text(label),
        onTap: () {
          currentIndex.value = index;
        },
        leading: Icon(
          iconData,
        ),
        backgroundColor:
            currentIndex.value == index ? Colors.grey.withOpacity(0.1) : null,
        // backgroundColorActivated: Colors.deepPurple,
      ),
    );
  }
}
