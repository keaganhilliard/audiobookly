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
    this.composers,
    this.imageTags,
    this.album,
    this.albumId,
    this.mediaType,
  });

  String? name;
  String? overview;
  String? serverId;
  String? id;
  bool? supportsResume;
  bool? supportsSync;
  double? runTimeTicks;
  bool? isFolder;
  String? parentId;
  String? type;
  EmbyUserData? userData;
  double? primaryImageAspectRatio;
  List<String>? artists;
  List<EmbyArtist>? artistItems;
  String? albumArtist;
  List<EmbyArtist>? albumArtists;
  List<EmbyArtist>? composers;
  EmbyImageTag? imageTags;
  String? album;
  String? albumId;
  String? mediaType;

  factory EmbyItem.fromJson(Map<String, dynamic> json) => EmbyItem(
        name: json["Name"],
        overview: json["Overview"],
        serverId: json["ServerId"],
        id: json["Id"],
        supportsResume: json["SupportsResume"],
        supportsSync: json["SupportsSync"],
        runTimeTicks: json["RunTimeTicks"]?.toDouble(),
        isFolder: json["IsFolder"],
        parentId: json["ParentId"],
        type: json["Type"],
        userData: json["UserData"] != null
            ? EmbyUserData.fromJson(json["UserData"])
            : null,
        primaryImageAspectRatio: json["PrimaryImageAspectRatio"]?.toDouble(),
        artists: json["Artists"] != null
            ? List<String>.from(json["Artists"].map((x) => x))
            : [],
        artistItems: json["ArtistItems"] != null
            ? List<EmbyArtist>.from(
                json["ArtistItems"].map((x) => EmbyArtist.fromJson(x)))
            : [],
        albumArtist: json["AlbumArtist"],
        albumArtists: json["AlbumArtists"] != null
            ? List<EmbyArtist>.from(
                json["AlbumArtists"].map((x) => EmbyArtist.fromJson(x)))
            : [],
        composers: json["Composers"] != null
            ? List<EmbyArtist>.from(
                json["Composers"].map((x) => EmbyArtist.fromJson(x)))
            : [],
        album: json['Album'],
        albumId: json['AlbumId'],
        mediaType: json['MediaType'],
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
        "UserData": userData!.toJson(),
        "PrimaryImageAspectRatio": primaryImageAspectRatio,
        "Artists": List<dynamic>.from(artists!.map((x) => x)),
        "ArtistItems": List<dynamic>.from(artistItems!.map((x) => x.toJson())),
        "AlbumArtist": albumArtist,
        "AlbumArtists":
            List<dynamic>.from(albumArtists!.map((x) => x.toJson())),
        "Composers": List<dynamic>.from(composers!.map((x) => x.toJson())),
        "ImageTags": imageTags!.toJson(),
        "Album": album,
        "AlbumId": albumId,
        "MediaType": mediaType,
      };
}
