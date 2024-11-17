import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/data/datasource/auth_remote_datasource.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';
import 'package:derma_detect/src/modules/auth/data/repository/auth_repository_impl.dart';

class MockAuthRemoteDatasource extends Mock implements AuthRemoteDatasource {}

void main() {
  late MockAuthRemoteDatasource mockDatasource;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockDatasource = MockAuthRemoteDatasource();
    repository = AuthRepositoryImpl(datasource: mockDatasource);
  });

  group('AuthRepositoryImpl', () {
    const tAuthData = AuthData(
      name: 'User One',
      email: 'user@example.com',
      password: 'password123',
      confirmPassword: 'password123',
    );

    setUpAll(() {
      registerFallbackValue(SignInUsecaseParams(auth: tAuthData));
      registerFallbackValue(SignUpUsecaseParams(auth: tAuthData));
    });

    const tUser = DermaUser(
      id: '1',
      email: 'user@example.com',
      name: 'User One',
      token: 'token123',
    );

    group('signIn', () {
      test('should return DermaUser on successful signIn from datasource', () async {
        // Arrange
        final params = SignInUsecaseParams(auth: tAuthData);
        when(() => mockDatasource.signIn(params)).thenAnswer((_) async => tUser);

        // Act
        final result = await repository.signIn(params);

        // Assert
        expect(result, const Right(tUser));
        verify(() => mockDatasource.signIn(params)).called(1);
      });

      test('should return Failure when datasource throws an exception', () async {
        // Arrange
        final params = SignInUsecaseParams(auth: tAuthData);
        final exception = Exception('Failed to sign in');
        when(() => mockDatasource.signIn(params)).thenThrow(exception);

        // Act
        final result = await repository.signIn(params);

        // Assert
        expect(result, Left(Failure(exception: exception)));
        verify(() => mockDatasource.signIn(params)).called(1);
      });
    });

    group('signUp', () {
      test('should return DermaUser on successful signUp from datasource', () async {
        // Arrange
        final params = SignUpUsecaseParams(auth: tAuthData);
        when(() => mockDatasource.signUp(params)).thenAnswer((_) async => tUser);

        // Act
        final result = await repository.signUp(params);

        // Assert
        expect(result, const Right(tUser));
        verify(() => mockDatasource.signUp(params)).called(1);
      });

      test('should return Failure when datasource throws an exception', () async {
        // Arrange
        final params = SignUpUsecaseParams(auth: tAuthData);
        final exception = Exception('Failed to sign up');
        when(() => mockDatasource.signUp(params)).thenThrow(exception);

        // Act
        final result = await repository.signUp(params);

        // Assert
        expect(result, Left(Failure(exception: exception)));
        verify(() => mockDatasource.signUp(params)).called(1);
      });
    });
  });
}
