import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/data/datasource/shared_local_datasource.dart';
import 'package:derma_detect/src/core/data/datasource/shared_remote_datasource.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';

class SharedRepositoryImpl implements SharedRepository {
  const SharedRepositoryImpl({
    required SharedLocalDatasource localDatasource,
    required SharedRemoteDatasource remoteDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  final SharedLocalDatasource _localDatasource;
  final SharedRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final result = await _localDatasource.getToken();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, void>> setToken(String token) async {
    try {
      final result = await _localDatasource.setToken(token);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, DermaUser>> getUserProfile() async {
    try {
      final result = await _remoteDatasource.getUserProfile();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
