import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/download_service.dart';
import 'package:audiobookly/core/services/downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';

class TracksViewModel extends ChangeNotifier {
  // DownloadService _downloader = Downloader();
  // StreamSubscription _downloadSub;

  onReady() async {
    // _downloadSub = (await _downloader.connect()).listen((event) {});
  }

  static Future downloadTrack(DownloaderWrapper download) async {
    print('Downloading!');
    if (download == null) return;
    await for (double progress in DownloadService.downloadFile(
        download.downloadUrl, download.path, download.fileName)) {
      print(progress);
    }
  }

  static Future handleDownloadAll(List<DownloaderWrapper> items) async {
    for (final item in items) {
      await downloadTrack(item);
    }
  }

  Future downloadAllTracks(List<MediaItem> items) async {
    var dir = await getExternalStorageDirectory();
    compute(
        handleDownloadAll,
        items
            .map((item) => DownloaderWrapper.fromMediaItem(item, dir))
            .toList());
  }

  void rewind() {
    AudioService.rewind();
  }

  Future handleDownload(MediaItem item) async {}
}

class DownloaderWrapper {
  String path;
  String downloadUrl;
  String fileName;

  DownloaderWrapper.fromMediaItem(MediaItem item, Directory dir) {
    downloadUrl = item.id;
    path = p.join(dir.absolute.path, 'cache', item.artist, item.album);
    fileName =
        item.title + item.id.substring(item.id.lastIndexOf('.')).split('?')[0];
  }
}
