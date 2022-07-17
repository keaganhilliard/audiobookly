import 'package:audiobookly/models/download_status.dart';
import 'package:hive/hive.dart';

class DateTimeAdapter extends TypeAdapter<DownloadStatus> {
  @override
  final typeId = 115;

  @override
  DownloadStatus read(BinaryReader reader) {
    return DownloadStatus.values[reader.read()];
  }

  @override
  void write(BinaryWriter writer, DownloadStatus obj) {
    writer.write(obj.index);
  }
}
