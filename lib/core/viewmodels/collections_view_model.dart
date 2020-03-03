import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:audiobookly/core/services/audio_service_communicator.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';

class CollectionsViewModel extends BaseModel {
  List<MediaItem> collections;

  Future fetchCollections() async {
    setBusy(true);
    collections = await AudioServiceCommunicator.getChildren(
        AudioPlayerTask.COLLECTIONS_ID);
    setBusy(false);
  }

  Future onRefresh() async {
    collections = await AudioServiceCommunicator.getChildren(
        AudioPlayerTask.COLLECTIONS_ID);
    notifyListeners();
  }
}
