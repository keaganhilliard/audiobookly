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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fastKey'] = this.fastKey;
    data['key'] = this.key;
    data['title'] = this.title;
    return data;
  }
}