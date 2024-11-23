import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:equatable/equatable.dart';

part 'faq_category_state.dart';

class FaqCategoryCubit extends DermaCubit<FaqCategoryState> {
  FaqCategoryCubit({
    required FaqCategory faqCategory,
  })  : _faqCategory = faqCategory,
        super(FaqCategoryState(faqCategory: faqCategory));
  final FaqCategory _faqCategory;

  String get faqCategoryName => _faqCategory.categoryName;
}

class FaqCategoryCubitParams {
  const FaqCategoryCubitParams(
    this.category,
  );
  final FaqCategory category;
}
