import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';

class SignInUsecase implements UseCase<DermaUser, SignInUsecaseParams> {
  const SignInUsecase({
    required AuthRepository repository,
  }) : _repository = repository;

  final AuthRepository _repository;

  @override
  Future<Either<Failure, DermaUser>> call(SignInUsecaseParams params) async {
    return _repository.signIn(params);
  }
}

class SignInUsecaseParams {
  SignInUsecaseParams({
    required this.auth,
  });

  final AuthData auth;
}
