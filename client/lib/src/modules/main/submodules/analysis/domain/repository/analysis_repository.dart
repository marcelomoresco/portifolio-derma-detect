import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';

abstract interface class AnalysisRepository {
  Future<Either<Failure, List<Analysis>>> getAll();
  Future<Either<Failure, Analysis>> getById(GetByIdAnalysisUsecaseParams params);
  Future<Either<Failure, Analysis>> create(CreateAnalysisUsecaseParams params);
}
