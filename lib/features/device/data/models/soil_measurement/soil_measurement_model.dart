import 'package:flower_project/features/device/domain/entities/soil_measurement/soil_measurement.dart';
import 'package:hive/hive.dart';

part 'soil_measurement_model.g.dart';

@HiveType(typeId: 2)
class SoilMeasurementModel extends SoilMeasurement {
  const SoilMeasurementModel({
    required super.time,
    required super.id,
    required super.date,
    required super.moisture,
  });

  factory SoilMeasurementModel.fromJson(Map<String, dynamic> data, String id) {
    return SoilMeasurementModel(
      id: id,
      date: DateTime.parse(data['date']),
      time: data['time'],
      moisture: data['moisture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'time': time,
      'moisture': moisture,
    };
  }

  static List<SoilMeasurementModel> fromJsonList(List<Map<String, dynamic>> data, List<String> ids) {
    if (data.isEmpty || ids.isEmpty || data.length != ids.length) return [];
    return List.generate(
      data.length,
      (index) => SoilMeasurementModel.fromJson(data[index], ids[index]),
    );
  }
}
