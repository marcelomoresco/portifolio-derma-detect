part of 'faq_category_cubit.dart';

class FaqCategoryState extends Equatable {
  const FaqCategoryState({
    this.faqCategory,
  });
  final FaqCategory? faqCategory;

  @override
  List<Object?> get props => [
        faqCategory,
      ];

  FaqCategoryState copyWith({
    FaqCategory? faqCategory,
    Failure? failure,
  }) {
    return FaqCategoryState(
      faqCategory: faqCategory ?? this.faqCategory,
    );
  }
}
