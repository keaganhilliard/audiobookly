import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class BookRowViewModel extends BaseModel {
  ServerCommunicator _communicator;
  String _parentMediaId;

  BookRowViewModel(
      {@required ServerCommunicator communicator, String parentMediaId})
      : _communicator = communicator,
        _parentMediaId = parentMediaId;

  List<MediaItem> items = [];

  Future<void> init() async {
    setBusy(true);
    items = await _communicator.getChildren(_parentMediaId);
    setBusy(false);
  }

  Future<void> refresh() async {
    items = await _communicator.getChildren(_parentMediaId);
    notifyListeners();
  }
}
