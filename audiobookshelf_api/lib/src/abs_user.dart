import 'abs_audiobook_progress.dart';
import 'abs_utils.dart';

class AbsUser {
  String id;
  String username;
  String type;
  String? stream;
  String token;
  Map<String, AbsAudiobookProgress> mediaProgress;
  List<String> seriesHideFromContinueListening;
  bool isActive;
  bool isLocked;
  DateTime? lastSeen;
  DateTime createdAt;
  Permissions permissions;
  List<String> librariesAccessible;

  AbsUser(
      {required this.id,
      required this.username,
      required this.type,
      this.stream,
      required this.token,
      required this.mediaProgress,
      required this.seriesHideFromContinueListening,
      required this.isActive,
      required this.isLocked,
      this.lastSeen,
      required this.createdAt,
      required this.permissions,
      required this.librariesAccessible});

  factory AbsUser.fromJson(Map<String, dynamic> json) => AbsUser(
        id: json['id'],
        username: json['username'],
        type: json['type'],
        stream: json['stream'],
        token: json['token'],
        mediaProgress: {
          for (final prog in json['mediaProgress'])
            prog['episodeId'] ?? prog['libraryItemId'] ?? prog['id']:
                AbsAudiobookProgress.fromJson(prog)
        },
        seriesHideFromContinueListening:
            json['seriesHideFromContinueListening'].cast<String>(),
        isActive: json['isActive'],
        isLocked: json['isLocked'],
        lastSeen: AbsUtils.parseDateTime(json['lastSeen']),
        createdAt: AbsUtils.parseDateTime(json['createdAt'])!,
        permissions: Permissions.fromJson(json['permissions']),
        librariesAccessible: json['librariesAccessible'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'type': type,
        'stream': stream,
        'token': token,
        'mediaProgress': {
          for (final e in mediaProgress.entries) e.key: e.value.toJson()
        },
        'seriesHideFromContinueListening': seriesHideFromContinueListening,
        'isActive': isActive,
        'isLocked': isLocked,
        'lastSeen': lastSeen?.millisecondsSinceEpoch,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'permissions': permissions.toJson(),
        'librariesAccessible': librariesAccessible
      };
}

class Settings {
  String? mobileOrderBy;
  bool? mobileOrderDesc;
  String? mobileFilterBy;
  String? orderBy;
  bool? orderDesc;
  String? filterBy;
  num? playbackRate;
  int? bookshelfCoverSize;

  Settings({
    this.mobileOrderBy,
    this.mobileOrderDesc,
    this.mobileFilterBy,
    this.orderBy,
    this.orderDesc,
    this.filterBy,
    this.playbackRate,
    this.bookshelfCoverSize,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    mobileOrderBy = json['mobileOrderBy'];
    mobileOrderDesc = json['mobileOrderDesc'];
    mobileFilterBy = json['mobileFilterBy'];
    orderBy = json['orderBy'];
    orderDesc = json['orderDesc'];
    filterBy = json['filterBy'];
    playbackRate = json['playbackRate'];
    bookshelfCoverSize = json['bookshelfCoverSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mobileOrderBy'] = mobileOrderBy;
    data['mobileOrderDesc'] = mobileOrderDesc;
    data['mobileFilterBy'] = mobileFilterBy;
    data['orderBy'] = orderBy;
    data['orderDesc'] = orderDesc;
    data['filterBy'] = filterBy;
    data['playbackRate'] = playbackRate;
    data['bookshelfCoverSize'] = bookshelfCoverSize;
    return data;
  }
}

class Permissions {
  bool download;
  bool update;
  bool delete;
  bool upload;
  bool accessAllLibraries;

  Permissions({
    required this.download,
    required this.update,
    required this.delete,
    required this.upload,
    required this.accessAllLibraries,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        download: json['download'],
        update: json['update'],
        delete: json['delete'],
        upload: json['upload'],
        accessAllLibraries: json['accessAllLibraries'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['download'] = download;
    data['update'] = update;
    data['delete'] = delete;
    data['upload'] = upload;
    data['accessAllLibraries'] = accessAllLibraries;
    return data;
  }
}
