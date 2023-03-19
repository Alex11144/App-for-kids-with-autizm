// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsEntityAdapter extends TypeAdapter<ItemsEntity> {
  @override
  final int typeId = 0;

  @override
  ItemsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsEntity(
      text: fields[0] as String?,
      image: fields[1] as String?,
      id: fields[2] as int?,
      spot: fields[3] as int,
      fileImage: fields[4] as Uint8List?,
      audio: fields[5] as String?,
      fileAudio: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.spot)
      ..writeByte(4)
      ..write(obj.fileImage)
      ..writeByte(5)
      ..write(obj.audio)
      ..writeByte(6)
      ..write(obj.fileAudio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
