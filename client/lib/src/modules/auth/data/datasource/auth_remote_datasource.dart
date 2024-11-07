import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/modules/auth/data/model/derma_user_model.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';

abstract class AuthRemoteDatasource {
  Future<DermaUser> signIn(SignInUsecaseParams params);

  Future<DermaUser> signUp(SignUpUsecaseParams params);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  AuthRemoteDatasourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;

  @override
  Future<DermaUser> signIn(SignInUsecaseParams params) async {
    final response = await _networkService.get(
      const ClientRequest(
        path: "path",
      ),
    );
    try {
      DermaUser result = DermaUserModel.fromJson(response.body);
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }

  @override
  Future<DermaUser> signUp(SignUpUsecaseParams params) async {
    final response = await _networkService.get(
      const ClientRequest(
        path: "path",
      ),
    );
    try {
      DermaUser result = DermaUserModel.fromJson(response.body);
      return result;
    } catch (error) {
      throw ParseDataException(message: 'DermaMapper parse error: $error');
    }
  }
}
