import 'package:plex_api/src/plex_metadata.dart';
import 'package:plex_api/src/plex_tag.dart';

class PlexArtist extends PlexMetadata {
  List<PlexTag> genre;
  List<PlexTag> country;
  int lastViewedAt;

  PlexArtist.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['Genre'] != null) {
      genre = new List<PlexTag>();
      json['Genre'].forEach((v) {
        genre.add(new PlexTag.fromJson(v));
      });
    }
    if (json['Country'] != null) {
      country = new List<PlexTag>();
      json['Country'].forEach((v) {
        country.add(new PlexTag.fromJson(v));
      });
    }
    lastViewedAt = json['lastViewedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    if (this.genre != null) {
      data['Genre'] = this.genre.map((v) => v.toJson()).toList();
    }
    if (this.country != null) {
      data['Country'] = this.country.map((v) => v.toJson()).toList();
    }
    data['lastViewedAt'] = this.lastViewedAt;
    return data;
  }

  String toString() {
    return "Title: $title, Key: $ratingKey, LastViewedAt: $lastViewedAt";
  }
}
