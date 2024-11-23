import 'package:equatable/equatable.dart';

import 'faq_question_item.dart';

class FaqCategory extends Equatable {
  const FaqCategory({
    required this.categoryName,
    this.description,
    this.faqQuestionItensList = const [],
  });
  final String categoryName;
  final String? description;
  final List<FaqQuestionItem> faqQuestionItensList;

  @override
  List<Object?> get props => [
        categoryName,
        description,
        faqQuestionItensList,
      ];

  FaqCategory copyWith({
    String? categoryName,
    String? description,
    List<FaqQuestionItem>? faqQuestionItensList,
  }) {
    return FaqCategory(
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
      faqQuestionItensList: faqQuestionItensList ?? this.faqQuestionItensList,
    );
  }
}
