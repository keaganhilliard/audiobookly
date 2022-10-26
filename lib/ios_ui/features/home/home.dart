import 'package:audiobookly/ios_ui/features/player/mini_player.dart';
import 'package:audiobookly/ios_ui/features/authors/authors_view.dart';
import 'package:audiobookly/ios_ui/features/books/books_view.dart';
import 'package:audiobookly/ios_ui/features/collections/collections.dart';
import 'package:audiobookly/ios_ui/features/home/home_view.dart';
import 'package:audiobookly/ios_ui/features/series/series_view.dart';
import 'package:audiobookly/ios_ui/features/settings/settings_view.dart';
import 'package:audiobookly/ios_ui/features/welcome/welcome_view.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(CupertinoIcons.collections_solid),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rectangle_fill_on_rectangle_angled_fill),
            label: 'Series',
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
            getTabView(index),
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
  }
}

Widget getTabView(index) {
  switch (index) {
    case 0:
      return CupertinoTabView(builder: (context) => const HomeView());
    case 1:
      return CupertinoTabView(builder: (context) => const AuthorsView());
    case 2:
      return CupertinoTabView(builder: (context) => const BooksView());
    case 3:
      return CupertinoTabView(builder: (context) => const CollectionsView());
    case 4:
      return CupertinoTabView(builder: (context) => const SeriesView());
    case 5:
      return CupertinoTabView(builder: (context) => const SettingsView());
    default:
      return CupertinoTabView(builder: (context) => const SizedBox());
  }
}
