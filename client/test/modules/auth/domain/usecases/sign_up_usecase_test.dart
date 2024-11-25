import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/sign_in_data.dart';
import 'package:derma_detect/src/modules/auth/domain/repository/auth_repository.dart';
import 'package:derma_detect/src/core/domain/usecases/set_user_token_usecase.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSetTokenUsecase extends Mock implements SetTokenUsecase {}

void main() {
  late MockAuthRepository mockRepository;
  late MockSetTokenUsecase mockSetTokenUsecase;
  late SignUpUsecase usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockSetTokenUsecase = MockSetTokenUsecase();
    usecase = SignUpUsecase(
      repository: mockRepository,
      setTokenUsecase: mockSetTokenUsecase,
    );
  });

  group('SignUpUsecase', () {
    const tAuthData = AuthData(
      name: 'User One',
      email: 'user@example.com',
      password: 'password123',
      confirmPassword: 'password123',
    );

    const tUser = DermaUser(
      id: '1',
      email: 'user@example.com',
      name: 'User One',
      token: 'token123',
    );
    final params = SignUpUsecaseParams(auth: tAuthData);

    setUpAll(() {
      registerFallbackValue(params);
    });

    test('should return DermaUser and call SetTokenUsecase on success', () async {
      // Arrange
      when(() => mockRepository.signUp(any())).thenAnswer((_) async => const Right(tUser));

      when(() => mockSetTokenUsecase(any())).thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Right(tUser));
      verify(() => mockRepository.signUp(any())).called(1);
      verify(() => mockSetTokenUsecase(any())).called(1);
    });

    test('should return Failure when signUp fails', () async {
      // Arrange
      const tFailure = Failure(exception: DermaException(message: 'Sign-up failed'));
      when(() => mockRepository.signUp(any())).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.signUp(any())).called(1);
      verifyNever(() => mockSetTokenUsecase(any()));
    });
  });
}
