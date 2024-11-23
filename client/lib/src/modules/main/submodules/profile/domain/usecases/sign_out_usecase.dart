import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/repository/profile_repository.dart';

class SignOutUsecase implements UseCase<void, NoParams> {
  const SignOutUsecase({
    required ProfileRepository repository,
  }) : _repository = repository;

  final ProfileRepository _repository;

  @override
  Future<Either<Failure, void>> call([NoParams? params]) async {
    return _repository.signOut();
  }
}
