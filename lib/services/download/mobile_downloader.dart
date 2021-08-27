import 'dart:isolate';
import 'dart:ui';

import 'package:audiobookly/database/entity/book.dart';
import 'package:audiobookly/database/entity/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:async';
import 'package:path/path.dart' as p;

class MobileDownloader extends Downloader {
  ReceivePort _port = ReceivePort();

  MobileDownloader(DatabaseService _db) : super(_db) {
    IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    _port.listen((dynamic data) async {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      Track? theTrack = await db.getTrackByDownloadTask(id);
      if (theTrack != null)
        db.insertTrack(
          theTrack.copyWith(
            downloadProgress: progress / 100,
            isDownloaded: status == DownloadTaskStatus.complete,
          ),
        );
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  Future whenAllDone(String parentId) async {
    final completer = Completer();
    StreamSubscription? trackSub;
    trackSub = db
        .getTracksForBookId(parentId)
        .where((tracks) => tracks.values.every((track) => track.isDownloaded))
        .listen((tracks) async {
      trackSub?.cancel();
      final tasks = await FlutterDownloader.loadTasks();

      final trackMap = {
        for (final track in tracks.values) track.downloadTaskId: track
      };

      final List<Track> tracksToUpdate = [];

      if (tasks != null) {
        for (final task in tasks) {
          if (trackMap.containsKey(task.taskId)) {
            FlutterDownloader.remove(taskId: task.taskId);
            Track? t = trackMap[task.taskId];
            if (t != null) {
              tracksToUpdate.add(
                t.copyWith(
                  downloadPath: p.join(task.savedDir, task.filename),
                ),
              );
            }
          }
        }
        ;

        await db.insertTracks(tracksToUpdate);
      }

      Book? book = await db.getBookById(parentId);
      if (book != null) {
        await db.insertBook(
          book.copyWith(
            downloadRequested: true,
            downloadCompleted: true,
            downloadFailed: false,
          ),
        );
        completer.complete();
      }
    });
    return completer.future;
  }

  Future downloadFile(String id, String url, String path) async {
    String? id = await FlutterDownloader.enqueue(
      url: url,
      savedDir: path,
      showNotification: false,
      openFileFromNotification: false,
    );
    if (id != null) {
      print('$id');
      final track = await db.getTrack(id);
      if (track != null)
        await db.insertTrack(track.copyWith(downloadTaskId: id));
    }
    return id;
  }

  static void downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }
}
