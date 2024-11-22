import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';

class GetAllAnalysisUsecase implements UseCase<List<Analysis>, NoParams> {
  const GetAllAnalysisUsecase({
    required AnalysisRepository repository,
  }) : _repository = repository;

  final AnalysisRepository _repository;

  @override
  Future<Either<Failure, List<Analysis>>> call([NoParams? params]) async {
    return _repository.getAll();
  }
}
