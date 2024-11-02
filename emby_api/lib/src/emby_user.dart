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
        ? Configuration.fromJson(json['Configuration'])
        : null;
    policy = json['Policy'] != null ? Policy.fromJson(json['Policy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['ServerId'] = serverId;
    data['Id'] = id;
    data['ConnectUserName'] = connectUserName;
    data['ConnectLinkType'] = connectLinkType;
    data['HasPassword'] = hasPassword;
    data['HasConfiguredPassword'] = hasConfiguredPassword;
    data['HasConfiguredEasyPassword'] = hasConfiguredEasyPassword;
    data['LastLoginDate'] = lastLoginDate?.toIso8601String();
    data['LastActivityDate'] = lastActivityDate?.toIso8601String();
    data['Configuration'] = configuration?.toJson();
    data['Policy'] = policy?.toJson();
    return data;
  }
}

class Configuration {
  String? audioLanguagePreference;
  bool? playDefaultAudioTrack;
  String? subtitleLanguagePreference;
  bool? displayMissingEpisodes;
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
    subtitleMode = json['SubtitleMode'];
    displayCollectionsView = json['DisplayCollectionsView'];
    enableLocalPassword = json['EnableLocalPassword'];
    orderedViews = json['OrderedViews']?.cast<String>();
    latestItemsExcludes = json['LatestItemsExcludes']?.cast<String>();
    myMediaExcludes = json['MyMediaExcludes']?.cast<String>();
    hidePlayedInLatest = json['HidePlayedInLatest'];
    rememberAudioSelections = json['RememberAudioSelections'];
    rememberSubtitleSelections = json['RememberSubtitleSelections'];
    enableNextEpisodeAutoPlay = json['EnableNextEpisodeAutoPlay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AudioLanguagePreference'] = audioLanguagePreference;
    data['PlayDefaultAudioTrack'] = playDefaultAudioTrack;
    data['SubtitleLanguagePreference'] = subtitleLanguagePreference;
    data['DisplayMissingEpisodes'] = displayMissingEpisodes;
    data['SubtitleMode'] = subtitleMode;
    data['DisplayCollectionsView'] = displayCollectionsView;
    data['EnableLocalPassword'] = enableLocalPassword;
    data['OrderedViews'] = orderedViews;
    data['LatestItemsExcludes'] = latestItemsExcludes;
    data['MyMediaExcludes'] = myMediaExcludes;
    data['HidePlayedInLatest'] = hidePlayedInLatest;
    data['RememberAudioSelections'] = rememberAudioSelections;
    data['RememberSubtitleSelections'] = rememberSubtitleSelections;
    data['EnableNextEpisodeAutoPlay'] = enableNextEpisodeAutoPlay;
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
    blockedTags = json['BlockedTags']?.cast<String>();
    isTagBlockingModeInclusive = json['IsTagBlockingModeInclusive'];
    enableUserPreferenceAccess = json['EnableUserPreferenceAccess'];
    accessSchedules = json['AccessSchedules']
        ?.map<AccessSchedule>((v) => AccessSchedule.fromJson(v))
        .toList();
    blockUnratedItems = json['BlockUnratedItems']?.cast<String>();
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
        json['EnableContentDeletionFromFolders']?.cast<String>();
    enableContentDownloading = json['EnableContentDownloading'];
    enableSubtitleDownloading = json['EnableSubtitleDownloading'];
    enableSubtitleManagement = json['EnableSubtitleManagement'];
    enableSyncTranscoding = json['EnableSyncTranscoding'];
    enableMediaConversion = json['EnableMediaConversion'];
    enabledDevices = json['EnabledDevices']?.cast<String>();
    enableAllDevices = json['EnableAllDevices'];
    enabledChannels = json['EnabledChannels']?.cast<String>();
    enableAllChannels = json['EnableAllChannels'];
    enabledFolders = json['EnabledFolders']?.cast<String>();
    enableAllFolders = json['EnableAllFolders'];
    invalidLoginAttemptCount = json['InvalidLoginAttemptCount'];
    enablePublicSharing = json['EnablePublicSharing'];
    remoteClientBitrateLimit = json['RemoteClientBitrateLimit'];
    authenticationProviderId = json['AuthenticationProviderId'];
    excludedSubFolders = json['ExcludedSubFolders']?.cast<String>();
    simultaneousStreamLimit = json['SimultaneousStreamLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsAdministrator'] = isAdministrator;
    data['IsHidden'] = isHidden;
    data['IsHiddenRemotely'] = isHiddenRemotely;
    data['IsDisabled'] = isDisabled;
    data['BlockedTags'] = blockedTags;
    data['IsTagBlockingModeInclusive'] = isTagBlockingModeInclusive;
    data['EnableUserPreferenceAccess'] = enableUserPreferenceAccess;
    data['AccessSchedules'] = accessSchedules?.map((v) => v.toJson()).toList();
    data['BlockUnratedItems'] = blockUnratedItems;
    data['EnableRemoteControlOfOtherUsers'] = enableRemoteControlOfOtherUsers;
    data['EnableSharedDeviceControl'] = enableSharedDeviceControl;
    data['EnableRemoteAccess'] = enableRemoteAccess;
    data['EnableLiveTvManagement'] = enableLiveTvManagement;
    data['EnableLiveTvAccess'] = enableLiveTvAccess;
    data['EnableMediaPlayback'] = enableMediaPlayback;
    data['EnableAudioPlaybackTranscoding'] = enableAudioPlaybackTranscoding;
    data['EnableVideoPlaybackTranscoding'] = enableVideoPlaybackTranscoding;
    data['EnablePlaybackRemuxing'] = enablePlaybackRemuxing;
    data['EnableContentDeletion'] = enableContentDeletion;
    data['EnableContentDeletionFromFolders'] = enableContentDeletionFromFolders;
    data['EnableContentDownloading'] = enableContentDownloading;
    data['EnableSubtitleDownloading'] = enableSubtitleDownloading;
    data['EnableSubtitleManagement'] = enableSubtitleManagement;
    data['EnableSyncTranscoding'] = enableSyncTranscoding;
    data['EnableMediaConversion'] = enableMediaConversion;
    data['EnabledDevices'] = enabledDevices;
    data['EnableAllDevices'] = enableAllDevices;
    data['EnabledChannels'] = enabledChannels;
    data['EnableAllChannels'] = enableAllChannels;
    data['EnabledFolders'] = enabledFolders;
    data['EnableAllFolders'] = enableAllFolders;
    data['InvalidLoginAttemptCount'] = invalidLoginAttemptCount;
    data['EnablePublicSharing'] = enablePublicSharing;
    data['RemoteClientBitrateLimit'] = remoteClientBitrateLimit;
    data['AuthenticationProviderId'] = authenticationProviderId;
    data['ExcludedSubFolders'] = excludedSubFolders;
    data['SimultaneousStreamLimit'] = simultaneousStreamLimit;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DayOfWeek'] = dayOfWeek;
    data['StartHour'] = startHour;
    data['EndHour'] = endHour;
    return data;
  }
}
