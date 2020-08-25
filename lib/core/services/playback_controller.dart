import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';

class PlaybackController {
  static PlaybackController _instance;

  factory PlaybackController() {
    if (_instance == null) _instance = PlaybackController._internal();
    return _instance;
  }

  PlaybackController._internal();

  MediaItem currentItem;
  String currentItemId;

  Future playItem(MediaItem item) async {
    playFromId(item.id);
  }

  Future playFromId(String id) async {
    currentItemId = id;
    if (!AudioService.running)
      return await startAudioService(itemId: id, play: true);
    else
      return await AudioService.playFromMediaId(id);
  }

  Future handleResume() async {
    if (currentItem != null && !AudioService.running) {
      await startAudioService(itemId: currentItem.id, play: false);
    }
  }

  Future stop() async {
    await AudioService.stop();
    currentItem = null;
  }

  Future fastForward() async {}
}
