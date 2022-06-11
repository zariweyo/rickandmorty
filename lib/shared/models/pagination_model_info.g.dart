// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationModelInfoAdapter extends TypeAdapter<PaginationModelInfo> {
  @override
  final int typeId = 3;

  @override
  PaginationModelInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationModelInfo(
      count: fields[0] as int,
      pages: fields[1] as int,
      next: fields[2] as String,
      prev: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaginationModelInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.pages)
      ..writeByte(2)
      ..write(obj.next)
      ..writeByte(3)
      ..write(obj.prev);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationModelInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
