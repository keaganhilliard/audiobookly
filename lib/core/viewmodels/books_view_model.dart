import 'dart:async';

import 'package:audiobookly/core/models/audiobookly_media_item.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class BooksViewModel extends BaseModel {
  ServerCommunicator _communicator;

  BooksViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  List<AudiobooklyMediaItem> books = [];

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
