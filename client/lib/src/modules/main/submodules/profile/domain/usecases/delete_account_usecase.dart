import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/repository/profile_repository.dart';

class DeleteAccountUsecase implements UseCase<void, String> {
  const DeleteAccountUsecase({
    required ProfileRepository repository,
  }) : _repository = repository;

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, void>> call(String id) async {
    return _repository.deleteAccount(id);
  }
}
