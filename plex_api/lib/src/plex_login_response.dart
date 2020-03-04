import 'package:plex_api/plex_api.dart';

class PlexLoginResponse {
  PlexUser user;

  PlexLoginResponse({this.user});

  PlexLoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new PlexUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}
