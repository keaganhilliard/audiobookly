import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/audio_service.dart';

class AudioServiceCommunicator {
  static Future<List<MediaItem>> getChildren(String parentMediaId) async {
    if (!await AudioService.running) await startAudioService();
    Completer completer = Completer();
    List<MediaItem> items = [];
    bool parentChanged = false;

    StreamSubscription sub =
        AudioService.browseMediaChildrenStream.listen((element) {
      if (parentChanged) {
        items.addAll(element);
        completer.complete();
      }
    });

    await AudioService.setBrowseMediaParent(parentMediaId);
    parentChanged = true;
    await completer.future;
    sub.cancel();
    await AudioService.setBrowseMediaParent(AudioService.MEDIA_ROOT_ID);

    return items;
  }
}
