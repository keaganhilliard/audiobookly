class PlexTag {
  String tag;

  PlexTag({this.tag});

  PlexTag.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    return data;
  }
}