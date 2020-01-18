import 'dart:async';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlexBloc {
  PlexApi _api;

  Future connect() async {
    if (_api == null) _api = PlexApi(headers: PlexHeaders(clientIdentifier: 'Audiobookly', device: 'Android'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('plexToken');
    if (authToken != null) _api.authenticate(authToken);
  }
}