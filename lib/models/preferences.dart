import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';

enum ServerType { plex, emby, audiobookshelf, unknown }

@freezed
class Preferences with _$Preferences {
  const factory Preferences({
    required String userToken,
    required String userId,
    required String username,
    required String libraryId,
    required String libraryLabel,
    required String serverId,
    required double playbackSpeed,
    required double rewindInterval,
    required double fastForwardInterval,
    required String baseUrl,
    required ServerType serverType,
    required bool useChapterProgressBar,
  }) = _Preferences;
}
