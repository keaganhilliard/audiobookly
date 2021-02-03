import 'package:emby_api/src/emby_artist.dart';
import 'package:emby_api/src/emby_image_tag.dart';
import 'package:emby_api/src/emby_user_data.dart';

class EmbyItem {
  EmbyItem({
    this.name,
    this.overview,
    this.serverId,
    this.id,
    this.supportsResume,
    this.supportsSync,
    this.runTimeTicks,
    this.isFolder,
    this.parentId,
    this.type,
    this.userData,
    this.primaryImageAspectRatio,
    this.artists,
    this.artistItems,
    this.albumArtist,
    this.albumArtists,
    this.imageTags,
  });

  String name;
  String overview;
  String serverId;
  String id;
  bool supportsResume;
  bool supportsSync;
  int runTimeTicks;
  bool isFolder;
  String parentId;
  String type;
  EmbyUserData userData;
  int primaryImageAspectRatio;
  List<String> artists;
  List<EmbyArtist> artistItems;
  String albumArtist;
  List<EmbyArtist> albumArtists;
  EmbyImageTag imageTags;

  factory EmbyItem.fromJson(Map<String, dynamic> json) => EmbyItem(
        name: json["Name"],
        overview: json["Overview"],
        serverId: json["ServerId"],
        id: json["Id"],
        supportsResume: json["SupportsResume"],
        supportsSync: json["SupportsSync"],
        runTimeTicks: json["RunTimeTicks"],
        isFolder: json["IsFolder"],
        parentId: json["ParentId"],
        type: json["Type"],
        userData: EmbyUserData.fromJson(json["UserData"]),
        primaryImageAspectRatio: json["PrimaryImageAspectRatio"],
        artists: json["Artists"] != null
            ? List<String>.from(json["Artists"].map((x) => x))
            : [],
        artistItems: json["ArtistItems"] != null
            ? List<EmbyArtist>.from(
                json["ArtistItems"].map((x) => EmbyArtist.fromJson(x)))
            : [],
        albumArtist: json["AlbumArtist"],
        albumArtists: json["ArtistItems"] != null
            ? List<EmbyArtist>.from(
                json["AlbumArtists"].map((x) => EmbyArtist.fromJson(x)))
            : [],
        imageTags: EmbyImageTag.fromJson(json["ImageTags"]),
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Overview": overview,
        "ServerId": serverId,
        "Id": id,
        "SupportsResume": supportsResume,
        "SupportsSync": supportsSync,
        "RunTimeTicks": runTimeTicks,
        "IsFolder": isFolder,
        "ParentId": parentId,
        "Type": type,
        "UserData": userData.toJson(),
        "PrimaryImageAspectRatio": primaryImageAspectRatio,
        "Artists": List<dynamic>.from(artists.map((x) => x)),
        "ArtistItems": List<dynamic>.from(artistItems.map((x) => x.toJson())),
        "AlbumArtist": albumArtist,
        "AlbumArtists": List<dynamic>.from(albumArtists.map((x) => x.toJson())),
        "ImageTags": imageTags.toJson(),
      };
}
