import 'package:isar/isar.dart';

class DateTimeConverter extends TypeConverter<DateTime?, int?> {
  const DateTimeConverter();

  @override
  DateTime? fromIsar(int? object) => object == null ? null : DateTime.fromMillisecondsSinceEpoch(object);

  @override
  int? toIsar(DateTime? object) => object?.millisecondsSinceEpoch;
}
