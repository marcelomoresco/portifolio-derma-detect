import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/datasource/profile_remote_datasource.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/data/repository/profile_repository_impl.dart';

class MockProfileRemoteDatasource extends Mock implements ProfileRemoteDatasource {}

void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockProfileRemoteDatasource();
    repository = ProfileRepositoryImpl(datasource: mockDatasource);
  });

  group('deleteAccount', () {
    test('should return Right when datasource.deleteAccount succeeds', () async {
      // Arrange
      when(() => mockDatasource.deleteAccount()).thenAnswer((_) async {});

      // Act
      final result = await repository.deleteAccount();

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockDatasource.deleteAccount()).called(1);
    });

    test('should return Left(Failure) when datasource.deleteAccount fails', () async {
      // Arrange
      final failure = Failure(exception: Exception('Failed to delete account'));
      when(() => mockDatasource.deleteAccount()).thenThrow(failure.exception!);

      // Act
      final result = await repository.deleteAccount();

      // Assert
      expect(result, equals(Left(failure)));
      verify(() => mockDatasource.deleteAccount()).called(1);
    });
  });

  group('signOut', () {
    test('should return Right when datasource.signOut succeeds', () async {
      // Arrange
      when(() => mockDatasource.signOut()).thenAnswer((_) async {});

      // Act
      final result = await repository.signOut();

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockDatasource.signOut()).called(1);
    });

    test('should return Left(Failure) when datasource.signOut fails', () async {
      // Arrange
      final failure = Failure(exception: Exception('Failed to sign out'));
      when(() => mockDatasource.signOut()).thenThrow(failure.exception!);

      // Act
      final result = await repository.signOut();

      // Assert
      expect(result, equals(Left(failure)));
      verify(() => mockDatasource.signOut()).called(1);
    });
  });
}
