import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:derma_detect/src/core/domain/usecases/set_user_token_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSetTokenUsecase extends Mock implements SetTokenUsecase {}

void main() {
  late MockAuthRepository mockRepository;
  late MockSetTokenUsecase mockSetTokenUsecase;
  late SignInUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockSetTokenUsecase = MockSetTokenUsecase();
    usecase = SignInUsecase(
      repository: mockRepository,
      setTokenUsecase: mockSetTokenUsecase,
    );
  });

  group('SignInUsecase', () {
    const tAuthData = AuthData(
      email: 'user@example.com',
      password: 'password123',
    );

    const tUser = DermaUser(
      id: '1',
      email: 'user@example.com',
      name: 'User One',
      token: 'token123',
    );

    test('should return DermaUser and call SetTokenUsecase on success', () async {
      // Arrange
      when(() => mockRepository.signIn(any())).thenAnswer((_) async => const Right(tUser));

      when(() => mockSetTokenUsecase(any())).thenAnswer((_) async => const Right(null));

      final params = SignInUsecaseParams(auth: tAuthData);

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Right(tUser));
      verify(() => mockRepository.signIn(params)).called(1);
      verify(() => mockSetTokenUsecase(tUser.token!)).called(1);
    });

    test('should return Failure when signIn fails', () async {
      // Arrange
      const tFailure = Failure(exception: DermaException(message: 'Error'));
      when(() => mockRepository.signIn(any())).thenAnswer((_) async => const Left(tFailure));

      final params = SignInUsecaseParams(auth: tAuthData);

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.signIn(params)).called(1);
      verifyNever(() => mockSetTokenUsecase(any()));
    });

    test('should throw an error if token is null', () async {
      // Arrange
      const tUserWithoutToken = DermaUser(
        id: '1',
        email: 'user@example.com',
        name: 'User One',
        token: null,
      );
      when(() => mockRepository.signIn(any())).thenAnswer((_) async => const Right(tUserWithoutToken));

      final params = SignInUsecaseParams(auth: tAuthData);

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Right(tUserWithoutToken));
      verify(() => mockRepository.signIn(params)).called(1);
      verifyNever(() => mockSetTokenUsecase(any()));
    });
  });
}
