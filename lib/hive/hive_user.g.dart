// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserAdapter extends TypeAdapter<HiveUser> {
  @override
  final int typeId = 5;

  @override
  HiveUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUser(
      id: fields[0] as String,
      token: fields[1] as String,
      isSelected: fields[6] as bool,
      serverId: fields[3] as String?,
      libraryId: fields[2] as String?,
      baseUrl: fields[4] as String?,
      serverType: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUser obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.libraryId)
      ..writeByte(3)
      ..write(obj.serverId)
      ..writeByte(4)
      ..write(obj.baseUrl)
      ..writeByte(5)
      ..write(obj._serverType)
      ..writeByte(6)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
