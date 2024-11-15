import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/domain/repository/shared_repository.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';

class GetUserProfileUsecase implements UseCase<DermaUser, NoParams> {
  const GetUserProfileUsecase({
    required SharedRepository repository,
  }) : _repository = repository;

  final SharedRepository _repository;

  @override
  Future<Either<Failure, DermaUser>> call([NoParams? params]) async {
    return _repository.getUserProfile();
  }
}
