import 'dart:async';

import 'package:audiobookly/models/download_status.dart';
import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';
import 'package:audiobookly/services/download/downloader.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

final download = BehaviorSubject();

class MobileBackgroundDownloader extends Downloader {
  MobileBackgroundDownloader(super.db) {
    FileDownloader().registerCallbacks(
      taskStatusCallback: downloadStatusCallback,
      taskProgressCallback: downloadProgressCallback,
    );
  }

  @override
  Future cancelDownloads(String parentId) async {
    trackSubs[parentId]?.cancel();
    trackSubs.remove(parentId);
    final tracks = await db.getTracksForBookId(parentId).first;
    return await FileDownloader().cancelTasksWithIds(
      tracks.map((track) => track.downloadTaskId).toList(),
    );
  }

  @override
  Future downloadFile(Track track, Uri url, String path,
      [String? fileName]) async {
    final task = await DownloadTask(
      headers: {
        'Authorization': 'Bearer ${url.queryParameters['token'] ?? ''}'
      },
      url: url.toString(),
      // filename: fileName ?? track.title,
      baseDirectory: BaseDirectory.applicationDocuments,
      directory: path,
      updates: Updates.statusAndProgress,
    ).withSuggestedFilename();

    final enqueued = await FileDownloader().enqueue(task);
    print('Filename: ${task.filename}');
    print('Enqueued?: $enqueued');
    await db.insertTrack(
      track.copyWith(
        downloadTaskId: task.taskId,
        downloadPath: p.join(path, task.filename),
      ),
    );
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
      db.insertBook(book.copyWith(
        downloadStatus: DownloadStatus.succeeded,
        downloadedAt: DateTime.now(),
      ));
    }
  }
}

void downloadStatusCallback(TaskStatusUpdate statusUpdate) {
  final task = statusUpdate.task;
  final status = statusUpdate.status;
  print('downloadStatusCallback for $task with status $status');
  DatabaseService db = GetIt.I();
  switch (status) {
    case TaskStatus.failed:
      db.updateTrackDownloadProgress(task.taskId, 0, false);
    case TaskStatus.complete:
      db.updateTrackDownloadProgress(task.taskId, 1, true);
    default:
  }
}

void downloadProgressCallback(TaskProgressUpdate progressUpdate) {
  final task = progressUpdate.task;
  final progress = progressUpdate.progress;
  DatabaseService db = GetIt.I();
  print('downloadProgressCallback for $task with progress $progress');
  db.updateTrackDownloadProgress(task.taskId, progress, progress == 1);
}
