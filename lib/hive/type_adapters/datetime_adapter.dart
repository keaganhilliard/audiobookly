import 'package:hive/hive.dart';

class DateTimeAdapter extends TypeAdapter<DateTime> {
  @override
  final typeId = 110;

  @override
  DateTime read(BinaryReader reader) {
    return DateTime.fromMillisecondsSinceEpoch(reader.read());
  }

  @override
  void write(BinaryWriter writer, DateTime obj) {
    writer.write(obj.millisecondsSinceEpoch);
  }
}
