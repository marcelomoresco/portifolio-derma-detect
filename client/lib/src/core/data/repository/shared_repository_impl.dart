import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/data/datasource/shared_local_datasource.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';

class SharedRepositoryImpl implements SharedRepository {
  const SharedRepositoryImpl({required SharedLocalDatasource localDatasource}) : _localDatasource = localDatasource;

  final SharedLocalDatasource _localDatasource;

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
}
