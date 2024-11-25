import 'package:dartz/dartz.dart';

import '../../../../exceptions/error/failure.dart';
import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getAllUsers(int page);
  Future<Either<Failure, Profile>> getUser(int id);
}
