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
        media!.add(Media.fromJson(v));
      });
    }
    if (json['Chapter'] != null) {
      chapters = [for (final v in json['chapter']) Chapter.fromJson(v)];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['parentRatingKey'] = parentRatingKey;
    data['grandparentRatingKey'] = grandparentRatingKey;
    data['parentGuid'] = parentGuid;
    data['grandparentGuid'] = grandparentGuid;
    data['titleSort'] = titleSort;
    data['grandparentKey'] = grandparentKey;
    data['parentKey'] = parentKey;
    data['grandparentTitle'] = grandparentTitle;
    data['parentTitle'] = parentTitle;
    data['originalTitle'] = originalTitle;
    data['parentIndex'] = parentIndex;
    data['parentThumb'] = parentThumb;
    data['grandparentThumb'] = grandparentThumb;
    data['grandparentArt'] = grandparentArt;
    data['duration'] = duration;
    data['chapterSource'] = chapterSource;
    data['viewOffset'] = viewOffset;
    if (media != null) {
      data['Media'] = media!.map((v) => v.toJson()).toList();
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
        part!.add(Part.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['duration'] = duration;
    data['bitrate'] = bitrate;
    data['audioChannels'] = audioChannels;
    data['audioCodec'] = audioCodec;
    data['container'] = container;
    if (part != null) {
      data['Part'] = part!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['duration'] = duration;
    data['file'] = file;
    data['size'] = size;
    data['container'] = container;
    data['hasThumbnail'] = hasThumbnail;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filter'] = filter;
    data['tag'] = tag;
    data['index'] = index;
    data['startTimeOffset'] = startTimeOffset;
    data['endTimeOffset'] = endTimeOffset;
    return data;
  }
}
