class AbsLibrary {
  AbsLibrary({
    this.id,
    this.name,
    this.folders,
    this.displayOrder,
    this.icon,
    this.createdAt,
    this.lastUpdate,
  });

  String? id;
  String? name;
  List<AbsFolder>? folders;
  int? displayOrder;
  String? icon;
  int? createdAt;
  int? lastUpdate;

  factory AbsLibrary.fromJson(Map<String, dynamic> json) => AbsLibrary(
        id: json["id"],
        name: json["name"],
        folders: [for (var x in json["folders"]) AbsFolder.fromJson(x)],
        displayOrder: json["displayOrder"],
        icon: json["icon"],
        createdAt: json["createdAt"],
        lastUpdate: json["lastUpdate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "folders": [for (var x in folders ?? []) x.toJson()],
        "displayOrder": displayOrder,
        "icon": icon,
        "createdAt": createdAt,
        "lastUpdate": lastUpdate,
      };
}

class AbsFolder {
  AbsFolder({
    this.id,
    this.fullPath,
    this.libraryId,
  });

  String? id;
  String? fullPath;
  String? libraryId;

  factory AbsFolder.fromJson(Map<String, dynamic> json) => AbsFolder(
        id: json["id"],
        fullPath: json["fullPath"],
        libraryId: json["libraryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullPath": fullPath,
        "libraryId": libraryId,
      };
}
