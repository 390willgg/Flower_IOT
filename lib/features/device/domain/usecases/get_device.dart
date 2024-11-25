import 'package:dartz/dartz.dart';

import '../../../../exceptions/error/failure.dart';
import '../entities/device/device.dart';
import '../repositories/device_repository.dart';

class GetDevice {
  final DeviceRepository repository;

  GetDevice({required this.repository});

  Future<Either<Failure, Device?>> execute(String deviceId) async {
    return await repository.getDevice(deviceId);
  }
}
