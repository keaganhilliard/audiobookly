import 'emby_user.dart';

class EmbyLoginResponse {
  EmbyUser? user;
  SessionInfo? sessionInfo;
  String? accessToken;
  String? serverId;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionInfo != null) {
      data['SessionInfo'] = sessionInfo!.toJson();
    }
    data['AccessToken'] = accessToken;
    data['ServerId'] = serverId;
    return data;
  }
}

class SessionInfo {
  PlayState? playState;
  List<SessionUserInfo>? additionalUsers;
  String? remoteEndPoint;
  List<String>? playableMediaTypes;
  int? playlistIndex;
  int? playlistLength;
  String? id;
  String? serverId;
  String? userId;
  String? userName;
  String? client;
  String? lastActivityDate;
  String? deviceName;
  String? deviceId;
  String? applicationVersion;
  List<String>? supportedCommands;
  bool? supportsRemoteControl;

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
        ? PlayState.fromJson(json['PlayState'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playState != null) {
      data['PlayState'] = playState!.toJson();
    }
    if (additionalUsers != null) {
      data['AdditionalUsers'] =
          additionalUsers!.map((v) => v.toJson()).toList();
    }
    data['RemoteEndPoint'] = remoteEndPoint;
    data['PlayableMediaTypes'] = playableMediaTypes;
    data['PlaylistIndex'] = playlistIndex;
    data['PlaylistLength'] = playlistLength;
    data['Id'] = id;
    data['ServerId'] = serverId;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['Client'] = client;
    data['LastActivityDate'] = lastActivityDate;
    data['DeviceName'] = deviceName;
    data['DeviceId'] = deviceId;
    data['ApplicationVersion'] = applicationVersion;
    data['SupportedCommands'] = supportedCommands;
    data['SupportsRemoteControl'] = supportsRemoteControl;
    return data;
  }
}

class PlayState {
  bool? canSeek;
  bool? isPaused;
  bool? isMuted;
  String? repeatMode;
  int? subtitleOffset;
  double? playbackRate;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CanSeek'] = canSeek;
    data['IsPaused'] = isPaused;
    data['IsMuted'] = isMuted;
    data['RepeatMode'] = repeatMode;
    data['SubtitleOffset'] = subtitleOffset;
    data['PlaybackRate'] = playbackRate;
    return data;
  }
}

class SessionUserInfo {
  String? userId;
  String? userName;
  int? userInternalId;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['UserInternalId'] = userInternalId;
    return data;
  }
}
