import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/core/services/download_service.dart';
import 'package:audiobookly/core/services/server_communicator.dart';
import 'package:audiobookly/core/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';

class TracksViewModel extends ChangeNotifier {
  // DownloadService _downloader = Downloader();
  // StreamSubscription _downloadSub;
  ServerCommunicator _communicator;

  onReady() async {
    // _downloadSub = (await _downloader.connect()).listen((event) {});
  }

  static Future downloadTrack(DownloaderWrapper download) async {
    print('Downloading!');
    if (download == null) return;

    return await DownloadService.download(
        download.downloadUrl, download.path, download.fileName);
  }

  static Future handleDownloadAll(List<DownloaderWrapper> items) async {
    for (final item in items) {
      await downloadTrack(item);
    }
  }

  Future downloadAllTracks(List<MediaItem> items) async {
    var dir = await getExternalStorageDirectory();
    print('Starting download all');
    compute(
        handleDownloadAll,
        items
            .map(
              (item) => DownloaderWrapper.fromMediaItem(
                _communicator.getServerUrl(item.partKey),
                item,
                dir,
              ),
            )
            .toList());
  }

  void rewind() {
    AudioService.rewind();
  }

  void pause() {
    AudioService.pause();
  }

  void play() {
    AudioService.play();
  }

  Future handleDownload(MediaItem item) async {
    return await downloadAllTracks([item]);
  }
}

class DownloaderWrapper {
  String path;
  String downloadUrl;
  String fileName;

  DownloaderWrapper.fromMediaItem(String url, MediaItem item, Directory dir) {
    downloadUrl = url;
    path = p.join(dir.absolute.path, 'cache', item.artist, item.album);
    fileName = item.extras['fileName'];
  }
}
