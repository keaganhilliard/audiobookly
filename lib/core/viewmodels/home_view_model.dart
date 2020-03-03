import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends BaseModel {
  ServerCommunicator _communicator;

  HomeViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  List<MediaItem> recentlyAdded = [];
  List<MediaItem> recentlyPlayed = [];

  Future<void> getRecentlyAdded() async {
    setBusy(true);
    recentlyAdded =
        await _communicator.getChildren(AudioPlayerTask.RECENTLY_ADDED);
    setBusy(false);
  }

  Future<void> getRecentPlayed() async {
    setBusy(true);
    recentlyPlayed =
        await _communicator.getChildren(AudioPlayerTask.RECENTLY_PLAYED);
    setBusy(false);
  }

  Future<void> onRefresh() async {
    recentlyAdded =
        await _communicator.getChildren(AudioPlayerTask.RECENTLY_ADDED);
    recentlyPlayed =
        await _communicator.getChildren(AudioPlayerTask.RECENTLY_PLAYED);
    notifyListeners();
  }
}
