import 'package:dartz/dartz.dart';
import '../../../../exceptions/error/failure.dart';
import '../entities/device/device.dart';

abstract class DeviceRepository {
  Future<Either<Failure, Device?>> getDevice(String deviceId);
}
