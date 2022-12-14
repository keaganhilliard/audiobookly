import 'package:plex_api/src/plex_metadata.dart';

class PlexTrack extends PlexMetadata {
  String? parentRatingKey;
  String? grandparentRatingKey;
  String? parentGuid;
  String? grandparentGuid;
  String? titleSort;
  String? grandparentKey;
  String? parentKey;
  String? grandparentTitle;
  String? parentTitle;
  String? originalTitle;
  int? parentIndex;
  String? parentThumb;
  String? grandparentThumb;
  String? grandparentArt;
  int? duration;
  String? chapterSource;
  int? viewOffset;
  List<Media>? media;
  List<Chapter>? chapters;

  PlexTrack.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    parentRatingKey = json['parentRatingKey'];
    grandparentRatingKey = json['grandparentRatingKey'];
    parentGuid = json['parentGuid'];
    grandparentGuid = json['grandparentGuid'];
    titleSort = json['titleSort'];
    grandparentKey = json['grandparentKey'];
    parentKey = json['parentKey'];
    grandparentTitle = json['grandparentTitle'];
    parentTitle = json['parentTitle'];
    originalTitle = json['originalTitle'];
    parentIndex = json['parentIndex'];
    parentThumb = json['parentThumb'];
    grandparentThumb = json['grandparentThumb'];
    grandparentArt = json['grandparentArt'];
    duration = json['duration'];
    chapterSource = json['chapterSource'];
    viewOffset = json['viewOffset'];
    if (json['Media'] != null) {
      media = [];
      json['Media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['Chapter'] != null) {
      chapters = [for (final v in json['chapter']) Chapter.fromJson(v)];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['parentRatingKey'] = this.parentRatingKey;
    data['grandparentRatingKey'] = this.grandparentRatingKey;
    data['parentGuid'] = this.parentGuid;
    data['grandparentGuid'] = this.grandparentGuid;
    data['titleSort'] = this.titleSort;
    data['grandparentKey'] = this.grandparentKey;
    data['parentKey'] = this.parentKey;
    data['grandparentTitle'] = this.grandparentTitle;
    data['parentTitle'] = this.parentTitle;
    data['originalTitle'] = this.originalTitle;
    data['parentIndex'] = this.parentIndex;
    data['parentThumb'] = this.parentThumb;
    data['grandparentThumb'] = this.grandparentThumb;
    data['grandparentArt'] = this.grandparentArt;
    data['duration'] = this.duration;
    data['chapterSource'] = this.chapterSource;
    data['viewOffset'] = this.viewOffset;
    if (this.media != null) {
      data['Media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  int? duration;
  int? bitrate;
  int? audioChannels;
  String? audioCodec;
  String? container;
  List<Part>? part;

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    bitrate = json['bitrate'];
    audioChannels = json['audioChannels'];
    audioCodec = json['audioCodec'];
    container = json['container'];
    if (json['Part'] != null) {
      part = [];
      json['Part'].forEach((v) {
        part!.add(new Part.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['duration'] = this.duration;
    data['bitrate'] = this.bitrate;
    data['audioChannels'] = this.audioChannels;
    data['audioCodec'] = this.audioCodec;
    data['container'] = this.container;
    if (this.part != null) {
      data['Part'] = this.part!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Part {
  int? id;
  String? key;
  int? duration;
  String? file;
  int? size;
  String? container;
  String? hasThumbnail;

  Part.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    duration = json['duration'];
    file = json['file'];
    size = json['size'];
    container = json['container'];
    hasThumbnail = json['hasThumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['duration'] = this.duration;
    data['file'] = this.file;
    data['size'] = this.size;
    data['container'] = this.container;
    data['hasThumbnail'] = this.hasThumbnail;
    return data;
  }
}

/*
{
  "id": 45559,
  "filter": "thumb=45559",
  "tag": "Introduction",
  "index": 1,
  "startTimeOffset": 0,
  "endTimeOffset": 11621
}
*/

class Chapter {
  int? id;
  String? filter;
  String? tag;
  int? index;
  int? startTimeOffset;
  String? endTimeOffset;

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filter = json['filter'];
    tag = json['tag'];
    index = json['index'];
    startTimeOffset = json['startTimeOffset'];
    endTimeOffset = json['endTimeOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filter'] = this.filter;
    data['tag'] = this.tag;
    data['index'] = this.index;
    data['startTimeOffset'] = this.startTimeOffset;
    data['endTimeOffset'] = this.endTimeOffset;
    return data;
  }
}
