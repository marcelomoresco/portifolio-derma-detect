import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';

class GetTokenUsecase implements UseCase<String?, NoParams> {
  const GetTokenUsecase({
    required SharedRepository repository,
  }) : _repository = repository;

  final SharedRepository _repository;

  @override
  Future<Either<Failure, String?>> call([NoParams? params]) async {
    return _repository.getToken();
  }
}
