import 'package:derma_detect/src/core/services/network/dtos/client_response.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/network/dtos/client_request_dto.dart';
import 'package:derma_detect/src/core/services/network/network_service.dart';
import 'package:derma_detect/src/modules/auth/data/datasource/auth_remote_datasource.dart';
import 'package:derma_detect/src/modules/auth/data/model/derma_user_model.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';

class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late MockNetworkService mockNetworkService;
  late AuthRemoteDatasourceImpl datasource;

  setUp(() {
    mockNetworkService = MockNetworkService();
    datasource = AuthRemoteDatasourceImpl(networkService: mockNetworkService);
  });

  group('AuthRemoteDatasourceImpl', () {
    const tAuthData = AuthData(
      name: 'User One',
      email: 'user@example.com',
      password: 'password123',
      confirmPassword: 'password123',
    );

    setUpAll(() {
      registerFallbackValue(const ClientRequest(path: '', data: {}));
    });

    const tUserModel = DermaUserModel(
      id: '6740e8809b650251629123e3',
      email: 'marcelomoresco0@gmail.com',
      name: 'Marcelo Moresco',
      token: '123',
      monthlyAnalyses: 17,
    );

    const tResponse = ClientResponse(
      body: {
        "message": "Login successful",
        "token": "123",
        "user": {
          "id": "6740e8809b650251629123e3",
          "name": "Marcelo Moresco",
          "email": "marcelomoresco0@gmail.com",
          "monthlyAnalyses": 17,
        },
      },
      statusCode: 200,
    );

    group('signIn', () {
      test(
        'should return DermaUser on successful signIn',
        () async {
          // Arrange
          final params = SignInUsecaseParams(auth: tAuthData);
          when(() => mockNetworkService.post(any())).thenAnswer((_) async => tResponse);

          // Act
          final result = await datasource.signIn(params);

          // Assert
          expect(result, equals(tUserModel));
          verify(
            () => mockNetworkService.post(any()),
          ).called(1);
        },
      );

      test('should throw ParseDataException on invalid response body', () async {
        // Arrange
        final params = SignInUsecaseParams(auth: tAuthData);
        const invalidResponse = ClientResponse(body: {}, statusCode: 200);
        when(() => mockNetworkService.post(any())).thenAnswer((_) async => invalidResponse);

        // Act & Assert
        expect(
          () async => await datasource.signIn(params),
          throwsA(isA<ParseDataException>()),
        );
        verify(() => mockNetworkService.post(any())).called(1);
      });
    });

    group('signUp', () {
      test('should return DermaUser on successful signUp', () async {
        // Arrange
        final params = SignUpUsecaseParams(auth: tAuthData);
        when(() => mockNetworkService.post(any())).thenAnswer((_) async => tResponse);

        // Act
        final result = await datasource.signUp(params);

        // Assert
        expect(result, equals(tUserModel));
        verify(() => mockNetworkService.post(any())).called(1);
      });

      test('should throw ClientException on network error', () async {
        // Arrange
        final params = SignUpUsecaseParams(auth: tAuthData);
        final exception = ClientException(message: 'Network error', statusCode: 400);
        when(() => mockNetworkService.post(any())).thenThrow(exception);

        // Act & Assert
        expect(
          () async => await datasource.signUp(params),
          throwsA(isA<ClientException>()),
        );
        verify(() => mockNetworkService.post(any())).called(1);
      });
    });
  });
}
