// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 0;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      accuracy: fields[4] as double,
      listF: (fields[1] as List).cast<String>(),
      listX0: (fields[0] as List).cast<double>(),
      maYa: (fields[2] as List)
          .map((dynamic e) => (e as List).cast<String>())
          .toList(),
      mod: fields[5] as String,
      n: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.listX0)
      ..writeByte(1)
      ..write(obj.listF)
      ..writeByte(2)
      ..write(obj.maYa)
      ..writeByte(3)
      ..write(obj.n)
      ..writeByte(4)
      ..write(obj.accuracy)
      ..writeByte(5)
      ..write(obj.mod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
