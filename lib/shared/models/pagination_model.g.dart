// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaginationModelAdapter extends TypeAdapter<PaginationModel> {
  @override
  final int typeId = 2;

  @override
  PaginationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaginationModel(
      info: fields[0] as PaginationModelInfo?,
      results: (fields[1] as List).cast<Character>(),
    );
  }

  @override
  void write(BinaryWriter writer, PaginationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.info)
      ..writeByte(1)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
