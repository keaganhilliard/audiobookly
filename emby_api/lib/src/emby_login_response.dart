import 'emby_user.dart';

class EmbyLoginResponse {
  EmbyUser user;
  SessionInfo sessionInfo;
  String accessToken;
  String serverId;

  EmbyLoginResponse({this.sessionInfo, this.accessToken, this.serverId});

  EmbyLoginResponse.fromJson(Map<String, dynamic> json) {
    sessionInfo = json['SessionInfo'] != null
        ? SessionInfo.fromJson(json['SessionInfo'])
        : null;
    accessToken = json['AccessToken'];
    serverId = json['ServerId'];
    user = json['User'] != null ? EmbyUser.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sessionInfo != null) {
      data['SessionInfo'] = this.sessionInfo.toJson();
    }
    data['AccessToken'] = this.accessToken;
    data['ServerId'] = this.serverId;
    return data;
  }
}

class SessionInfo {
  PlayState playState;
  List<SessionUserInfo> additionalUsers;
  String remoteEndPoint;
  List<String> playableMediaTypes;
  int playlistIndex;
  int playlistLength;
  String id;
  String serverId;
  String userId;
  String userName;
  String client;
  String lastActivityDate;
  String deviceName;
  String deviceId;
  String applicationVersion;
  List<String> supportedCommands;
  bool supportsRemoteControl;

  SessionInfo({
    this.playState,
    this.additionalUsers,
    this.remoteEndPoint,
    this.playableMediaTypes,
    this.playlistIndex,
    this.playlistLength,
    this.id,
    this.serverId,
    this.userId,
    this.userName,
    this.client,
    this.lastActivityDate,
    this.deviceName,
    this.deviceId,
    this.applicationVersion,
    this.supportedCommands,
    this.supportsRemoteControl,
  });

  SessionInfo.fromJson(Map<String, dynamic> json) {
    playState = json['PlayState'] != null
        ? new PlayState.fromJson(json['PlayState'])
        : null;
    if (json['AdditionalUsers'] != null) {
      additionalUsers = json['AdditionalUsers'].map<SessionUserInfo>((v) {
        return SessionUserInfo.fromJson(v);
      }).toList();
    }
    remoteEndPoint = json['RemoteEndPoint'];
    playableMediaTypes = json['PlayableMediaTypes'].cast<String>();
    playlistIndex = json['PlaylistIndex'];
    playlistLength = json['PlaylistLength'];
    id = json['Id'];
    serverId = json['ServerId'];
    userId = json['UserId'];
    userName = json['UserName'];
    client = json['Client'];
    lastActivityDate = json['LastActivityDate'];
    deviceName = json['DeviceName'];
    deviceId = json['DeviceId'];
    applicationVersion = json['ApplicationVersion'];
    supportedCommands = json['SupportedCommands'].cast<String>();
    supportsRemoteControl = json['SupportsRemoteControl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playState != null) {
      data['PlayState'] = this.playState.toJson();
    }
    if (this.additionalUsers != null) {
      data['AdditionalUsers'] =
          this.additionalUsers.map((v) => v.toJson()).toList();
    }
    data['RemoteEndPoint'] = this.remoteEndPoint;
    data['PlayableMediaTypes'] = this.playableMediaTypes;
    data['PlaylistIndex'] = this.playlistIndex;
    data['PlaylistLength'] = this.playlistLength;
    data['Id'] = this.id;
    data['ServerId'] = this.serverId;
    data['UserId'] = this.userId;
    data['UserName'] = this.userName;
    data['Client'] = this.client;
    data['LastActivityDate'] = this.lastActivityDate;
    data['DeviceName'] = this.deviceName;
    data['DeviceId'] = this.deviceId;
    data['ApplicationVersion'] = this.applicationVersion;
    data['SupportedCommands'] = this.supportedCommands;
    data['SupportsRemoteControl'] = this.supportsRemoteControl;
    return data;
  }
}

class PlayState {
  bool canSeek;
  bool isPaused;
  bool isMuted;
  String repeatMode;
  int subtitleOffset;
  double playbackRate;

  PlayState({
    this.canSeek,
    this.isPaused,
    this.isMuted,
    this.repeatMode,
    this.subtitleOffset,
    this.playbackRate,
  });

  PlayState.fromJson(Map<String, dynamic> json) {
    canSeek = json['CanSeek'];
    isPaused = json['IsPaused'];
    isMuted = json['IsMuted'];
    repeatMode = json['RepeatMode'];
    subtitleOffset = json['SubtitleOffset'];
    playbackRate = double.parse(json['PlaybackRate'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CanSeek'] = this.canSeek;
    data['IsPaused'] = this.isPaused;
    data['IsMuted'] = this.isMuted;
    data['RepeatMode'] = this.repeatMode;
    data['SubtitleOffset'] = this.subtitleOffset;
    data['PlaybackRate'] = this.playbackRate;
    return data;
  }
}

class SessionUserInfo {
  String userId;
  String userName;
  int userInternalId;

  SessionUserInfo({
    this.userId,
    this.userName,
    this.userInternalId,
  });

  SessionUserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    userName = json['UserName'];
    userInternalId = json['UserInternalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['UserName'] = this.userName;
    data['UserInternalId'] = this.userInternalId;
    return data;
  }
}
