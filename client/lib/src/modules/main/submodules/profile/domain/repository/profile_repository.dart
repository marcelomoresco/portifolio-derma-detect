import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, void>> signOut([NoParams params]);
  Future<Either<Failure, void>> deleteAccount(String id);
}
