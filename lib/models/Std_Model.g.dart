// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Std_Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StdModelAdapter extends TypeAdapter<StdModel> {
  @override
  final int typeId = 0;

  @override
  StdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StdModel(
      image: fields[0] as String,
      Name: fields[1] as dynamic,
      age: fields[2] as dynamic,
      className: fields[3] as dynamic,
      address: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, StdModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.Name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.className)
      ..writeByte(4)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
