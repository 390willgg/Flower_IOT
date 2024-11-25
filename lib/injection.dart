import 'package:flower_project/features/profile/data/datasources/local_datasources.dart';
import 'package:flower_project/features/profile/data/datasources/remote_datasources.dart';
import 'package:flower_project/features/profile/domain/use_cases/get_all_user.dart';
import 'package:flower_project/features/profile/domain/use_cases/get_user.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'features/profile/data/models/profile_model.dart';
import 'features/profile/data/repositories/profile_repository_implementation.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

var injection = GetIt.instance; // ini merupakan tempat penampungan semua dependencies

Future<void> init() async {
  // HIVE
  Hive.registerAdapter(ProfileModelAdapter());
  var box = await Hive.openBox("profile_box");
  injection.registerLazySingleton(
    () => box,
  );

  // HTTP
  injection.registerLazySingleton(
    () => http.Client(),
  );

  // BLOC
  injection.registerFactory(
    () => ProfileBloc(
      getAllUser: injection(),
      getUser: injection(),
    ),
  );

  // USECASE
  injection.registerLazySingleton(
    () => GetAllUser(
      injection(),
    ),
  );

  injection.registerLazySingleton(
    () => GetUser(
      injection(),
    ),
  );

  // REPOSITORY
  injection.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplementation(
      localDataSource: injection(),
      remoteDataSource: injection(),
      box: injection(),
    ),
  );

  // DATA SOURCE
  injection.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImplementation(
      box: injection(),
    ),
  );
  injection.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImplementation(
      client: injection(),
    ),
  );
}