import 'package:audiobookly/core/constants/app_constants.dart';
import 'package:audiobookly/core/services/audio_handler.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:audiobookly/core/viewmodels/book_row_view_model.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends BaseModel {
  ServerCommunicator _communicator;

  HomeViewModel({@required ServerCommunicator communicator})
      : _communicator = communicator;

  BookRowViewModel recentlyAddedModel;
  BookRowViewModel recentlyPlayedModel;

  Future init() async {
    recentlyAddedModel = BookRowViewModel(
      communicator: _communicator,
      parentMediaId: MediaIds.RECENTLY_ADDED,
    );
    recentlyPlayedModel = BookRowViewModel(
      communicator: _communicator,
      parentMediaId: MediaIds.RECENTLY_PLAYED,
    );
  }

  Future<void> onRefresh() async {
    await recentlyAddedModel?.refresh();
    await recentlyPlayedModel?.refresh();
  }
}
