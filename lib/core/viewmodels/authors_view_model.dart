import 'package:audiobookly/core/services/authentication_service.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class AuthorsViewModel extends BaseModel {
  PlexApi _api;

  AuthorsViewModel({@required PlexApi plexApi}) : _api = plexApi;

  List<PlexArtist> collections;

  Future<List<PlexArtist>> getAuthors(
      String authToken, String serverUrl, String libraryKey) async {
    setBusy(true);
    // var success = await _authenticationService.login(username, password);
    setBusy(false);
    return collections;
  }

  // Future<bool> checkAuth() {
  //   return true;
  // }
}
