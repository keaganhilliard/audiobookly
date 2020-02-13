import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class HomeViewModel extends BaseModel {
  PlexServerV2 _server;

  HomeViewModel({@required PlexServerV2 server}) : _server = server;

  List<PlexAlbum> recentlyAdded = [];
  List<PlexAlbum> recentlyPlayed = [];

  Future<void> getRecentlyAdded(String libraryKey) async {
    setBusy(true);
    recentlyAdded = await _server.getRecentlyAdded(libraryKey);
    setBusy(false);
  }

  Future<void> getRecentPlayed(String libraryKey) async {
    setBusy(true);
    recentlyPlayed = await _server.getRecentlyViewed(libraryKey);
    recentlyPlayed = await Future.wait(recentlyPlayed.map((album) async {
      return await _server.getAlbumFromKey(album.ratingKey);
    }));
    setBusy(false);
  }
}
