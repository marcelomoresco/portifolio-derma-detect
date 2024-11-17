import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/repository/profile_repository.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/usecases/delete_account_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late DeleteAccountUsecase usecase;
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
    usecase = DeleteAccountUsecase(repository: mockRepository);
  });

  test('should call repository.deleteAccount and return Right(void)', () async {
    // Arrange
    when(() => mockRepository.deleteAccount(any())).thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase();

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockRepository.deleteAccount(null)).called(1);
  });

  test('should return Left(Failure) when repository.deleteAccount fails', () async {
    // Arrange
    const failure = Failure(exception: 'Delete failed');
    when(() => mockRepository.deleteAccount(any())).thenAnswer((_) async => const Left(failure));

    // Act
    final result = await usecase();

    // Assert
    expect(result, equals(const Left(failure)));
    verify(() => mockRepository.deleteAccount(null)).called(1);
  });
}
