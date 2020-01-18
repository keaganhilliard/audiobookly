import 'package:plex_api/src/plex_country.dart';
import 'package:plex_api/src/plex_genre.dart';
import 'package:plex_api/src/plex_metadata.dart';

class PlexArtist extends PlexMetadata {
  List<PlexGenre> genre;
  List<PlexCountry> country;
  int lastViewedAt;

  PlexArtist.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['Genre'] != null) {
      genre = new List<PlexGenre>();
      json['Genre'].forEach((v) {
        genre.add(new PlexGenre.fromJson(v));
      });
    }
    if (json['Country'] != null) {
      country = new List<PlexCountry>();
      json['Country'].forEach((v) {
        country.add(new PlexCountry.fromJson(v));
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
