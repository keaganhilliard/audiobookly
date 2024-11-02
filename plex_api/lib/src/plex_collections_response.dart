import '../plex_api.dart';

class PlexCollectionsResponse {
  MediaContainer? mediaContainer;

  PlexCollectionsResponse({this.mediaContainer});

  PlexCollectionsResponse.fromJson(Map<String, dynamic> json) {
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
  String? art;
  String? content;
  String? identifier;
  String? mediaTagPrefix;
  int? mediaTagVersion;
  bool? nocache;
  String? thumb;
  String? title1;
  String? title2;
  String? viewGroup;
  int? viewMode;
  List<PlexCollection>? directory;

  MediaContainer(
      {this.size,
      this.allowSync,
      this.art,
      this.content,
      this.identifier,
      this.mediaTagPrefix,
      this.mediaTagVersion,
      this.nocache,
      this.thumb,
      this.title1,
      this.title2,
      this.viewGroup,
      this.viewMode,
      this.directory});

  MediaContainer.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    allowSync = json['allowSync'];
    art = json['art'];
    content = json['content'];
    identifier = json['identifier'];
    mediaTagPrefix = json['mediaTagPrefix'];
    mediaTagVersion = json['mediaTagVersion'];
    nocache = json['nocache'];
    thumb = json['thumb'];
    title1 = json['title1'];
    title2 = json['title2'];
    viewGroup = json['viewGroup'];
    viewMode = json['viewMode'];
    if (json['Directory'] != null) {
      directory = [];
      json['Directory'].forEach((v) {
        directory!.add(PlexCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['allowSync'] = allowSync;
    data['art'] = art;
    data['content'] = content;
    data['identifier'] = identifier;
    data['mediaTagPrefix'] = mediaTagPrefix;
    data['mediaTagVersion'] = mediaTagVersion;
    data['nocache'] = nocache;
    data['thumb'] = thumb;
    data['title1'] = title1;
    data['title2'] = title2;
    data['viewGroup'] = viewGroup;
    data['viewMode'] = viewMode;
    if (directory != null) {
      data['Directory'] = directory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
