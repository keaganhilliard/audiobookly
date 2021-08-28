import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/database/entity/book.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:emby_api/emby_api.dart';
import 'package:flutter/material.dart';

Track getTrack(
  MediaItem chapter,
  String bookId,
  double progress,
  String path, [
  String downloadTaskId = '',
]) =>
    Track(
      chapter.id,
      chapter.title,
      chapter.duration ?? Duration.zero,
      progress,
      progress == 1,
      path,
      bookId,
      downloadTaskId,
      0,
    );

Book getBook(
  MediaItem book,
  bool downloadRequested,
  bool downloadCompleted,
  bool downloadFailed,
) =>
    Book(
      book.id,
      book.title,
      book.artist ?? 'Unknown',
      book.narrator ?? 'Unkown',
      book.displayDescription ?? '',
      book.artUri.toString(),
      book.duration ?? Duration.zero,
      book.viewOffset,
      downloadRequested,
      downloadCompleted,
      downloadFailed,
      book.played,
    );

class Utils {
  static String getTimeValue(Duration? time) {
    if (time == null) return '-:--:--';
    return RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
            .firstMatch("${time}")
            ?.group(1) ??
        '${time}';
  }

  static _getNarrator(EmbyItem item) {
    if (item.composers?.isNotEmpty ?? false) {
      return item.composers!.map((artist) => artist.name).join(', ');
    }
    String narrator = item.artistItems!
        .where((artist) => !item.albumArtists!
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
                : item.id!,
        title: item.name!,
        artist: item.albumArtist,
        duration: item.runTimeTicks != null
            ? Duration(
                microseconds: (item.runTimeTicks! / 10).roundToDouble().toInt())
            : Duration.zero,
        album: item.album ?? item.name!,
        displayDescription: item.overview,
        artUri: Uri.parse(repo.getThumbnailUrl(item.id)),
        playable: item.type == 'Audio' || item.type == 'MusicAlbum',
        extras: <String, dynamic>{
          'played': (item.userData?.played ?? false),
          'narrator': _getNarrator(item),
          'viewOffset': item.userData!.playbackPositionTicks != null
              ? Duration(
                      microseconds: (item.userData!.playbackPositionTicks! / 10)
                          .roundToDouble()
                          .toInt())
                  .inMilliseconds
              : 0,
          // 'largeThumbnail': repo.getThumbnailUrl(item.id),
          'cached': false,
          'artists': item.albumArtists?.map((artist) => artist.toJson())
        });
  }

  static double getProgess(MediaItem book) {
    return book.duration != null
        ? book.viewOffset.inMilliseconds / book.duration!.inMilliseconds
        : 0;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  static String friendlyDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '$hours hour${hours > 1 ? "s" : ""} and $minutes minute${minutes > 1 ? "s" : ""}';
  }

  static String friendlyDurationFromItems(List<MediaItem> items) {
    final totalDuration = items.fold<Duration>(
        Duration.zero,
        (previousValue, element) =>
            previousValue + (element.duration ?? Duration.zero));
    return friendlyDuration(totalDuration);
  }
}

extension MediaHelpers on MediaItem {
  String? get narrator => extras?['narrator'];
  bool get played => extras?['played'] ?? false;
  bool get cached => extras?['cached'] ?? false;
  String get cachePath => extras?['cachePath'] ?? '';

  String? get partKey => extras?['partKey'];

  Duration get viewOffset => extras?['viewOffset'] == null
      ? Duration.zero
      : Duration(milliseconds: extras?['viewOffset']);

  Uri? get largeThumbnail => extras?['largeThumbnail'] == null
      ? null
      : Uri.parse(extras?['largeThumbnail']);

  static MediaItem fromBook(Book book) => MediaItem(
        id: book.id,
        title: book.title,
        artist: book.author,
        album: book.title,
        artUri: Uri.parse(book.artPath),
        displayDescription: book.description,
        playable: true,
        duration: book.duration,
        extras: <String, dynamic>{
          'narrator': book.narrator,
          'largeThumbnail': book.artPath,
          'cached': true,
          'viewOffset': book.lastPlayedPosition.inMilliseconds,
          'played': book.read,
        },
      );

  static MediaItem fromTrack(Track track, Book book) => MediaItem(
        id: track.id,
        title: track.title,
        album: book.title,
        artist: book.author,
        displayDescription: book.description,
        artUri: Uri.parse(book.artPath),
        playable: true,
        extras: <String, dynamic>{
          'narrator': book.narrator,
          'largeThumbnail': book.artPath,
          'cached': true,
          'cachePath': track.downloadPath,
        },
        duration: track.duration,
      );
}
