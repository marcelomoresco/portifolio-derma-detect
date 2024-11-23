import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';

void main() {
  group('Analysis Entity', () {
    const mockId = '123';
    const mockImage = 'base64encodedImageString';
    const mockCategory = DiseaseCategory.melanomaSkinCancerNeviAndMoles;
    const mockConfidence = 0.95;
    final mockDate = DateTime(2023, 11, 23);
    const mockRiskLevel = RiskLevel.high;
    const mockPrompt = '<p>Generated Prompt</p>';

    test('should support value equality', () {
      final analysis1 = Analysis(
        id: mockId,
        image: mockImage,
        diseaseCategory: mockCategory,
        confidence: mockConfidence,
        createdAt: mockDate,
        riskLevel: mockRiskLevel,
        promptGenerated: mockPrompt,
      );

      final analysis2 = Analysis(
        id: mockId,
        image: mockImage,
        diseaseCategory: mockCategory,
        confidence: mockConfidence,
        createdAt: mockDate,
        riskLevel: mockRiskLevel,
        promptGenerated: mockPrompt,
      );

      expect(analysis1, equals(analysis2));
    });

    test('props should contain all properties except riskLevel', () {
      final analysis = Analysis(
        id: mockId,
        image: mockImage,
        diseaseCategory: mockCategory,
        confidence: mockConfidence,
        createdAt: mockDate,
        riskLevel: mockRiskLevel,
        promptGenerated: mockPrompt,
      );

      expect(
        analysis.props,
        [
          mockId,
          mockImage,
          mockCategory,
          mockConfidence,
          mockDate,
          mockPrompt,
        ],
      );
    });

    test('should allow null properties', () {
      const analysis = Analysis();

      expect(analysis.id, isNull);
      expect(analysis.image, isNull);
      expect(analysis.diseaseCategory, isNull);
      expect(analysis.confidence, isNull);
      expect(analysis.createdAt, isNull);
      expect(analysis.riskLevel, isNull);
      expect(analysis.promptGenerated, isNull);
    });

    test('should handle different instances with different values correctly', () {
      final analysis1 = Analysis(
        id: '1',
        image: 'image1',
        diseaseCategory: DiseaseCategory.melanomaSkinCancerNeviAndMoles,
        confidence: 0.9,
        createdAt: DateTime(2023, 10, 10),
        riskLevel: RiskLevel.low,
        promptGenerated: 'Prompt1',
      );

      final analysis2 = Analysis(
        id: '2',
        image: 'image2',
        diseaseCategory: DiseaseCategory.acneAndRosaceaPhotos,
        confidence: 0.7,
        createdAt: DateTime(2023, 11, 15),
        riskLevel: RiskLevel.high,
        promptGenerated: 'Prompt2',
      );

      expect(analysis1, isNot(equals(analysis2)));
    });
  });
}
