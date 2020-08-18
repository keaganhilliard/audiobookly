import 'package:plex_api/src/plex_album.dart';
import 'package:plex_api/src/plex_artist.dart';
import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_track.dart';

class PlexMetadataResponse {
  MediaContainer mediaContainer;

  PlexMetadataResponse({this.mediaContainer});

  PlexMetadataResponse.fromJson(Map<String, dynamic> json) {
    mediaContainer = json['MediaContainer'] != null
        ? new MediaContainer.fromJson(json['MediaContainer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mediaContainer != null) {
      data['MediaContainer'] = this.mediaContainer.toJson();
    }
    return data;
  }
}

class MediaContainer {
  int size;
  int totalSize;
  bool allowSync;
  String art;
  String key;
  int librarySectionID;
  String librarySectionTitle;
  String librarySectionUUID;
  String mediaTagPrefix;
  int mediaTagVersion;
  bool nocache;
  String thumb;
  String title1;
  String title2;
  String viewGroup;
  int viewMode;
  List<PlexMetadata> metadata;

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
            metadata = new List<PlexTrack>();
            jsonMetadata.forEach((v) {
              metadata.add(new PlexTrack.fromJson(v));
            });
            break;
          case 'album':
            metadata = new List<PlexAlbum>();
            jsonMetadata.forEach((v) {
              metadata.add(new PlexAlbum.fromJson(v));
            });
            break;
          case 'artist':
            metadata = new List<PlexArtist>();
            jsonMetadata.forEach((v) {
              metadata.add(new PlexArtist.fromJson(v));
            });
            break;
          default:
            metadata = new List<PlexMetadata>();
            jsonMetadata.forEach((v) {
              metadata.add(new PlexMetadata.fromJson(v));
            });
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['totalSize'] = this.totalSize;
    data['allowSync'] = this.allowSync;
    data['art'] = this.art;
    data['key'] = this.key;
    data['librarySectionID'] = this.librarySectionID;
    data['librarySectionTitle'] = this.librarySectionTitle;
    data['librarySectionUUID'] = this.librarySectionUUID;
    data['mediaTagPrefix'] = this.mediaTagPrefix;
    data['mediaTagVersion'] = this.mediaTagVersion;
    data['nocache'] = this.nocache;
    data['thumb'] = this.thumb;
    data['title1'] = this.title1;
    data['title2'] = this.title2;
    data['viewGroup'] = this.viewGroup;
    data['viewMode'] = this.viewMode;
    return data;
  }
}
