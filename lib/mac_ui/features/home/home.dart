import 'package:audiobookly/mac_ui/features/tracks/tracks_view.dart';
import 'package:audiobookly/mac_ui/features/settings/settings_view.dart';
import 'package:audiobookly/mac_ui/features/authors/authors_view.dart';
import 'package:audiobookly/mac_ui/features/books/books_view.dart';
import 'package:audiobookly/mac_ui/features/collections/collections_view.dart';
import 'package:audiobookly/mac_ui/features/home/home_toolbar.dart';
import 'package:audiobookly/mac_ui/features/home/home_view.dart';
import 'package:audiobookly/mac_ui/features/series/series_view.dart';
import 'package:audiobookly/mac_ui/widgets/lazy_indexed_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
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
        PlatformMenu(
          label: 'View',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.toggleFullScreen,
            ),
          ],
        ),
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
          top: const MacosSearchField(
            placeholder: 'Search',
          ),
          builder: (context, scrollController) => SidebarItems(
            onChanged: (value) => currentIndex.value = value,
            currentIndex: currentIndex.value,
            items: [
              SidebarItem(
                leading: MacosIcon(
                  CupertinoIcons.house_fill,
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
            ],
          ),
          bottom: MacosListTile(
            leading: const MacosIcon(CupertinoIcons.settings),
            title: Text(
              'Settings',
              style: MacosTheme.of(context).typography.headline,
            ),
            subtitle: const Text('azoth'),
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
          ),
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
        child: LazyIndexedStack(
          index: currentIndex.value,
          children: [
            AbParentScaffold(builder: (context) => const HomeView()),
            AbParentScaffold(builder: (context) => BooksView()),
            AbParentScaffold(builder: (context) => AuthorsView()),
            AbParentScaffold(builder: (context) => CollectionsView()),
            AbParentScaffold(builder: (context) => SeriesView()),
          ],
        ),
      ),
    );
  }
}

final showTracks = StateProvider((ref) => false);

class AbParentScaffold extends HookConsumerWidget {
  final Widget Function(BuildContext) builder;

  const AbParentScaffold({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacosScaffold(
      toolBar: getHomeToolbar(context, ref),
      children: [
        ContentArea(
          builder: (context, scrollController) => CupertinoTabView(
            builder: builder,
          ),
        ),
        // if (ref.watch(showTracks))
        //   ResizablePane(
        //     builder: (context, scrollController) => TracksView(),
        //     isResizable: false,
        //     maxWidth: 300,
        //     minWidth: 300,
        //     resizableSide: ResizableSide.left,
        //     startWidth: 300,
        //   )
      ],
    );
  }
}
