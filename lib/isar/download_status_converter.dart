import 'package:audiobookly/models/download_status.dart';
import 'package:isar/isar.dart';

class DownloadStatusConverter extends TypeConverter<DownloadStatus, int> {
  const DownloadStatusConverter(); // Converters need to have an empty const constructor

  @override
  DownloadStatus fromIsar(int object) {
    return object >= 0 ? DownloadStatus.values[object] : DownloadStatus.none;
  }

  @override
  int toIsar(DownloadStatus object) {
    return object.index;
  }
}
