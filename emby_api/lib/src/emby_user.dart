class EmbyUser {
  String? name;
  String? serverId;
  String? id;
  String? connectUserName;
  String? connectLinkType;
  bool? hasPassword;
  bool? hasConfiguredPassword;
  bool? hasConfiguredEasyPassword;
  DateTime? lastLoginDate;
  DateTime? lastActivityDate;
  Configuration? configuration;
  Policy? policy;

  EmbyUser({
    this.name,
    this.serverId,
    this.id,
    this.hasPassword,
    this.hasConfiguredPassword,
    this.hasConfiguredEasyPassword,
    this.lastLoginDate,
    this.lastActivityDate,
    this.configuration,
    this.policy,
  });

  EmbyUser.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    serverId = json['ServerId'];
    id = json['Id'];
    connectUserName = json['ConnectUserName'];
    connectLinkType = json['ConnectLinkType'];
    hasPassword = json['HasPassword'];
    hasConfiguredPassword = json['HasConfiguredPassword'];
    hasConfiguredEasyPassword = json['HasConfiguredEasyPassword'];
    lastLoginDate = json['LastLoginDate'] == null
        ? null
        : DateTime.parse(json['LastLoginDate']);
    lastActivityDate = json['LastActivityDate'] == null
        ? null
        : DateTime.parse(json['LastActivityDate']);
    configuration = json['Configuration'] != null
        ? new Configuration.fromJson(json['Configuration'])
        : null;
    policy =
        json['Policy'] != null ? new Policy.fromJson(json['Policy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['ServerId'] = this.serverId;
    data['Id'] = this.id;
    data['ConnectUserName'] = this.connectUserName;
    data['ConnectLinkType'] = this.connectLinkType;
    data['HasPassword'] = this.hasPassword;
    data['HasConfiguredPassword'] = this.hasConfiguredPassword;
    data['HasConfiguredEasyPassword'] = this.hasConfiguredEasyPassword;
    data['LastLoginDate'] = this.lastLoginDate?.toIso8601String();
    data['LastActivityDate'] = this.lastActivityDate?.toIso8601String();
    if (this.configuration != null) {
      data['Configuration'] = this.configuration!.toJson();
    }
    if (this.policy != null) {
      data['Policy'] = this.policy!.toJson();
    }
    return data;
  }
}

class Configuration {
  String? audioLanguagePreference;
  bool? playDefaultAudioTrack;
  String? subtitleLanguagePreference;
  bool? displayMissingEpisodes;
  List<String>? groupedFolders;
  String? subtitleMode;
  bool? displayCollectionsView;
  bool? enableLocalPassword;
  List<String>? orderedViews;
  List<String>? latestItemsExcludes;
  List<String>? myMediaExcludes;
  bool? hidePlayedInLatest;
  bool? rememberAudioSelections;
  bool? rememberSubtitleSelections;
  bool? enableNextEpisodeAutoPlay;

  Configuration({
    this.audioLanguagePreference,
    this.playDefaultAudioTrack,
    this.subtitleLanguagePreference,
    this.displayMissingEpisodes,
    this.groupedFolders,
    this.subtitleMode,
    this.displayCollectionsView,
    this.enableLocalPassword,
    this.orderedViews,
    this.latestItemsExcludes,
    this.myMediaExcludes,
    this.hidePlayedInLatest,
    this.rememberAudioSelections,
    this.rememberSubtitleSelections,
    this.enableNextEpisodeAutoPlay,
  });

  Configuration.fromJson(Map<String, dynamic> json) {
    audioLanguagePreference = json['AudioLanguagePreference'];
    playDefaultAudioTrack = json['PlayDefaultAudioTrack'];
    subtitleLanguagePreference = json['SubtitleLanguagePreference'];
    displayMissingEpisodes = json['DisplayMissingEpisodes'];
    groupedFolders = json['GroupedFolders'].cast<String>();
    subtitleMode = json['SubtitleMode'];
    displayCollectionsView = json['DisplayCollectionsView'];
    enableLocalPassword = json['EnableLocalPassword'];
    orderedViews = json['OrderedViews'].cast<String>();
    latestItemsExcludes = json['LatestItemsExcludes'].cast<String>();
    myMediaExcludes = json['MyMediaExcludes'].cast<String>();
    hidePlayedInLatest = json['HidePlayedInLatest'];
    rememberAudioSelections = json['RememberAudioSelections'];
    rememberSubtitleSelections = json['RememberSubtitleSelections'];
    enableNextEpisodeAutoPlay = json['EnableNextEpisodeAutoPlay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AudioLanguagePreference'] = this.audioLanguagePreference;
    data['PlayDefaultAudioTrack'] = this.playDefaultAudioTrack;
    data['SubtitleLanguagePreference'] = this.subtitleLanguagePreference;
    data['DisplayMissingEpisodes'] = this.displayMissingEpisodes;
    data['GroupedFolders'] = this.groupedFolders;
    data['SubtitleMode'] = this.subtitleMode;
    data['DisplayCollectionsView'] = this.displayCollectionsView;
    data['EnableLocalPassword'] = this.enableLocalPassword;
    data['OrderedViews'] = this.orderedViews;
    data['LatestItemsExcludes'] = this.latestItemsExcludes;
    data['MyMediaExcludes'] = this.myMediaExcludes;
    data['HidePlayedInLatest'] = this.hidePlayedInLatest;
    data['RememberAudioSelections'] = this.rememberAudioSelections;
    data['RememberSubtitleSelections'] = this.rememberSubtitleSelections;
    data['EnableNextEpisodeAutoPlay'] = this.enableNextEpisodeAutoPlay;
    return data;
  }
}

class Policy {
  bool? isAdministrator;
  bool? isHidden;
  bool? isHiddenRemotely;
  bool? isDisabled;
  List<String>? blockedTags;
  bool? isTagBlockingModeInclusive;
  bool? enableUserPreferenceAccess;
  List<AccessSchedule>? accessSchedules;
  List<String>? blockUnratedItems;
  bool? enableRemoteControlOfOtherUsers;
  bool? enableSharedDeviceControl;
  bool? enableRemoteAccess;
  bool? enableLiveTvManagement;
  bool? enableLiveTvAccess;
  bool? enableMediaPlayback;
  bool? enableAudioPlaybackTranscoding;
  bool? enableVideoPlaybackTranscoding;
  bool? enablePlaybackRemuxing;
  bool? enableContentDeletion;
  List<String>? enableContentDeletionFromFolders;
  bool? enableContentDownloading;
  bool? enableSubtitleDownloading;
  bool? enableSubtitleManagement;
  bool? enableSyncTranscoding;
  bool? enableMediaConversion;
  List<String>? enabledDevices;
  bool? enableAllDevices;
  List<String>? enabledChannels;
  bool? enableAllChannels;
  List<String>? enabledFolders;
  bool? enableAllFolders;
  int? invalidLoginAttemptCount;
  bool? enablePublicSharing;
  int? remoteClientBitrateLimit;
  String? authenticationProviderId;
  List<String>? excludedSubFolders;
  int? simultaneousStreamLimit;

  Policy({
    this.isAdministrator,
    this.isHidden,
    this.isHiddenRemotely,
    this.isDisabled,
    this.blockedTags,
    this.isTagBlockingModeInclusive,
    this.enableUserPreferenceAccess,
    this.accessSchedules,
    this.blockUnratedItems,
    this.enableRemoteControlOfOtherUsers,
    this.enableSharedDeviceControl,
    this.enableRemoteAccess,
    this.enableLiveTvManagement,
    this.enableLiveTvAccess,
    this.enableMediaPlayback,
    this.enableAudioPlaybackTranscoding,
    this.enableVideoPlaybackTranscoding,
    this.enablePlaybackRemuxing,
    this.enableContentDeletion,
    this.enableContentDeletionFromFolders,
    this.enableContentDownloading,
    this.enableSubtitleDownloading,
    this.enableSubtitleManagement,
    this.enableSyncTranscoding,
    this.enableMediaConversion,
    this.enabledDevices,
    this.enableAllDevices,
    this.enabledChannels,
    this.enableAllChannels,
    this.enabledFolders,
    this.enableAllFolders,
    this.invalidLoginAttemptCount,
    this.enablePublicSharing,
    this.remoteClientBitrateLimit,
    this.authenticationProviderId,
    this.excludedSubFolders,
    this.simultaneousStreamLimit,
  });

  Policy.fromJson(Map<String, dynamic> json) {
    isAdministrator = json['IsAdministrator'];
    isHidden = json['IsHidden'];
    isHiddenRemotely = json['IsHiddenRemotely'];
    isDisabled = json['IsDisabled'];
    blockedTags = json['BlockedTags'].cast<String>();
    isTagBlockingModeInclusive = json['IsTagBlockingModeInclusive'];
    enableUserPreferenceAccess = json['EnableUserPreferenceAccess'];
    if (json['AccessSchedules'] != null) {
      accessSchedules = [];
      json['AccessSchedules'].forEach((v) {
        accessSchedules!.add(new AccessSchedule.fromJson(v));
      });
    }
    blockUnratedItems = json['BlockUnratedItems'].cast<String>();
    enableRemoteControlOfOtherUsers = json['EnableRemoteControlOfOtherUsers'];
    enableSharedDeviceControl = json['EnableSharedDeviceControl'];
    enableRemoteAccess = json['EnableRemoteAccess'];
    enableLiveTvManagement = json['EnableLiveTvManagement'];
    enableLiveTvAccess = json['EnableLiveTvAccess'];
    enableMediaPlayback = json['EnableMediaPlayback'];
    enableAudioPlaybackTranscoding = json['EnableAudioPlaybackTranscoding'];
    enableVideoPlaybackTranscoding = json['EnableVideoPlaybackTranscoding'];
    enablePlaybackRemuxing = json['EnablePlaybackRemuxing'];
    enableContentDeletion = json['EnableContentDeletion'];
    enableContentDeletionFromFolders =
        json['EnableContentDeletionFromFolders'].cast<String>();
    enableContentDownloading = json['EnableContentDownloading'];
    enableSubtitleDownloading = json['EnableSubtitleDownloading'];
    enableSubtitleManagement = json['EnableSubtitleManagement'];
    enableSyncTranscoding = json['EnableSyncTranscoding'];
    enableMediaConversion = json['EnableMediaConversion'];
    enabledDevices = json['EnabledDevices'].cast<String>();
    enableAllDevices = json['EnableAllDevices'];
    enabledChannels = json['EnabledChannels'].cast<String>();
    enableAllChannels = json['EnableAllChannels'];
    enabledFolders = json['EnabledFolders'].cast<String>();
    enableAllFolders = json['EnableAllFolders'];
    invalidLoginAttemptCount = json['InvalidLoginAttemptCount'];
    enablePublicSharing = json['EnablePublicSharing'];
    remoteClientBitrateLimit = json['RemoteClientBitrateLimit'];
    authenticationProviderId = json['AuthenticationProviderId'];
    excludedSubFolders = json['ExcludedSubFolders'].cast<String>();
    simultaneousStreamLimit = json['SimultaneousStreamLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsAdministrator'] = this.isAdministrator;
    data['IsHidden'] = this.isHidden;
    data['IsHiddenRemotely'] = this.isHiddenRemotely;
    data['IsDisabled'] = this.isDisabled;
    data['BlockedTags'] = this.blockedTags;
    data['IsTagBlockingModeInclusive'] = this.isTagBlockingModeInclusive;
    data['EnableUserPreferenceAccess'] = this.enableUserPreferenceAccess;
    if (this.accessSchedules != null) {
      data['AccessSchedules'] =
          this.accessSchedules!.map((v) => v.toJson()).toList();
    }
    data['BlockUnratedItems'] = this.blockUnratedItems;
    data['EnableRemoteControlOfOtherUsers'] =
        this.enableRemoteControlOfOtherUsers;
    data['EnableSharedDeviceControl'] = this.enableSharedDeviceControl;
    data['EnableRemoteAccess'] = this.enableRemoteAccess;
    data['EnableLiveTvManagement'] = this.enableLiveTvManagement;
    data['EnableLiveTvAccess'] = this.enableLiveTvAccess;
    data['EnableMediaPlayback'] = this.enableMediaPlayback;
    data['EnableAudioPlaybackTranscoding'] =
        this.enableAudioPlaybackTranscoding;
    data['EnableVideoPlaybackTranscoding'] =
        this.enableVideoPlaybackTranscoding;
    data['EnablePlaybackRemuxing'] = this.enablePlaybackRemuxing;
    data['EnableContentDeletion'] = this.enableContentDeletion;
    data['EnableContentDeletionFromFolders'] =
        this.enableContentDeletionFromFolders;
    data['EnableContentDownloading'] = this.enableContentDownloading;
    data['EnableSubtitleDownloading'] = this.enableSubtitleDownloading;
    data['EnableSubtitleManagement'] = this.enableSubtitleManagement;
    data['EnableSyncTranscoding'] = this.enableSyncTranscoding;
    data['EnableMediaConversion'] = this.enableMediaConversion;
    data['EnabledDevices'] = this.enabledDevices;
    data['EnableAllDevices'] = this.enableAllDevices;
    data['EnabledChannels'] = this.enabledChannels;
    data['EnableAllChannels'] = this.enableAllChannels;
    data['EnabledFolders'] = this.enabledFolders;
    data['EnableAllFolders'] = this.enableAllFolders;
    data['InvalidLoginAttemptCount'] = this.invalidLoginAttemptCount;
    data['EnablePublicSharing'] = this.enablePublicSharing;
    data['RemoteClientBitrateLimit'] = this.remoteClientBitrateLimit;
    data['AuthenticationProviderId'] = this.authenticationProviderId;
    data['ExcludedSubFolders'] = this.excludedSubFolders;
    data['SimultaneousStreamLimit'] = this.simultaneousStreamLimit;
    return data;
  }
}

class AccessSchedule {
  String? dayOfWeek;
  double? startHour;
  double? endHour;

  AccessSchedule({
    this.dayOfWeek,
    this.startHour,
    this.endHour,
  });

  AccessSchedule.fromJson(Map<String, dynamic> json) {
    dayOfWeek = json['DayOfWeek'];
    startHour = json['StartHour'];
    endHour = json['EndHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DayOfWeek'] = this.dayOfWeek;
    data['StartHour'] = this.startHour;
    data['EndHour'] = this.endHour;
    return data;
  }
}
