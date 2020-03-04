import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class CollectionsViewModel extends BaseModel {
  List<MediaItem> collections;

  final ServerCommunicator _communicator;

  CollectionsViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  Future fetchCollections() async {
    setBusy(true);
    collections =
        await _communicator.getChildren(AudioPlayerTask.COLLECTIONS_ID);
    setBusy(false);
  }

  Future onRefresh() async {
    collections =
        await _communicator.getChildren(AudioPlayerTask.COLLECTIONS_ID);
    notifyListeners();
  }
}
