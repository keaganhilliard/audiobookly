import 'package:audio_service/audio_service.dart';

abstract class DownloadService {
  Future<bool> downloadItem(MediaItem item);
  Future<List<MediaItem>> getDownloadedItems();
}
