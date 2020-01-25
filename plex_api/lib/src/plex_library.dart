class PlexLibrary {
  bool allowSync;
  String art;
  String composite;
  bool filters;
  bool refreshing;
  String thumb;
  String key;
  String type;
  String title;
  String agent;
  String scanner;
  String language;
  String uuid;
  int updatedAt;
  int createdAt;
  int scannedAt;
  bool content;
  bool directory;
  int contentChangedAt;
  List<Location> location;

  PlexLibrary(
      {this.allowSync,
      this.art,
      this.composite,
      this.filters,
      this.refreshing,
      this.thumb,
      this.key,
      this.type,
      this.title,
      this.agent,
      this.scanner,
      this.language,
      this.uuid,
      this.updatedAt,
      this.createdAt,
      this.scannedAt,
      this.content,
      this.directory,
      this.contentChangedAt,
      this.location});

  PlexLibrary.fromJson(Map<String, dynamic> json) {
    allowSync = json['allowSync'];
    art = json['art'];
    composite = json['composite'];
    filters = json['filters'];
    refreshing = json['refreshing'];
    thumb = json['thumb'];
    key = json['key'];
    type = json['type'];
    title = json['title'];
    agent = json['agent'];
    scanner = json['scanner'];
    language = json['language'];
    uuid = json['uuid'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    scannedAt = json['scannedAt'];
    content = json['content'];
    directory = json['directory'];
    contentChangedAt = json['contentChangedAt'];
    if (json['Location'] != null) {
      location = new List<Location>();
      json['Location'].forEach((v) {
        location.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowSync'] = this.allowSync;
    data['art'] = this.art;
    data['composite'] = this.composite;
    data['filters'] = this.filters;
    data['refreshing'] = this.refreshing;
    data['thumb'] = this.thumb;
    data['key'] = this.key;
    data['type'] = this.type;
    data['title'] = this.title;
    data['agent'] = this.agent;
    data['scanner'] = this.scanner;
    data['language'] = this.language;
    data['uuid'] = this.uuid;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['scannedAt'] = this.scannedAt;
    data['content'] = this.content;
    data['directory'] = this.directory;
    data['contentChangedAt'] = this.contentChangedAt;
    if (this.location != null) {
      data['Location'] = this.location.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toString() {
    return "Title: $title";
  }
}

class Location {
  int id;
  String path;

  Location({this.id, this.path});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    return data;
  }
}
