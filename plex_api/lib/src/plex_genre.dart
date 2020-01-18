class PlexGenre {
  String tag;

  PlexGenre({this.tag});

  PlexGenre.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    return data;
  }
}