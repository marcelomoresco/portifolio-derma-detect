import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/risk_level.dart';

class RiskLevelMapper {
  static RiskLevel getRiskLevel(DiseaseCategory? category) {
    if (category == null) return RiskLevel.low;

    switch (category) {
      // Risco Muito Alto
      case DiseaseCategory.actinicKeratosisBasalCellCarcinoma:
      case DiseaseCategory.melanomaSkinCancerNeviAndMoles:
        return RiskLevel.veryHigh;

      // Risco Alto
      case DiseaseCategory.cellulitisImpetigoAndBacterialInfections:
      case DiseaseCategory.lupusAndConnectiveTissueDiseases:
      case DiseaseCategory.herpesHPVAndSTDsPhotos:
      case DiseaseCategory.vasculitisPhotos:
      case DiseaseCategory.systemicDisease:
        return RiskLevel.high;

      // Risco Médio
      case DiseaseCategory.acneAndRosaceaPhotos:
      case DiseaseCategory.atopicDermatitisPhotos:
      case DiseaseCategory.eczemaPhotos:
      case DiseaseCategory.psoriasisAndLichenPlanus:
      case DiseaseCategory.poisonIvyAndContactDermatitis:
      case DiseaseCategory.seborrheicKeratosesAndBenignTumors:
      case DiseaseCategory.urticariaHives:
      case DiseaseCategory.tineaRingwormAndFungalInfections:
        return RiskLevel.medium;

      // Risco Baixo
      case DiseaseCategory.lightDiseasesAndPigmentationDisorders:
      case DiseaseCategory.exanthemsAndDrugEruptions:
      case DiseaseCategory.wartsMolluscumAndViralInfections:
      case DiseaseCategory.vascularTumors:
        return RiskLevel.low;
    }
  }
}
