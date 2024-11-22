import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/repository/analysis_repository.dart';

class CreateAnalysisUsecase implements UseCase<Analysis, CreateAnalysisUsecaseParams> {
  const CreateAnalysisUsecase({
    required AnalysisRepository repository,
  }) : _repository = repository;

  final AnalysisRepository _repository;

  @override
  Future<Either<Failure, Analysis>> call(CreateAnalysisUsecaseParams params) async {
    return _repository.create(params);
  }
}

class CreateAnalysisUsecaseParams {
  const CreateAnalysisUsecaseParams({
    required this.file,
  });
  final File file;
}
