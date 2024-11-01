class PlexLibrary {
  bool? allowSync;
  String? art;
  String? composite;
  bool? filters;
  bool? refreshing;
  String? thumb;
  String? key;
  String? type;
  String? title;
  String? agent;
  String? scanner;
  String? language;
  String? uuid;
  int? updatedAt;
  int? createdAt;
  int? scannedAt;
  bool? content;
  bool? directory;
  int? contentChangedAt;
  List<Location>? location;

  PlexLibrary({
    this.allowSync,
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
    this.location,
  });

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
      location = [];
      json['Location'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allowSync'] = allowSync;
    data['art'] = art;
    data['composite'] = composite;
    data['filters'] = filters;
    data['refreshing'] = refreshing;
    data['thumb'] = thumb;
    data['key'] = key;
    data['type'] = type;
    data['title'] = title;
    data['agent'] = agent;
    data['scanner'] = scanner;
    data['language'] = language;
    data['uuid'] = uuid;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    data['scannedAt'] = scannedAt;
    data['content'] = content;
    data['directory'] = directory;
    data['contentChangedAt'] = contentChangedAt;
    if (location != null) {
      data['Location'] = location!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String toString() {
    return "Title: $title";
  }
}

class Location {
  int? id;
  String? path;

  Location({this.id, this.path});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['path'] = path;
    return data;
  }
}
