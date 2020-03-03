import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/models/plex_media_item.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/audio_service_communicator.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class BooksViewModel extends BaseModel {
  // PlexServerV2 _server;

  ServerCommunicator _communicator;

  BooksViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  List<MediaItem> books = [];

  // Future fetchAllAlbums() async {
  //   setBusy(true);
  //   books = await _communicator.getChildren(MediaIds.BOOKS_ID);
  //   setBusy(false);
  // }

  // Future fetchAlbumsByArtist(String artistKey) async {
  //   setBusy(true);
  //   books = await _communicator.getChildren(artistKey);
  //   setBusy(false);
  // }

  // Future fetchAlbumsFromCollection(String collectionId) async {
  //   setBusy(true);
  //   books = await _communicator.getChildren(collectionId);
  //   setBusy(false);
  // }

  Future getAlbums(String key) async {
    setBusy(true);
    books = await _communicator.getChildren(key ?? AudioPlayerTask.BOOKS_ID);
    setBusy(false);
  }

  Future onRefresh([String key]) async {
    books = await _communicator.getChildren(key ?? AudioPlayerTask.BOOKS_ID);
    notifyListeners();
  }
}
