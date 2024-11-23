import 'package:flutter_test/flutter_test.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';

void main() {
  group('DiseaseCategory Enum', () {
    test('should have all expected categories', () {
      // Defina os valores esperados
      const expectedValues = [
        DiseaseCategory.acneAndRosaceaPhotos,
        DiseaseCategory.actinicKeratosisBasalCellCarcinoma,
        DiseaseCategory.atopicDermatitisPhotos,
        DiseaseCategory.cellulitisImpetigoAndBacterialInfections,
        DiseaseCategory.eczemaPhotos,
        DiseaseCategory.exanthemsAndDrugEruptions,
        DiseaseCategory.herpesHPVAndSTDsPhotos,
        DiseaseCategory.lightDiseasesAndPigmentationDisorders,
        DiseaseCategory.lupusAndConnectiveTissueDiseases,
        DiseaseCategory.melanomaSkinCancerNeviAndMoles,
        DiseaseCategory.poisonIvyAndContactDermatitis,
        DiseaseCategory.psoriasisAndLichenPlanus,
        DiseaseCategory.seborrheicKeratosesAndBenignTumors,
        DiseaseCategory.systemicDisease,
        DiseaseCategory.tineaRingwormAndFungalInfections,
        DiseaseCategory.urticariaHives,
        DiseaseCategory.vascularTumors,
        DiseaseCategory.vasculitisPhotos,
        DiseaseCategory.wartsMolluscumAndViralInfections,
      ];

      // Enum completo deve ser igual aos valores esperados
      expect(DiseaseCategory.values, expectedValues);
    });

    test('should contain 19 categories', () {
      // Número total de valores no enum
      expect(DiseaseCategory.values.length, 19);
    });

    test('should contain specific category', () {
      // Testar a presença de categorias específicas
      expect(DiseaseCategory.values, contains(DiseaseCategory.acneAndRosaceaPhotos));
      expect(DiseaseCategory.values, contains(DiseaseCategory.melanomaSkinCancerNeviAndMoles));
    });

    test('should allow iteration over categories', () {
      // Iterar pelas categorias e verificar se não há null ou duplicações
      const categories = DiseaseCategory.values;
      for (final category in categories) {
        expect(category, isNotNull);
      }

      // Verifica se todos os valores são únicos
      expect(categories.toSet().length, categories.length);
    });
  });
}
