import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/core/errors/errors.dart';

abstract interface class SharedRepository {
  Future<Either<Failure, void>> setToken(String token);
  Future<Either<Failure, String>> getToken();
}
