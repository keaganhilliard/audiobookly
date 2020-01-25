import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_tag.dart';

class PlexAlbum extends PlexMetadata {
  String parentRatingKey;
  String parentGuid;
  String titleSort;
  String parentKey;
  String parentTitle;
  int year;
  String parentThumb;
  String originallyAvailableAt;
  List<PlexTag> genre;
  List<PlexTag> collection;

  PlexAlbum.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    parentRatingKey = json['parentRatingKey'];
    parentGuid = json['parentGuid'];
    titleSort = json['titleSort'];
    parentKey = json['parentKey'];
    parentTitle = json['parentTitle'];
    year = json['year'];
    parentThumb = json['parentThumb'];
    originallyAvailableAt = json['originallyAvailableAt'];
    if (json['Genre'] != null) {
      genre = new List<PlexTag>();
      json['Genre'].forEach((v) {
        genre.add(new PlexTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['parentRatingKey'] = this.parentRatingKey;
    data['parentGuid'] = this.parentGuid;
    data['titleSort'] = this.titleSort;
    data['parentKey'] = this.parentKey;
    data['parentTitle'] = this.parentTitle;
    data['year'] = this.year;
    data['parentThumb'] = this.parentThumb;
    data['originallyAvailableAt'] = this.originallyAvailableAt;
    if (this.genre != null) {
      data['Genre'] = this.genre.map((v) => v.toJson()).toList();
    }
    return data;
  }
}