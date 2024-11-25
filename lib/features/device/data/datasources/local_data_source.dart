import 'package:hive/hive.dart';

import '../../domain/entities/device/device.dart';
import '../models/device/device_model.dart';

abstract class DeviceLocalDataSource {
  Future<Device?> getDevice(String deviceId);
  Future<void> cacheDevice(Device device);
  Future<void> removeDevice(String deviceId);
}

class DeviceLocalDataSourceImplementation implements DeviceLocalDataSource {
  final Box<DeviceModel> deviceBox;

  DeviceLocalDataSourceImplementation({required this.deviceBox});

  @override
  Future<Device?> getDevice(String deviceId) async {
    return deviceBox.get(deviceId);
  }

  @override
  Future<void> cacheDevice(Device device) async {
    await deviceBox.put(device.id, device as DeviceModel);
  }

  @override
  Future<void> removeDevice(String deviceId) async {
    await deviceBox.delete(deviceId);
  }
}