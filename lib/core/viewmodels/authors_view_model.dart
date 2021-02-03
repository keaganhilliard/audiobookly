import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/audio_handler.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

import 'package:plex_api/plex_api.dart';

class AuthorsViewModel extends BaseModel {
  ServerCommunicator _communicator;
  AuthorsViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  List<PlexArtist> authors = [];
  List<MediaItem> items = [];

  Future<void> getAuthors() async {
    setBusy(true);
    items = await _communicator.getChildren(MediaIds.AUTHORS_ID);
    setBusy(false);
  }

  Future<void> onRefresh() async {
    items = await _communicator.getChildren(MediaIds.AUTHORS_ID);
    notifyListeners();
  }
}
