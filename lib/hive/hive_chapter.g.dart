// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveChapterAdapter extends TypeAdapter<HiveChapter> {
  @override
  final int typeId = 3;

  @override
  HiveChapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveChapter(
      id: fields[0] as String,
      start: fields[1] as double,
      end: fields[3] as double,
      title: fields[2] as String,
      bookId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveChapter obj) {
    writer
      ..writeByte(5)
      ..writeByte(3)
      ..write(obj.end)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.bookId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveChapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
