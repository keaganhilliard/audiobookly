import 'dart:async';
import 'package:plex_api/plex_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

const String PLEX_USER_TOKEN = 'plexUserToken';
const String PLEX_SERVER = 'plexServer';
const String PLEX_LIBRARY_KEY = 'plexLibraryKey';

class Plex with ChangeNotifier {
  PlexApi _api;
  bool connectionAttempted;

  Plex(PlexHeaders headers) {
    _api = PlexApi(headers: PlexHeaders(clientIdentifier: 'Audiobookly', device: 'Android'));
    connectionAttempted = false;
  }

  get connection => _api;
  get isAuthorized => _api.isAuthorized();

  void connect() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString(PLEX_USER_TOKEN);
    print(authToken);
    if (authToken != null) {
      connectionAttempted = true;
      await _api.authenticate(authToken);
    }
    notifyListeners();
  }

  void login({@required String username, @required String password}) async {
    await _api.login(username, password);
    connectionAttempted = true;
    if (isAuthorized) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(PLEX_USER_TOKEN, _api.user.authToken);
    }
    notifyListeners();
  }

  void getAuthors() async {
    _authors = await _api.getArtists('4');
  }

  List<PlexArtist> _authors = [];

  get authors => _authors;

}