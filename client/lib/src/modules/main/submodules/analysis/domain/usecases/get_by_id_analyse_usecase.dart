import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';

class GetByIdAnalysisUsecase implements UseCase<Analysis, GetByIdAnalysisUsecaseParams> {
  const GetByIdAnalysisUsecase({
    required AnalysisRepository repository,
  }) : _repository = repository;

  final AnalysisRepository _repository;

  @override
  Future<Either<Failure, Analysis>> call(GetByIdAnalysisUsecaseParams params) async {
    return _repository.getById(params);
  }
}

class GetByIdAnalysisUsecaseParams {
  const GetByIdAnalysisUsecaseParams({
    required this.id,
  });

  final String id;
}
