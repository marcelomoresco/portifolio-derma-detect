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

  static String? translate(DiseaseCategory category) {
    switch (category) {
      case DiseaseCategory.acneAndRosaceaPhotos:
        return 'Acne e Rosácea';
      case DiseaseCategory.actinicKeratosisBasalCellCarcinoma:
        return 'Queratose Actínica, Carcinoma Basocelular ou outras Lesões Malignas';
      case DiseaseCategory.atopicDermatitisPhotos:
        return 'Fotos de Dermatite Atópica';
      case DiseaseCategory.cellulitisImpetigoAndBacterialInfections:
        return 'Celulite, Impetigo ou outras Infecções Bacterianas';
      case DiseaseCategory.eczemaPhotos:
        return 'Eczema';
      case DiseaseCategory.exanthemsAndDrugEruptions:
        return 'Exantemas e Erupções Medicamentosas';
      case DiseaseCategory.herpesHPVAndSTDsPhotos:
        return 'Herpes, HPV ou outras DSTs';
      case DiseaseCategory.lightDiseasesAndPigmentationDisorders:
        return 'Doenças de Luz ou Distúrbios de Pigmentação';
      case DiseaseCategory.lupusAndConnectiveTissueDiseases:
        return 'Lúpus ou Outras Doenças do Tecido Conjuntivo';
      case DiseaseCategory.melanomaSkinCancerNeviAndMoles:
        return 'Melanoma, Câncer de Pele, Nevos ou Melanócitos';
      case DiseaseCategory.poisonIvyAndContactDermatitis:
        return 'Hera Venenosa ou Outras Dermatites de Contato';
      case DiseaseCategory.psoriasisAndLichenPlanus:
        return 'Psoríase, Líquen Plano ou Doenças Relacionadas';
      case DiseaseCategory.seborrheicKeratosesAndBenignTumors:
        return 'Queratoses Seborreicas ou Outros Tumores Benignos';
      case DiseaseCategory.systemicDisease:
        return 'Doença Sistêmica';
      case DiseaseCategory.tineaRingwormAndFungalInfections:
        return 'Tínea, Micose, Candidíase ou Outras Infecções Fúngicas';
      case DiseaseCategory.urticariaHives:
        return 'Urticária (Erupções)';
      case DiseaseCategory.vascularTumors:
        return 'Tumores Vasculares';
      case DiseaseCategory.vasculitisPhotos:
        return 'Vasculite';
      case DiseaseCategory.wartsMolluscumAndViralInfections:
        return 'Verrugas, Moluscos ou Outras Infecções Virais';
      default:
        return null;
    }
  }
}
