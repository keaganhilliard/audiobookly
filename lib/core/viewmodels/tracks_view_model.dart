import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/downloader.dart';
import 'package:flutter/material.dart';

class TracksViewModel extends ChangeNotifier {
  Downloader _downloader = Downloader();
  StreamSubscription _downloadSub;

  onReady() async {
    _downloadSub = (await _downloader.connect()).listen((event) {});
  }

  Future downloadTrack(MediaItem item) async {}

  Future downloadAllTracks(List<MediaItem> items) async {}

  void rewind() {
    AudioService.rewind();
  }
}
