import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'soil_measurement.g.dart';

@HiveType(typeId: 3)
class SoilMeasurement extends Equatable {
  @HiveField(7)
  final String id;
  @HiveField(8)
  final DateTime date;
  @HiveField(9)
  final String time;
  @HiveField(10)
  final double moisture;

  const SoilMeasurement({
    required this.time,
    required this.id,
    required this.date,
    required this.moisture,
  });

  @override
  List<Object?> get props => [id, time, date, moisture];
}
