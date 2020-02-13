import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class AuthorsViewModel extends BaseModel {
  PlexServerV2 _server;

  AuthorsViewModel({@required PlexServerV2 server}) : _server = server;

  List<PlexArtist> authors = [];

  Future<void> getAuthors(String libraryKey) async {
    setBusy(true);
    authors = await _server.getArtists(libraryKey);
    setBusy(false);
  }
}
