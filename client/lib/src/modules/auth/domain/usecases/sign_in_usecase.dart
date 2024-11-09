import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/domain/usecases/set_user_token_usecase.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';

class SignInUsecase implements UseCase<DermaUser, SignInUsecaseParams> {
  const SignInUsecase({
    required AuthRepository repository,
    required SetTokenUsecase setTokenUsecase,
  })  : _repository = repository,
        _setTokenUsecase = setTokenUsecase;

  final AuthRepository _repository;
  final SetTokenUsecase _setTokenUsecase;

  @override
  Future<Either<Failure, DermaUser>> call(SignInUsecaseParams params) async {
    final result = await _repository.signIn(params);
    if (result.isRight()) {
      final user = (result as Right).value as DermaUser;
      _setTokenUsecase(user.token);
    }
    return result;
  }
}

class SignInUsecaseParams {
  SignInUsecaseParams({
    required this.auth,
  });

  final AuthData auth;
}
