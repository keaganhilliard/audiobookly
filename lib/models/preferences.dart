enum ServerType { plex, emby, audiobookshelf, unknown }

class Preferences {
  String userToken;
  String userId;
  String username;
  String libraryId;
  String libraryLabel;
  String serverId;
  double playbackSpeed;
  double rewindInterval;
  double fastForwardInterval;
  String baseUrl;
  ServerType serverType;
  bool useChapterProgressBar;

  Preferences({
    this.userToken = '',
    this.userId = '',
    this.username = '',
    this.libraryId = '',
    this.libraryLabel = '',
    this.serverId = '',
    this.playbackSpeed = 1,
    this.rewindInterval = 15,
    this.fastForwardInterval = 30,
    this.baseUrl = '',
    this.serverType = ServerType.unknown,
    this.useChapterProgressBar = false,
  });

  @override
  String toString() {
    return 'Preferences($userToken, $userId, $playbackSpeed, $libraryId, $libraryLabel)';
  }
}
