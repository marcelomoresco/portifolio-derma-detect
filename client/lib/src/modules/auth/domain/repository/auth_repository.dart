import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, DermaUser>> signIn(SignInUsecaseParams params);
  Future<Either<Failure, DermaUser>> signUp(SignUpUsecaseParams params);
}
