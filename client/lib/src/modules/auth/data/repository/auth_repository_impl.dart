import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/data/datasource/auth_remote_datasource.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({required AuthRemoteDatasource datasource}) : _datasource = datasource;

  final AuthRemoteDatasource _datasource;

  @override
  Future<Either<Failure, DermaUser>> signIn(SignInUsecaseParams params) async {
    try {
      final result = await _datasource.signIn(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }

  @override
  Future<Either<Failure, DermaUser>> signUp(SignUpUsecaseParams params) async {
    try {
      final result = await _datasource.signUp(params);
      return Right(result);
    } catch (error) {
      return Left(Failure(exception: error));
    }
  }
}
