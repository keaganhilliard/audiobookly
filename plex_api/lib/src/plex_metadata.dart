class PlexMetadata {
  String? ratingKey;
  String? key;
  String? guid;
  String? type;
  String? title;
  String? summary;
  int? index;
  String? thumb;
  String? art;
  int? addedAt;
  int? updatedAt;

  PlexMetadata(
      {this.ratingKey,
      this.key,
      this.guid,
      this.type,
      this.title,
      this.summary,
      this.index,
      this.thumb,
      this.art,
      this.addedAt,
      this.updatedAt});

  PlexMetadata.fromJson(Map<String, dynamic> json) {
    ratingKey = json['ratingKey'];
    key = json['key'];
    guid = json['guid'];
    type = json['type'];
    title = json['title'];
    summary = json['summary'];
    index = json['index'];
    thumb = json['thumb'];
    art = json['art'];
    addedAt = json['addedAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ratingKey'] = ratingKey;
    data['key'] = key;
    data['guid'] = guid;
    data['type'] = type;
    data['title'] = title;
    data['summary'] = summary;
    data['index'] = index;
    data['thumb'] = thumb;
    data['art'] = art;
    data['addedAt'] = addedAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
