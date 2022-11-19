import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/providers.dart';
import 'package:audiobookly/services/audio/playback_controller.dart';
import 'package:flutter_carplay/flutter_carplay.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<FlutterCarplay> initCarplay() async {
  final FlutterCarplay flutterCarplay = FlutterCarplay();
  final container = ProviderContainer();

  Future makeList(
      dynamic Function() complete, String rootId, String title) async {
    final items =
        await container.read(mediaRepositoryProvider)?.getChildren(rootId);

    FlutterCarplay.push(
      template: CPListTemplate(
        title: title,
        systemIcon: 'book.fill',
        sections: [
          CPListSection(
            items: [
              for (final item in items!)
                CPListItem(
                  text: item.title,
                  detailText: item.artist,
                  image: item.artUri?.toString(),
                  onPress: (complete, self) async {
                    if (item.playable ?? false) {
                      await GetIt.I
                          .get<PlaybackController>()
                          .playFromId(item.id);
                      complete();
                    } else {
                      makeList(complete, item.id, item.title);
                    }
                  },
                ),
            ],
          ),
        ],
      ),
      animated: true,
    );
    complete();
  }

  FlutterCarplay.setRootTemplate(
    rootTemplate: CPTabBarTemplate(
      templates: [
        // for (final item in rootItems!)
        CPListTemplate(
          sections: [
            CPListSection(
              items: [
                CPListItem(
                    text: 'Continue Listening',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.recentlyPlayed,
                          'Continue Listening');
                    }),
                CPListItem(
                    text: 'Recently Added',
                    onPress: (complete, self) {
                      makeList(
                          complete, MediaIds.recentlyAdded, 'Recently Added');
                    }),
                CPListItem(
                    text: 'Downloaded',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.downloads, 'Downloaded');
                    }),
              ],
            ),
          ],
          title: "Home",
          showsTabBadge: false,
          systemIcon: "house.fill",
        ),
        CPListTemplate(
          sections: [
            CPListSection(
              items: [
                CPListItem(
                    text: 'Authors',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.authorsId, 'Authors');
                    }),
                CPListItem(
                    text: 'All Books',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.booksId, 'All Books');
                    }),
                CPListItem(
                    text: 'Collections',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.collectionsId, 'Collections');
                    }),
                CPListItem(
                    text: 'Series',
                    onPress: (complete, self) {
                      makeList(complete, MediaIds.seriesId, 'Series');
                    }),
              ],
            ),
          ],
          title: "Library",
          showsTabBadge: false,
          systemIcon: "book.fill",
        ),
      ],
    ),
    animated: true,
  );

  return flutterCarplay;
}
