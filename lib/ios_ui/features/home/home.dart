import 'package:audiobookly/ios_ui/features/player/mini_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final showSidebarProvider = StateProvider((ref) => true);

class Home extends HookConsumerWidget {
  Home({
    super.key,
    required this.navigationShell,
    required this.children,
  });
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  final CupertinoTabController tabController = CupertinoTabController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSidebar = ref.watch(showSidebarProvider);
    return AdaptiveBuilder(
      layoutDelegate: AdaptiveLayoutDelegateWithMinimallScreenType(
        handset: (context, screen) {
          tabController.index = navigationShell.currentIndex;
          return CupertinoTabScaffold(
            controller: tabController,
            tabBuilder: (context, index) => Stack(
              children: [
                children[index],
                const SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MiniPlayer(),
                  ),
                ),
              ],
            ),
            tabBar: CupertinoTabBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
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
                    CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                  ),
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
                      SidebarTile(
                        index: 0,
                        shell: navigationShell,
                        label: "Home",
                        iconData: CupertinoIcons.house_fill,
                      ),
                      SidebarTile(
                        index: 1,
                        shell: navigationShell,
                        label: "Authors",
                        iconData: CupertinoIcons.person_2_fill,
                      ),
                      SidebarTile(
                        index: 2,
                        shell: navigationShell,
                        label: 'Books',
                        iconData: CupertinoIcons.book_fill,
                      ),
                      SidebarTile(
                        index: 3,
                        shell: navigationShell,
                        label: 'Series',
                        iconData: CupertinoIcons
                            .rectangle_fill_on_rectangle_angled_fill,
                      ),
                      SidebarTile(
                        index: 4,
                        shell: navigationShell,
                        label: 'Playlists',
                        iconData: CupertinoIcons.music_note_list,
                      ),
                      SidebarTile(
                        index: 5,
                        shell: navigationShell,
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
                  children[navigationShell.currentIndex],
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

class SidebarTile extends StatelessWidget {
  const SidebarTile({
    super.key,
    required this.index,
    required this.shell,
    required this.label,
    required this.iconData,
  });
  final int index;
  final StatefulNavigationShell shell;
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
        onTap: () => shell.goBranch(
          index,
          initialLocation: index == shell.currentIndex,
        ),
        leading: Icon(
          iconData,
        ),
        backgroundColor:
            shell.currentIndex == index ? Colors.grey.withOpacity(0.1) : null,
        // backgroundColorActivated: Colors.deepPurple,
      ),
    );
  }
}
