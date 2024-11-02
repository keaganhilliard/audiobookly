import 'package:plex_api/src/plex_album.dart';
import 'package:plex_api/src/plex_artist.dart';
import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_track.dart';

class PlexMetadataResponse {
  MediaContainer? mediaContainer;

  PlexMetadataResponse({this.mediaContainer});

  PlexMetadataResponse.fromJson(Map<String, dynamic> json) {
    mediaContainer = json['MediaContainer'] != null
        ? MediaContainer.fromJson(json['MediaContainer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mediaContainer != null) {
      data['MediaContainer'] = mediaContainer!.toJson();
    }
    return data;
  }
}

class MediaContainer {
  int? size;
  int? totalSize;
  bool? allowSync;
  String? art;
  String? key;
  int? librarySectionID;
  String? librarySectionTitle;
  String? librarySectionUUID;
  String? mediaTagPrefix;
  int? mediaTagVersion;
  bool? nocache;
  String? thumb;
  String? title1;
  String? title2;
  String? viewGroup;
  int? viewMode;
  List<PlexMetadata>? metadata;

  MediaContainer.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    totalSize = json['totalSize'];
    allowSync = json['allowSync'];
    art = json['art'];
    key = json['key'];
    librarySectionID = json['librarySectionID'];
    librarySectionTitle = json['librarySectionTitle'];
    librarySectionUUID = json['librarySectionUUID'];
    mediaTagPrefix = json['mediaTagPrefix'];
    mediaTagVersion = json['mediaTagVersion'];
    nocache = json['nocache'];
    thumb = json['thumb'];
    title1 = json['title1'];
    title2 = json['title2'];
    viewGroup = json['viewGroup'];
    viewMode = json['viewMode'];
    if (json['Metadata'] != null) {
      dynamic jsonMetadata = json['Metadata'];
      jsonMetadata.forEach((v) {
        switch (v['type']) {
          case 'track':
            metadata = [];
            jsonMetadata.forEach((v) {
              metadata!.add(PlexTrack.fromJson(v));
            });
            break;
          case 'album':
            metadata = [];
            jsonMetadata.forEach((v) {
              metadata!.add(PlexAlbum.fromJson(v));
            });
            break;
          case 'artist':
            metadata = [];
            jsonMetadata.forEach((v) {
              metadata!.add(PlexArtist.fromJson(v));
            });
            break;
          default:
            metadata = [];
            jsonMetadata.forEach((v) {
              metadata!.add(PlexMetadata.fromJson(v));
            });
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['totalSize'] = totalSize;
    data['allowSync'] = allowSync;
    data['art'] = art;
    data['key'] = key;
    data['librarySectionID'] = librarySectionID;
    data['librarySectionTitle'] = librarySectionTitle;
    data['librarySectionUUID'] = librarySectionUUID;
    data['mediaTagPrefix'] = mediaTagPrefix;
    data['mediaTagVersion'] = mediaTagVersion;
    data['nocache'] = nocache;
    data['thumb'] = thumb;
    data['title1'] = title1;
    data['title2'] = title2;
    data['viewGroup'] = viewGroup;
    data['viewMode'] = viewMode;
    return data;
  }
}
