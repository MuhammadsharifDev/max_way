// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedProductAdapter extends TypeAdapter<SavedProduct> {
  @override
  final int typeId = 1;

  @override
  SavedProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedProduct(
      name: fields[0] as String,
      description: fields[1] as String,
      coast: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.coast)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
