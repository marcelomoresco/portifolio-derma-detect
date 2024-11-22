import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/disease_category.dart';

class DiseaseCategoryMapper {
  static DiseaseCategory? fromJson(String category) {
    switch (category) {
      case 'Acne and Rosacea Photos':
        return DiseaseCategory.acneAndRosaceaPhotos;
      case 'Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesions':
        return DiseaseCategory.actinicKeratosisBasalCellCarcinoma;
      case 'Atopic Dermatitis Photos':
        return DiseaseCategory.atopicDermatitisPhotos;
      case 'Cellulitis Impetigo and other Bacterial Infections':
        return DiseaseCategory.cellulitisImpetigoAndBacterialInfections;
      case 'Eczema Photos':
        return DiseaseCategory.eczemaPhotos;
      case 'Exanthems and Drug Eruptions':
        return DiseaseCategory.exanthemsAndDrugEruptions;
      case 'Herpes HPV and other STDs Photos':
        return DiseaseCategory.herpesHPVAndSTDsPhotos;
      case 'Light Diseases and Disorders of Pigmentation':
        return DiseaseCategory.lightDiseasesAndPigmentationDisorders;
      case 'Lupus and other Connective Tissue diseases':
        return DiseaseCategory.lupusAndConnectiveTissueDiseases;
      case 'Melanoma Skin Cancer Nevi and Moles':
        return DiseaseCategory.melanomaSkinCancerNeviAndMoles;
      case 'Poison Ivy Photos and other Contact Dermatitis':
        return DiseaseCategory.poisonIvyAndContactDermatitis;
      case 'Psoriasis pictures Lichen Planus and related diseases':
        return DiseaseCategory.psoriasisAndLichenPlanus;
      case 'Seborrheic Keratoses and other Benign Tumors':
        return DiseaseCategory.seborrheicKeratosesAndBenignTumors;
      case 'Systemic Disease':
        return DiseaseCategory.systemicDisease;
      case 'Tinea Ringworm Candidiasis and other Fungal Infections':
        return DiseaseCategory.tineaRingwormAndFungalInfections;
      case 'Urticaria Hives':
        return DiseaseCategory.urticariaHives;
      case 'Vascular Tumors':
        return DiseaseCategory.vascularTumors;
      case 'Vasculitis Photos':
        return DiseaseCategory.vasculitisPhotos;
      case 'Warts Molluscum and other Viral Infections':
        return DiseaseCategory.wartsMolluscumAndViralInfections;
      default:
        return null;
    }
  }
}
