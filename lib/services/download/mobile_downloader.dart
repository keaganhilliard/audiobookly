// import 'dart:developer';
// import 'dart:isolate';
// import 'dart:ui';
// import 'dart:async';
// import 'package:audiobookly/isar/isar_track.dart';
// import 'package:audiobookly/models/book.dart';
// import 'package:audiobookly/models/download_status.dart';
// import 'package:audiobookly/models/track.dart';
// import 'package:audiobookly/services/database/database_service.dart';
// import 'package:audiobookly/services/download/downloader.dart';
// import 'package:audiobookly/utils/utils.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path/path.dart' as p;

// class MobileDownloader extends Downloader {
//   final ReceivePort _port = ReceivePort();

//   MobileDownloader(super.db) {
//     IsolateNameServer.registerPortWithName(
//       _port.sendPort,
//       'downloader_send_port',
//     );

//     _port.listen((dynamic data) async {
//       log('SENDPORT: $data');
//       if (data is Map && data.containsKey('id')) {
//         String taskId = data['id'];
//         DownloadTaskStatus status = data['status'];
//         int progress = data['progress'];
//         await db.updateTrackDownloadProgress(
//           taskId,
//           progress / 100,
//           status == DownloadTaskStatus.complete,
//         );
//       }
//     });

//     FlutterDownloader.registerCallback(downloadCallback);
//   }

//   @override
//   Future cancelDownloads(String parentId) async {
//     timers[parentId]?.cancel();
//     timers.remove(parentId);
//     if (!(completers[parentId]?.isCompleted ?? true)) {
//       completers[parentId]?.completeError('Cancelled');
//     }
//     completers.remove(parentId);

//     final tracks = await db.getTracksForBookId(parentId).first;
//     final tasks = await FlutterDownloader.loadTasksWithRawQuery(
//           query:
//               "SELECT * FROM task WHERE task_id in ('${tracks.map((entry) => entry.downloadTaskId).join("','")}')",
//         ) ??
//         [];

//     var taskMap = <String, DownloadTask>{};
//     for (final task in tasks) {
//       print('Cancelling ${task.taskId}');
//       if (task.status != DownloadTaskStatus.complete) {
//         await FlutterDownloader.remove(
//           taskId: task.taskId,
//           shouldDeleteContent: true,
//         );
//       }
//     }
//     await db.deleteTracks(tracks);
//     // await db.insertTracks(tracks.values.map((track) {
//     //   return track.copyWith(
//     //     downloadTaskId: '',
//     //     downloadPath: '',
//     //     downloadProgress: 0,
//     //   );
//     // }).toList());
//   }

//   Map<String, Timer> timers = {};
//   Map<String, Completer> completers = {};

//   @override
//   Future whenAllDone(String parentId) async {
//     final completer = completers.putIfAbsent(parentId, () {
//       final completer = Completer();
//       completer.future.then((value) {
//         timers.remove(parentId);
//         completers.remove(parentId);
//       });
//       return completer;
//     });
//     timers.putIfAbsent(
//         parentId,
//         () => Timer.periodic(const Duration(seconds: 2), (timer) async {
//               final tracks = await db.getTracksForBookId(parentId).first;
//               final trackMap = {
//                 for (final track in tracks) track.downloadTaskId: track
//               };
//               final tasks = await FlutterDownloader.loadTasksWithRawQuery(
//                   query:
//                       "SELECT * FROM task WHERE task_id in ('${trackMap.entries.map((entry) => entry.key).join("','")}')");
//               log(trackMap.entries.map((entry) => entry.key).join("','"));
//               log(tasks?.map((task) => task.filename).join(',') ?? 'No tasks');
//               log(tasks?.map((task) => task.progress).join(',') ?? 'No tasks');
//               log(tasks?.map((task) => task.status).join(',') ?? 'No tasks');

//               if (tasks?.every(
//                       (task) => task.status == DownloadTaskStatus.complete) ??
//                   false) {
//                 timer.cancel();
//                 final List<Track> tracksToUpdate = [];

//                 if (tasks != null) {
//                   for (final task in tasks) {
//                     if (trackMap.containsKey(task.taskId)) {
//                       FlutterDownloader.remove(taskId: task.taskId);
//                       Track? t = trackMap[task.taskId];
//                       if (t != null) {
//                         tracksToUpdate.add(
//                           t.copyWith(
//                             downloadPath: p.join(task.savedDir, task.filename),
//                             downloadProgress: 1,
//                             isDownloaded: true,
//                           ),
//                         );
//                       }
//                     }
//                   }
//                   await db.insertTracks(tracksToUpdate);
//                 }
//                 Book? book = await db.getBookById(parentId);
//                 if (book != null) {
//                   log('This should mean that the download happened');
//                   await db.insertBook(
//                     book.copyWith(
//                       downloadStatus: DownloadStatus.succeeded,
//                     ),
//                   );
//                   completer.complete();
//                 }
//               }
//             }));
//     return completer.future;
//   }

//   @override
//   Future downloadFile(Track track, Uri url, String path,
//       [String? fileName]) async {
//     String? taskId = await FlutterDownloader.enqueue(
//       url: url.toString(),
//       savedDir: p.join((await Utils.getBasePath())!.path, path),
//       showNotification: false,
//       openFileFromNotification: false,
//       fileName: fileName,
//     );
//     if (taskId != null) {
//       await db.insertTrack(track.copyWith(downloadTaskId: taskId));
//     }
//     return taskId;
//   }

//   static void downloadCallback(
//     String id,
//     DownloadTaskStatus status,
//     int progress,
//   ) {
//     final SendPort? send =
//         IsolateNameServer.lookupPortByName('downloader_send_port');
//     send?.send({'id': id, 'status': status, 'progress': progress});
//   }
// }
