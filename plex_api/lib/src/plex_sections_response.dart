import 'package:plex_api/plex_api.dart';

class PlexSections {
  MediaContainer? mediaContainer;

  PlexSections({this.mediaContainer});

  PlexSections.fromJson(Map<String, dynamic> json) {
    mediaContainer = json['MediaContainer'] != null
        ? MediaContainer.fromJson(json['MediaContainer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mediaContainer != null) {
      data['MediaContainer'] = mediaContainer!.toJson();
    }
    return data;
  }
}

class MediaContainer {
  int? size;
  bool? allowSync;
  String? identifier;
  String? mediaTagPrefix;
  int? mediaTagVersion;
  String? title1;
  List<PlexLibrary>? directory;

  MediaContainer(
      {this.size,
      this.allowSync,
      this.identifier,
      this.mediaTagPrefix,
      this.mediaTagVersion,
      this.title1,
      this.directory});

  MediaContainer.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    allowSync = json['allowSync'];
    identifier = json['identifier'];
    mediaTagPrefix = json['mediaTagPrefix'];
    mediaTagVersion = json['mediaTagVersion'];
    title1 = json['title1'];
    if (json['Directory'] != null) {
      directory = [];
      json['Directory'].forEach((v) {
        directory!.add(PlexLibrary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['allowSync'] = allowSync;
    data['identifier'] = identifier;
    data['mediaTagPrefix'] = mediaTagPrefix;
    data['mediaTagVersion'] = mediaTagVersion;
    data['title1'] = title1;
    if (directory != null) {
      data['Directory'] = directory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
