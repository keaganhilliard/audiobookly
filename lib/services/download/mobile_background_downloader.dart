import 'dart:async';
import 'dart:developer';

import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final download = BehaviorSubject();

class MobileBackgroundDownloader extends Downloader {
  MobileBackgroundDownloader(super.db) {
    FileDownloader.initialize(
      downloadStatusCallback: downloadStatusCallback,
      downloadProgressCallback: downloadProgressCallback,
    );
  }

  @override
  Future cancelDownloads(String parentId) async {
    trackSubs[parentId]?.cancel();
    trackSubs.remove(parentId);
    final tracks = await db.getTracksForBookId(parentId).first;
    return await FileDownloader.cancelTasksWithIds(
      tracks.map((track) => track.downloadTaskId).toList(),
    );
  }

  @override
  Future downloadFile(Track track, Uri url, String path,
      [String? fileName]) async {
    final task = BackgroundDownloadTask(
      headers: {
        'Authorization': 'Bearer ${url.queryParameters['token'] ?? ''}'
      },
      url: url.toString(),
      filename: fileName ?? track.title,
      baseDirectory: BaseDirectory.applicationDocuments,
      directory: path,
      progressUpdates:
          DownloadTaskProgressUpdates.statusChangeAndProgressUpdates,
    );

    await FileDownloader.enqueue(task);
    await db.insertTrack(track.copyWith(downloadTaskId: task.taskId));
  }

  Map<String, StreamSubscription> trackSubs = {};

  @override
  Future whenAllDone(String parentId) async {
    final waitForIt = Completer();
    late StreamSubscription trackSub;
    trackSub = trackSubs.putIfAbsent(
        parentId,
        () => db.getTracksForBookId(parentId).listen((trackMap) {
              if (trackMap.every((track) => track.isDownloaded)) {
                if (!waitForIt.isCompleted) {
                  waitForIt.complete();
                }
                trackSub.cancel();
                trackSubs.remove(parentId);
              }
            }));

    await waitForIt.future;
    final book = await db.getBookById(parentId);
    if (book != null) {
      db.insertBook(book.copyWith(downloadStatus: DownloadStatus.succeeded));
    }
  }
}

Future downloadStatusCallback(
    BackgroundDownloadTask task, DownloadTaskStatus status) async {
  log('downloadStatusCallback for $task with status $status');
  if (status == DownloadTaskStatus.failed) {
    DatabaseService db = GetIt.I();
    db.updateTrackDownloadProgress(task.taskId, 0, false);
  }
}

Future downloadProgressCallback(
    BackgroundDownloadTask task, double progress) async {
  DatabaseService db = GetIt.I();
  log('downloadProgressCallback for $task with progress $progress');
  db.updateTrackDownloadProgress(task.taskId, progress, progress == 1);
}
