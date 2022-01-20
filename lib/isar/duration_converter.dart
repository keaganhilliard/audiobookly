import 'package:isar/isar.dart';

class DurationConverter extends TypeConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromIsar(int object) {
    return Duration(microseconds: object);
  }

  @override
  int toIsar(Duration object) {
    return object.inMicroseconds;
  }
}
