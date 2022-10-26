import 'package:isar/isar.dart';
import 'package:audiobookly/models/preferences.dart';

part 'isar_preferences.g.dart';

@Collection()
class IsarPreferences {
  Id id;

  String userToken;
  String userId;
  String username;
  String libraryId;
  String serverId;
  double playbackSpeed;
  double rewindInterval;
  double fastForwardInterval;
  String baseUrl;
  bool useChapterProgressBar;

  @enumerated
  ServerType serverType;

  IsarPreferences({
    this.id = 0,
    this.userToken = '',
    this.userId = '',
    this.username = '',
    this.serverId = '',
    this.libraryId = '',
    this.playbackSpeed = 1,
    this.rewindInterval = 15,
    this.fastForwardInterval = 30,
    this.baseUrl = '',
    this.serverType = ServerType.unknown,
    this.useChapterProgressBar = false,
  });

  factory IsarPreferences.fromPreferences(Preferences prefs) => IsarPreferences(
        id: 0,
        userToken: prefs.userToken,
        userId: prefs.userId,
        username: prefs.username,
        libraryId: prefs.libraryId,
        serverId: prefs.serverId,
        playbackSpeed: prefs.playbackSpeed,
        rewindInterval: prefs.rewindInterval,
        fastForwardInterval: prefs.fastForwardInterval,
        baseUrl: prefs.baseUrl,
        serverType: prefs.serverType,
        useChapterProgressBar: prefs.useChapterProgressBar,
      );

  Preferences toPreferences() => Preferences(
        userToken: userToken,
        userId: userId,
        username: username,
        libraryId: libraryId,
        serverId: serverId,
        playbackSpeed: playbackSpeed,
        rewindInterval: rewindInterval,
        fastForwardInterval: fastForwardInterval,
        baseUrl: baseUrl,
        serverType: serverType,
        useChapterProgressBar: useChapterProgressBar,
      );
}
