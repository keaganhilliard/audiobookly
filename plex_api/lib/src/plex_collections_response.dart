import '../plex_api.dart';

class PlexCollectionsResponse {
  MediaContainer mediaContainer;

  PlexCollectionsResponse({this.mediaContainer});

  PlexCollectionsResponse.fromJson(Map<String, dynamic> json) {
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
  String art;
  String content;
  String identifier;
  String mediaTagPrefix;
  int mediaTagVersion;
  bool nocache;
  String thumb;
  String title1;
  String title2;
  String viewGroup;
  int viewMode;
  List<PlexCollection> directory;

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
      directory = new List<PlexCollection>();
      json['Directory'].forEach((v) {
        directory.add(new PlexCollection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['allowSync'] = this.allowSync;
    data['art'] = this.art;
    data['content'] = this.content;
    data['identifier'] = this.identifier;
    data['mediaTagPrefix'] = this.mediaTagPrefix;
    data['mediaTagVersion'] = this.mediaTagVersion;
    data['nocache'] = this.nocache;
    data['thumb'] = this.thumb;
    data['title1'] = this.title1;
    data['title2'] = this.title2;
    data['viewGroup'] = this.viewGroup;
    data['viewMode'] = this.viewMode;
    if (this.directory != null) {
      data['Directory'] = this.directory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
