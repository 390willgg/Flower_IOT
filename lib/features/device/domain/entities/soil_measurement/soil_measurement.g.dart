// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_measurement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SoilMeasurementAdapter extends TypeAdapter<SoilMeasurement> {
  @override
  final int typeId = 3;

  @override
  SoilMeasurement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SoilMeasurement(
      time: fields[9] as String,
      id: fields[7] as String,
      date: fields[8] as DateTime,
      moisture: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SoilMeasurement obj) {
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
      other is SoilMeasurementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
