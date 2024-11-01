import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/constants/app_constants.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/models/chapter.dart';
import 'package:audiobookly/repositories/media/media_repository.dart';
import 'package:emby_api/emby_api.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static String getTimeValue(Duration? time) {
    if (time == null) return '-:--:--';
    return RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})')
            .firstMatch("$time")
            ?.group(1) ??
        '$time';
  }

  static Future<Directory> getBasePath() async {
    try {
      return await getApplicationDocumentsDirectory();
    } catch (e) {
      return await getApplicationDocumentsDirectory();
    }
  }

  static MediaItem chapterToItem(Chapter chapter) {
    return MediaItem(
      id: chapter.id,
      title: chapter.title,
      duration: Duration(
            milliseconds: (chapter.end * 1000).round(),
          ) -
          Duration(
            milliseconds: (chapter.start * 1000).round(),
          ),
      extras: {
        'start': chapter.start,
        'end': chapter.end,
      },
    );
  }

  static String? getNarrator(EmbyItem item) {
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

  static String format(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");
  static String cleanPath(String path) =>
      path.replaceAll(RegExp(r'([^a-zA-Z0-9 /\.]+)'), '-');
  static String cleanFileName(String fileName) =>
      fileName.replaceAll(RegExp(r'([^a-zA-Z0-9 \.]+)'), '-');
  static MediaItem mediaItemfromEmbyItem(EmbyItem item, MediaRepository repo) {
    return MediaItem(
        id: item.type == 'MusicArtist'
            ? '${MediaIds.authorsId}/${item.id}'
            : item.type == 'BoxSet'
                ? '${MediaIds.collectionsId}/${item.id}'
                : item.id!,
        title: item.name!,
        artist: item.albumArtist,
        duration: item.runTimeTicks != null
            ? Duration(
                microseconds: (item.runTimeTicks! / 10).roundToDouble().toInt())
            : Duration.zero,
        album: item.album ?? item.name!,
        displayDescription: item.overview ?? '',
        artUri: item.type == 'BoxSet'
            ? repo.getThumbnailUrl(item.id).uri
            : repo.getThumbnailUrl(item.id).uri,
        playable: item.type == 'Audio' || item.type == 'MusicAlbum',
        extras: <String, dynamic>{
          'played': (item.userData?.played ?? false),
          'narrator': getNarrator(item),
          'viewOffset': item.userData!.playbackPositionTicks != null
              ? Duration(
                      microseconds: (item.userData!.playbackPositionTicks! / 10)
                          .roundToDouble()
                          .toInt())
                  .inMilliseconds
              : 0,
          // 'largeThumbnail': repo.getThumbnailUrl(item.id),
          'cached': false,
          'artists': item.albumArtists
              ?.map(
                (artist) => artist.toJson(),
              )
              .toList(),
          'asin': item.providerIds?['asin']
        });
  }

//kw1eem1e
  static double getProgress({MediaItem? item, Book? book}) {
    if (book != null && book.duration != Duration.zero) {
      return book.lastPlayedPosition.inMilliseconds /
          book.duration.inMilliseconds;
    } else if (item != null) {
      if (item.duration != Duration.zero) {
        return item.duration != null
            ? item.viewOffset.inMilliseconds / item.duration!.inMilliseconds
            : 0;
      }
    }
    return 0;
  }

  static double getProgressFromDuration({
    Duration? duration,
    Duration? offset,
  }) {
    if (duration == null || offset == null) {
      return 0;
    }
    return offset.inMilliseconds / duration.inMilliseconds;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  static String friendlyDurationFromItems(List<MediaItem> items) {
    final totalDuration = items.fold<Duration>(
        Duration.zero,
        (previousValue, element) =>
            previousValue + (element.duration ?? Duration.zero));
    return totalDuration.timeLeft;
  }

  static String friendlyDurationFromTracks(List<Track> tracks) {
    final totalDuration = tracks.fold<Duration>(Duration.zero,
        (previousValue, element) => previousValue + (element.duration));
    return totalDuration.timeLeft;
  }

  static String getTimeLeft(Book book) {
    return (book.duration - book.lastPlayedPosition).timeLeft;
  }
}

extension DurationHelpers on Duration {
  String get timeLeft {
    String pluralString(int value, String label, [String pluralSuffix = 's']) {
      if (value == 0) {
        return '';
      } else if (value == 1) {
        return '$value $label';
      } else {
        return '$value $label$pluralSuffix';
      }
    }

    int hours = inHours;
    int minutes = inMinutes.remainder(60);
    int seconds = inSeconds.remainder(60);
    final hoursText = pluralString(hours, 'hour');
    final minutesText = pluralString(minutes, 'minute');
    final secondsText = pluralString(seconds, 'second');
    final pieces = <String>[];
    if (hoursText.isNotEmpty) pieces.add(hoursText);
    if (minutesText.isNotEmpty) pieces.add(minutesText);
    if (hoursText.isEmpty && secondsText.isNotEmpty) pieces.add(secondsText);
    return pieces.join(' ');
  }
}

extension ListHelpers<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

extension StringHelpers on String {
  Uri? get uri {
    try {
      return Uri.parse(this);
    } catch (e) {
      return null;
    }
  }

  int get fastHash {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < length) {
      final codeUnit = codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}

extension MediaHelpers on MediaItem {
  String? get narrator => extras?['narrator'];
  bool get played => extras?['played'] ?? false;
  bool get cached => extras?['cached'] ?? false;
  bool get downloading => extras?['downloading'] ?? false;
  double get downloadProgress => extras?['downloadProgress'] ?? 0.0;
  String get cachePath => extras?['cachePath'] ?? '';
  String get asin => extras?['asin'] ?? '';

  String? get partKey => extras?['partKey'];
  String get serverPath => extras?['serverPath'] ?? partKey ?? id;

  Duration get viewOffset => extras?['viewOffset'] == null
      ? Duration.zero
      : Duration(milliseconds: extras?['viewOffset']);

  Duration get currentTrackStartingPosition =>
      extras?['currentTrackStartingPosition'] == null
          ? Duration.zero
          : Duration(milliseconds: extras?['currentTrackStartingPosition']);

  Duration get currentTrackLength => extras?['currentTrackLength'] == null
      ? Duration.zero
      : Duration(milliseconds: extras?['currentTrackLength']);

  Duration get totalDuration => extras?['totalDuration'] == null
      ? Duration.zero
      : Duration(milliseconds: extras?['totalDuration']);

  Uri? get largeThumbnail => (extras?['largeThumbnail'] as String?)?.uri;
  List<Chapter> get chapters {
    if (extras != null && extras!.containsKey('chapters')) {
      return [
        for (final chapter in extras!['chapters']) Chapter.fromJson(chapter, id)
      ];
    }
    return [];
  }

  Duration get start => Duration(
        milliseconds: ((extras?['start'] ?? 0) * 1000).round(),
      );

  Duration get end => Duration(
        milliseconds: ((extras?['end'] ?? 0) * 1000).round(),
      );

  static MediaItem fromBook(Book book) => MediaItem(
        id: book.id,
        title: book.title,
        artist: book.author,
        album: book.title,
        artUri: book.artPath.uri,
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
        artUri: book.artPath.uri,
        playable: true,
        extras: <String, dynamic>{
          'narrator': book.narrator,
          'largeThumbnail': book.artPath,
          'cached': true,
          'cachePath': track.downloadPath,
          'serverPath': track.serverPath.isEmpty ? track.id : track.serverPath,
        },
        duration: track.duration,
      );
}

bool nullOrEmpty(List? check) {
  return check?.isEmpty ?? true;
}

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
