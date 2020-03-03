import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';

class Downloader {
  ReceivePort _port = ReceivePort();
  StreamController<DownloaderEvent> _controller = StreamController.broadcast();
  static String portName = 'downloader_send_report';
  bool _initialized = false;

  static final Downloader _instance = Downloader._internal();

  Downloader._internal();

  factory Downloader() {
    return _instance;
  }

  Future init([String overridePortName = 'downloader_send_report']) async {
    portName = portName;
    await FlutterDownloader.initialize();
    IsolateNameServer.registerPortWithName(_port.sendPort, portName);
    _port.listen((data) {
      _controller.add(DownloaderEvent(
        id: data[0],
        status: data[1],
        progress: data[2],
      ));
    });
  }

  Future<Stream<DownloaderEvent>> connect([String overridePortName]) async {
    if (!_initialized) {
      await init(overridePortName);
      _initialized = true;
    }
    FlutterDownloader.registerCallback(downloadCallback);
    return _controller.stream;
  }

  Future downloadFile(String url, String directory, String fileName) async {
    final dir = new Directory(directory);
    bool dirExists = await dir.exists();
    if (!dirExists) {
      dir.createSync(recursive: true);
    }
    return FlutterDownloader.enqueue(
      url: url,
      savedDir: directory,
      fileName: fileName,
      openFileFromNotification: false,
      showNotification: false,
    );
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName(portName);
    send.send([id, status, progress]);
  }
}

class DownloaderEvent {
  String id;
  DownloadTaskStatus status;
  int progress;
  DownloaderEvent({
    this.id,
    this.status,
    this.progress,
  });
}
