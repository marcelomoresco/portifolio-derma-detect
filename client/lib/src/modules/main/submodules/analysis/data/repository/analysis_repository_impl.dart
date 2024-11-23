import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/datasource/analysis_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  const AnalysisRepositoryImpl({required AnalysisRemoteDatasource datasource}) : _datasource = datasource;

  final AnalysisRemoteDatasource _datasource;

  @override
  Future<Either<Failure, Analysis>> create(CreateAnalysisUsecaseParams params) async {
    try {
      final result = await _datasource.create(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, List<Analysis>>> getAll() async {
    try {
      final result = await _datasource.getAll();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, Analysis>> getById(GetByIdAnalysisUsecaseParams params) async {
    try {
      final result = await _datasource.getById(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, List<Analysis>>> getRecents() async {
    try {
      final result = await _datasource.getRecents();
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
