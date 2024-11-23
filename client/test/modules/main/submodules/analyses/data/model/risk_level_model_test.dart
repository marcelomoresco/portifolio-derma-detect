import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/data/model/risk_level_model.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';

void main() {
  group('RiskLevelMapper', () {
    test('should return RiskLevel.veryHigh for very high risk categories', () {
      // Arrange
      const highRiskCategories = [
        DiseaseCategory.actinicKeratosisBasalCellCarcinoma,
        DiseaseCategory.melanomaSkinCancerNeviAndMoles,
      ];

      // Act & Assert
      for (final category in highRiskCategories) {
        final result = RiskLevelMapper.getRiskLevel(category);
        expect(result, RiskLevel.veryHigh, reason: 'Expected very high risk for $category');
      }
    });

    test('should return RiskLevel.high for high risk categories', () {
      // Arrange
      const highRiskCategories = [
        DiseaseCategory.cellulitisImpetigoAndBacterialInfections,
        DiseaseCategory.lupusAndConnectiveTissueDiseases,
        DiseaseCategory.herpesHPVAndSTDsPhotos,
        DiseaseCategory.vasculitisPhotos,
        DiseaseCategory.systemicDisease,
      ];

      // Act & Assert
      for (final category in highRiskCategories) {
        final result = RiskLevelMapper.getRiskLevel(category);
        expect(result, RiskLevel.high, reason: 'Expected high risk for $category');
      }
    });

    test('should return RiskLevel.medium for medium risk categories', () {
      // Arrange
      const mediumRiskCategories = [
        DiseaseCategory.acneAndRosaceaPhotos,
        DiseaseCategory.atopicDermatitisPhotos,
        DiseaseCategory.eczemaPhotos,
        DiseaseCategory.psoriasisAndLichenPlanus,
        DiseaseCategory.poisonIvyAndContactDermatitis,
        DiseaseCategory.seborrheicKeratosesAndBenignTumors,
        DiseaseCategory.urticariaHives,
        DiseaseCategory.tineaRingwormAndFungalInfections,
      ];

      // Act & Assert
      for (final category in mediumRiskCategories) {
        final result = RiskLevelMapper.getRiskLevel(category);
        expect(result, RiskLevel.medium, reason: 'Expected medium risk for $category');
      }
    });

    test('should return RiskLevel.low for low risk categories', () {
      // Arrange
      const lowRiskCategories = [
        DiseaseCategory.lightDiseasesAndPigmentationDisorders,
        DiseaseCategory.exanthemsAndDrugEruptions,
        DiseaseCategory.wartsMolluscumAndViralInfections,
        DiseaseCategory.vascularTumors,
      ];

      // Act & Assert
      for (final category in lowRiskCategories) {
        final result = RiskLevelMapper.getRiskLevel(category);
        expect(result, RiskLevel.low, reason: 'Expected low risk for $category');
      }
    });

    test('should return RiskLevel.low when category is null', () {
      // Act
      final result = RiskLevelMapper.getRiskLevel(null);

      // Assert
      expect(result, RiskLevel.low, reason: 'Expected low risk for null category');
    });
  });
}
