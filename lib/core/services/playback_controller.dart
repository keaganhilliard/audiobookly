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
    return playFromId(item.id);
  }

  Future playFromId(String id, [bool play = true]) async {
    if (id == currentItemId && AudioService.running) return;

    currentItemId = id;
    if (!AudioService.running)
      return await startAudioService(itemId: id, play: play);
    else
      return await AudioService.playFromMediaId(id);
  }

  Future handleResume() async {
    if (currentItemId != null) return playFromId(currentItemId, false);
  }

  Future stop() async {
    await AudioService.stop();
    currentItem = null;
  }

  Future fastForward() async {}
}
