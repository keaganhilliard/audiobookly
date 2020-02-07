import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class BooksViewModel extends BaseModel {
  PlexServerV2 _server;

  BooksViewModel({@required PlexServerV2 server}) : _server = server;

  List<PlexAlbum> books = [];

  Future fetchAllAlbums(String libraryKey) async {
    setBusy(true);
     books = await _server.getAllAlbums(libraryKey);
    setBusy(false);
  }
}
