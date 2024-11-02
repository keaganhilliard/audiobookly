import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_tag.dart';

class PlexArtist extends PlexMetadata {
  List<PlexTag>? genre;
  List<PlexTag>? country;
  int? lastViewedAt;

  PlexArtist.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['Genre'] != null) {
      genre = [];
      json['Genre'].forEach((v) {
        genre!.add(PlexTag.fromJson(v));
      });
    }
    if (json['Country'] != null) {
      country = [];
      json['Country'].forEach((v) {
        country!.add(PlexTag.fromJson(v));
      });
    }
    lastViewedAt = json['lastViewedAt'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    if (genre != null) {
      data['Genre'] = genre!.map((v) => v.toJson()).toList();
    }
    if (country != null) {
      data['Country'] = country!.map((v) => v.toJson()).toList();
    }
    data['lastViewedAt'] = lastViewedAt;
    return data;
  }

  @override
  String toString() {
    return "Title: $title, Key: $ratingKey, LastViewedAt: $lastViewedAt";
  }
}
