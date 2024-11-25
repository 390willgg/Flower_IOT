import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import 'package:hive/hive.dart';

import '../../../../exceptions/error/failure.dart';
import '../../domain/entities/device/device.dart';
import '../../domain/repositories/device_repository.dart';

class DeviceRepositoryImplementation extends DeviceRepository {
  final DeviceRemoteDataSource remoteDataSource;
  final DeviceLocalDataSource localDataSource;
  final Box box;

  DeviceRepositoryImplementation({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.box,
  });

  @override
  Future<Either<Failure, Device?>> getDevice(String deviceId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult != ConnectivityResult.none) {
        final Device? remoteDevice = await remoteDataSource.getDevice(deviceId);
        if (remoteDevice != null) {
          box.put(deviceId, remoteDevice);
          return Right(remoteDevice);
        } else {
          return Left(Failure());
        }
      } else {
        final Device? localDevice = await localDataSource.getDevice(deviceId);
        if (localDevice != null) {
          return Right(localDevice);
        } else {
          return Left(Failure());
        }
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
