import 'package:audiobookly/services/database/database_service.dart';

abstract class Downloader {
  DatabaseService db;
  Downloader(this.db);
  Future downloadFile(String id, String url, String path) async {}
  Future whenAllDone(String parentId) async {}
}

class DownloaderTask {
  String url;
  String path;
  DownloaderTask(this.url, this.path);
}
