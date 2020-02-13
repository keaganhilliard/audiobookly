import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:plex_api/plex_api.dart';

class CollectionsViewModel extends BaseModel {
  PlexServerV2 _server;

  CollectionsViewModel({@required PlexServerV2 server}) : _server = server;

  List<PlexCollection> collections;

  PlexServerV2 get server => _server;

  Future fetchCollections(String libraryKey) async {
    setBusy(true);
    collections = await _server.getCollections(libraryKey);
    setBusy(false);
  }
}
