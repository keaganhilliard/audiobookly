import 'package:audiobookly/models/track.dart';
import 'package:audiobookly/services/database/database_service.dart';

abstract class Downloader {
  DatabaseService db;
  Downloader(this.db);
  Future downloadFile(Track track, Uri url, String path, [String? fileName]);
  Future whenAllDone(String parentId);
  Future cancelDownloads(String parentId);
}

class DownloaderTask {
  Track track;
  String url;
  String path;
  DownloaderTask({
    required this.track,
    required this.url,
    required this.path,
  });
}
