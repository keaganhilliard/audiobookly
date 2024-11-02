class PlexTag {
  String? tag;

  PlexTag({this.tag});

  PlexTag.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag'] = tag;
    return data;
  }
}
