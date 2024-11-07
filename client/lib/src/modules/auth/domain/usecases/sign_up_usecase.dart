import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';

class SignUpUsecase implements UseCase<DermaUser, SignUpUsecaseParams> {
  const SignUpUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<Either<Failure, DermaUser>> call(SignUpUsecaseParams params) async {
    return _repository.signUp(params);
  }
}

class SignUpUsecaseParams {
  SignUpUsecaseParams({
    required this.auth,
  });

  final AuthData auth;
}
