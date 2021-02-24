import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/database/entities.dart';

abstract class DownloadService {
  Future<bool> downloadItem(DownloadTask item);
  Future<List<MediaItem>> getDownloadedItems();
}
