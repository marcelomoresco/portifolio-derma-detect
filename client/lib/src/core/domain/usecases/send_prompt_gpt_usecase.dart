import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/disease_category_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';

class SendAnalysisPromptGptUsecase implements UseCase<String, SendAnalysisPromptGptUsecaseParams> {
  const SendAnalysisPromptGptUsecase({
    required SharedRepository repository,
  }) : _repository = repository;

  final SharedRepository _repository;

  @override
  Future<Either<Failure, String>> call(SendAnalysisPromptGptUsecaseParams params) async {
    final category = DiseaseCategoryMapper.translate(params.diseaseCategory);
    final prompt = '''
Baseado nos seguintes resultados de uma análise de imagem:
- Classe prevista: $category

Gere um texto explicativo retornando um HTML, quero que contenha todas as informações necessárias para o user
''';

    return _repository.sendPrompt(prompt);
  }
}

class SendAnalysisPromptGptUsecaseParams {
  const SendAnalysisPromptGptUsecaseParams({
    required this.diseaseCategory,
  });

  final DiseaseCategory diseaseCategory;
}
