class PlexMetadata {
  String ratingKey;
  String key;
  String guid;
  String type;
  String title;
  String summary;
  int index;
  String thumb;
  String art;
  int addedAt;
  int updatedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratingKey'] = this.ratingKey;
    data['key'] = this.key;
    data['guid'] = this.guid;
    data['type'] = this.type;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['index'] = this.index;
    data['thumb'] = this.thumb;
    data['art'] = this.art;
    data['addedAt'] = this.addedAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

}