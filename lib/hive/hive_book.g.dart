// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBookAdapter extends TypeAdapter<HiveBook> {
  @override
  final int typeId = 1;

  @override
  HiveBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBook(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as Duration,
      fields[7] as Duration,
      fields[8] as bool,
      fields[9] as bool,
      fields[10] as bool,
      fields[11] as bool,
      fields[13] as DateTime?,
      fields[14] as DownloadStatus,
    )..tracks = (fields[12] as HiveList?)?.castHiveList();
  }

  @override
  void write(BinaryWriter writer, HiveBook obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.narrator)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.artPath)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.lastPlayedPosition)
      ..writeByte(8)
      ..write(obj.downloadRequested)
      ..writeByte(9)
      ..write(obj.downloadCompleted)
      ..writeByte(10)
      ..write(obj.downloadFailed)
      ..writeByte(11)
      ..write(obj.read)
      ..writeByte(13)
      ..write(obj.lastUpdate)
      ..writeByte(14)
      ..write(obj.downloadStatus)
      ..writeByte(12)
      ..write(obj.tracks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
