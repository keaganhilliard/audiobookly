import 'package:hive/hive.dart';

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final typeId = 100;

  @override
  Duration read(BinaryReader reader) {
    return Duration(microseconds: reader.read());
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.write(obj.inMicroseconds);
  }
}
