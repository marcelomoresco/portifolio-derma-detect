class DiseaseCategoryMapper {
  static categories = {
    "Acne and Rosacea Photos": "Acne e Rosácea",
    "Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesions":
      "Queratose Actínica, Carcinoma Basocelular ou outras Lesões Malignas",
    "Atopic Dermatitis Photos": "Fotos de Dermatite Atópica",
    "Cellulitis Impetigo and other Bacterial Infections":
      "Celulite, Impetigo ou outras Infecções Bacterianas",
    "Eczema Photos": "Eczema",
    "Exanthems and Drug Eruptions": "Exantemas e Erupções Medicamentosas",
    "Herpes HPV and other STDs Photos": "Herpes, HPV ou outras DSTs",
    "Light Diseases and Disorders of Pigmentation":
      "Doenças de Luz ou Distúrbios de Pigmentação",
    "Lupus and other Connective Tissue diseases":
      "Lúpus ou Outras Doenças do Tecido Conjuntivo",
    "Melanoma Skin Cancer Nevi and Moles":
      "Melanoma, Câncer de Pele, Nevos ou Melanócitos",
    "Poison Ivy Photos and other Contact Dermatitis":
      "Hera Venenosa ou Outras Dermatites de Contato",
    "Psoriasis pictures Lichen Planus and related diseases":
      "Psoríase, Líquen Plano ou Doenças Relacionadas",
    "Seborrheic Keratoses and other Benign Tumors":
      "Queratoses Seborreicas ou Outros Tumores Benignos",
    "Systemic Disease": "Doença Sistêmica",
    "Tinea Ringworm Candidiasis and other Fungal Infections":
      "Tínea, Micose, Candidíase ou Outras Infecções Fúngicas",
    "Urticaria Hives": "Urticária (Erupções)",
    "Vascular Tumors": "Tumores Vasculares",
    "Vasculitis Photos": "Vasculite",
    "Warts Molluscum and other Viral Infections":
      "Verrugas, Moluscos ou Outras Infecções Virais",
  };

  static fromJson(category) {
    return this.categories[category] || null;
  }

  static translate(category) {
    const translatedKey = Object.keys(this.categories).find(
      (key) => this.categories[key] === category
    );
    return translatedKey || null;
  }
}

module.exports = DiseaseCategoryMapper;
