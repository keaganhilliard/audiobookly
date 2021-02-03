class EmbyArtist {
  EmbyArtist({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory EmbyArtist.fromJson(Map<String, dynamic> json) => EmbyArtist(
        name: json["Name"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Id": id,
      };
}
