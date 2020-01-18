import 'package:plex_api/plex_api.dart';

class PlexSections {
  MediaContainer mediaContainer;

  PlexSections({this.mediaContainer});

  PlexSections.fromJson(Map<String, dynamic> json) {
    mediaContainer = json['MediaContainer'] != null
        ? new MediaContainer.fromJson(json['MediaContainer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediaContainer != null) {
      data['MediaContainer'] = this.mediaContainer.toJson();
    }
    return data;
  }
}

class MediaContainer {
  int size;
  bool allowSync;
  String identifier;
  String mediaTagPrefix;
  int mediaTagVersion;
  String title1;
  List<PlexLibrary> directory;

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
      directory = new List<PlexLibrary>();
      json['Directory'].forEach((v) {
        directory.add(new PlexLibrary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['allowSync'] = this.allowSync;
    data['identifier'] = this.identifier;
    data['mediaTagPrefix'] = this.mediaTagPrefix;
    data['mediaTagVersion'] = this.mediaTagVersion;
    data['title1'] = this.title1;
    if (this.directory != null) {
      data['Directory'] = this.directory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}