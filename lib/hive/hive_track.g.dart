// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_track.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTrackAdapter extends TypeAdapter<HiveTrack> {
  @override
  final int typeId = 2;

  @override
  HiveTrack read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTrack(
      fields[0] as String,
      fields[1] as String,
      fields[2] as Duration,
      fields[3] as double,
      fields[4] as bool,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTrack obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.downloadProgress)
      ..writeByte(4)
      ..write(obj.isDownloaded)
      ..writeByte(5)
      ..write(obj.downloadPath)
      ..writeByte(6)
      ..write(obj.bookId)
      ..writeByte(7)
      ..write(obj.downloadTaskId)
      ..writeByte(8)
      ..write(obj.downloadTaskStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTrackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
