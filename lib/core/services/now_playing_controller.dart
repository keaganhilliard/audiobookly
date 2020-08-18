import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  static NowPlayingController get to => Get.find();

  MediaItem currentItem;
  String currentItemId;

  Future playItem(MediaItem item) async {
    playFromId(item.id);
  }

  Future playFromId(String id) async {
    currentItemId = id;
    if (!AudioService.running) await startAudioService();
    return await AudioService.playFromMediaId(id);
  }

  Future handleResume() async {
    if (currentItem != null && !AudioService.running) {
      await startAudioService();
      return await AudioService.prepareFromMediaId(currentItem.id);
    }
  }

  Future stop() async {
    await AudioService.stop();
    currentItem = null;
  }
}
