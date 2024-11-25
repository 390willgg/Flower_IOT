import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flower_project/features/profile/data/datasources/local_datasources.dart';
import 'package:flower_project/features/profile/data/datasources/remote_datasources.dart';
import 'package:flower_project/features/profile/data/models/profile_model.dart';
import 'package:hive/hive.dart';

import '../../../../exceptions/error/failure.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final Box box;

  ProfileRepositoryImplementation({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.box,
  });

  @override
  Future<Either<Failure, List<Profile>>> getAllUsers(int page) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<ProfileModel> result = await localDataSource.getAllUser(page);
        return Right(result);
      } else {
        List<ProfileModel> result = await remoteDataSource.getAllUser(page);
        box.put("getAllUser", result);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getUser(int id) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        ProfileModel result = await localDataSource.getUser(id);
        return Right(result);
      } else {
        ProfileModel result = await remoteDataSource.getUser(id);
        box.put("getUser", result);
        return Right(result);
      }
    } catch (e) {
      return Left(Failure());
    }
  }
}
