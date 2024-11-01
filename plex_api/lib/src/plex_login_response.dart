import 'package:plex_api/plex_api.dart';

class PlexLoginResponse {
  PlexUser? user;

  PlexLoginResponse({this.user});

  PlexLoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? PlexUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
