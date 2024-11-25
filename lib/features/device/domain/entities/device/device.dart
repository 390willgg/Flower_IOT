import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../soil_measurement/soil_measurement.dart';

part 'device.g.dart';

@HiveType(typeId: 4)
class Device extends Equatable {
  @HiveField(11)
  final String id;
  @HiveField(12)
  final List<SoilMeasurement> datas;

  const Device({
    required this.id,
    required this.datas,
  });

  @override
  List<Object?> get props => [
        id,
        datas,
      ];
}
