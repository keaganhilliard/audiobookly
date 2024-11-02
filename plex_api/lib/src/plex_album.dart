import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_tag.dart';

class PlexAlbum extends PlexMetadata {
  String? parentRatingKey;
  String? parentGuid;
  String? titleSort;
  String? parentKey;
  String? parentTitle;
  int? year;
  String? parentThumb;
  String? originallyAvailableAt;
  int? viewOffset;
  List<PlexTag>? genre;
  List<PlexTag>? collection;

  PlexAlbum.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    parentRatingKey = json['parentRatingKey'];
    parentGuid = json['parentGuid'];
    titleSort = json['titleSort'];
    parentKey = json['parentKey'];
    parentTitle = json['parentTitle'];
    year = json['year'];
    parentThumb = json['parentThumb'];
    originallyAvailableAt = json['originallyAvailableAt'];
    viewOffset = json['viewOffset'];
    if (json['Genre'] != null) {
      genre = [];
      json['Genre'].forEach((v) {
        genre!.add(PlexTag.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['parentRatingKey'] = parentRatingKey;
    data['parentGuid'] = parentGuid;
    data['titleSort'] = titleSort;
    data['parentKey'] = parentKey;
    data['parentTitle'] = parentTitle;
    data['year'] = year;
    data['parentThumb'] = parentThumb;
    data['originallyAvailableAt'] = originallyAvailableAt;
    data['viewOffset'] = viewOffset;
    if (genre != null) {
      data['Genre'] = genre!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
