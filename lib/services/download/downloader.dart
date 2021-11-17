import 'package:audiobookly/services/database/database_service.dart';

abstract class Downloader {
  DatabaseService db;
  Downloader(this.db);
  Future downloadFile(String id, String url, String path);
  Future whenAllDone(String parentId);
  Future cancelDownloads(String parentId);
}

class DownloaderTask {
  String id;
  String url;
  String path;
  DownloaderTask({
    required this.id,
    required this.url,
    required this.path,
  });
}
