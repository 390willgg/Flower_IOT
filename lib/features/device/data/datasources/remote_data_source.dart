import 'package:firebase_database/firebase_database.dart';
import '../../../../exceptions/error/exception.dart';
import '../models/device/device_model.dart';

import '../../domain/entities/device/device.dart';

abstract class DeviceRemoteDataSource {
  Future<Device?> getDevice(String deviceId);
}

class DeviceRemoteDataSourceImplementation implements DeviceRemoteDataSource {
  final DatabaseReference ref;

  DeviceRemoteDataSourceImplementation({required this.ref});

  @override
  Future<Device?> getDevice(String deviceId) async {
    DataSnapshot snapshot = await ref.child('devices/$deviceId').get();
    if (snapshot.exists) {
      return DeviceModel.fromJson(snapshot.value as Map<String, dynamic>, deviceId);
    } else {
      throw const StatusCodeException(message: 'Device not found in devices');
    }
  }
}
