import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';

class SetTokenUsecase implements UseCase<void, String> {
  const SetTokenUsecase({
    required SharedRepository repository,
  }) : _repository = repository;

  final SharedRepository _repository;

  @override
  Future<Either<Failure, void>> call(String token) async {
    return _repository.setToken(token);
  }
}
