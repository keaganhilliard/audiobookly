import 'package:audio_service/audio_service.dart';

abstract class DownloadService {
  // Future<bool> downloadItem(DownloadTask item);
  Future downloadBook(MediaItem book, List<MediaItem> chapters) async {}
  Future<List<MediaItem>> getDownloadedItems();
}
