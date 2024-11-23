import 'package:dartz/dartz.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:mocktail/mocktail.dart';
import 'create_analyses_usecase.dart';

void main() {
  late GetByIdAnalysisUsecase usecase;
  late MockAnalysisRepository mockRepository;

  setUp(() {
    mockRepository = MockAnalysisRepository();
    usecase = GetByIdAnalysisUsecase(repository: mockRepository);
  });

  const tId = GetByIdAnalysisUsecaseParams(id: '123');
  const tAnalysis = Analysis(
    id: '123',
    image: 'base64string',
    diseaseCategory: null,
    confidence: 0.8,
    createdAt: null,
    riskLevel: null,
    promptGenerated: null,
  );

  group('GetByIdAnalysisUsecase', () {
    test('should return Analysis on successful fetch', () async {
      // Arrange
      when(() => mockRepository.getById(tId)).thenAnswer((_) async => const Right(tAnalysis));

      // Act
      final result = await usecase(tId);

      // Assert
      expect(result, const Right(tAnalysis));
      verify(() => mockRepository.getById(tId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when repository fails', () async {
      // Arrange
      const tFailure = Failure(exception: 'Error fetching analysis');
      when(() => mockRepository.getById(tId)).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await usecase(tId);

      // Assert
      expect(result, const Left(tFailure));
      verify(() => mockRepository.getById(tId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when ID is empty', () async {
      // Act
      final result = await usecase(const GetByIdAnalysisUsecaseParams(id: ''));

      // Assert
      expect(result, const Left(Failure(exception: 'Invalid ID')));
      verifyNever(() => mockRepository.getById(any(named: 'params')));
    });
  });
}
