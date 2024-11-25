import 'package:flower_project/features/device/domain/entities/soil_measurement/soil_measurement.dart';
import 'package:hive/hive.dart';

import '../soil_measurement/soil_measurement_model.dart';
import '../../../domain/entities/device/device.dart';

part 'device_model.g.dart';

@HiveType(typeId: 5)
class DeviceModel extends Device {
  const DeviceModel({required super.id, required super.datas});

  factory DeviceModel.fromJson(Map<String, dynamic> json, String id) {
    List<SoilMeasurementModel> readings = [];
    json['readings'].forEach((key, value) {
      readings.add(SoilMeasurementModel.fromJson(value, key));
    });

    return DeviceModel(
      id: id,
      datas: readings,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> readingsMap = {};
    for (var reading in datas) {
      readingsMap[reading.id] = (reading as SoilMeasurementModel).toJson();
    }

    return {
      'readings': readingsMap,
    };
  }
}
