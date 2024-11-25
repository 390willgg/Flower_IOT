// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_measurement_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoilMeasurementModelAdapter extends TypeAdapter<SoilMeasurementModel> {
  @override
  final int typeId = 2;

  @override
  SoilMeasurementModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SoilMeasurementModel(
      time: fields[9] as String,
      id: fields[7] as String,
      date: fields[8] as DateTime,
      moisture: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SoilMeasurementModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.date)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.moisture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoilMeasurementModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
