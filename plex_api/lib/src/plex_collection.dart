class PlexCollection {
  String? fastKey;
  String? key;
  String? title;

  PlexCollection({this.fastKey, this.key, this.title});

  PlexCollection.fromJson(Map<String, dynamic> json) {
    fastKey = json['fastKey'];
    key = json['key'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fastKey'] = fastKey;
    data['key'] = key;
    data['title'] = title;
    return data;
  }
}
