import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/datasource/profile_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required ProfileRemoteDatasource datasource}) : _datasource = datasource;

  final ProfileRemoteDatasource _datasource;

  @override
  Future<Either<Failure, void>> deleteAccount([NoParams? params]) async {
    try {
      final result = await _datasource.deleteAccount();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, void>> signOut([NoParams? params]) async {
    try {
      final result = await _datasource.signOut();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
