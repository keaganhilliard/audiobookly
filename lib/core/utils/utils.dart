import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/new_project_structure/repositories/media/media_repository.dart';
import 'package:audiobookly/repository/base_repository.dart';
import 'package:emby_api/emby_api.dart';
import 'package:flutter/material.dart';

class Utils {
  static _getNarrator(EmbyItem item) {
    String narrator = item.artistItems
        .where((artist) => !item.albumArtists
            .any((albumArtist) => albumArtist.name == artist.name))
        .map((artist) => artist.name)
        .toList()
        .join(', ');
    return narrator.isNotEmpty ? narrator : item.albumArtist;
  }

  static format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  static cleanPath(String path) =>
      path.replaceAll(new RegExp(r'([^a-zA-Z0-9 /\.]+)'), '-');
  static cleanFileName(String fileName) =>
      fileName.replaceAll(new RegExp(r'([^a-zA-Z0-9 \.]+)'), '-');
  static MediaItem mediaItemfromEmbyItem(EmbyItem item, MediaRepository repo) {
    return MediaItem(
        id: item.type == 'MusicArtist'
            ? '${MediaIds.AUTHORS_ID}/${item.id}'
            : item.type == 'BoxSet'
                ? '${MediaIds.COLLECTIONS_ID}/${item.id}'
                : item.id,
        title: item.name,
        artist: item.albumArtist,
        duration: item.runTimeTicks != null
            ? Duration(
                microseconds: (item.runTimeTicks / 10).roundToDouble().toInt())
            : Duration.zero,
        album: item.album ?? item.name,
        displayDescription: item.overview,
        artUri: repo.getThumbnailUrl(item.id),
        playable: item.type == 'Audio' || item.type == 'MusicAlbum',
        extras: <String, dynamic>{
          'played': item.userData.played ?? false,
          'narrator': _getNarrator(item),
          'viewOffset': item.userData.playbackPositionTicks != null
              ? Duration(
                      microseconds: (item.userData.playbackPositionTicks / 10)
                          .roundToDouble()
                          .toInt())
                  .inMilliseconds
              : 0,
          'largeThumbnail': repo.getThumbnailUrl(item.id)
        });
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  static String friendlyDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '$hours hours and $minutes minutes';
  }
}

extension MediaHelpers on MediaItem {
  String get narrator => extras['narrator'];
  bool get played => extras['played'] ?? false;

  String get partKey => extras['partKey'];

  Duration get viewOffset => extras['viewOffset'] == null
      ? Duration.zero
      : Duration(milliseconds: extras['viewOffset']);

  String get largeThumbnail => extras['largeThumbnail'];
}
