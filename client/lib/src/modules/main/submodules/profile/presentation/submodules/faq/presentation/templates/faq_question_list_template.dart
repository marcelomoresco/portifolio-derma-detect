import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/widgets/molecules/expanded_unbounded_molecule.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_question_item.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/presentation/submodules/faq/presentation/molecule/faq_question_molecule.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FaqQuestionsListTemplate extends StatelessWidget {
  const FaqQuestionsListTemplate({
    super.key,
    required this.category,
    required this.faqQuestionItensList,
  });
  final String category;
  final List<FaqQuestionItem> faqQuestionItensList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text(
          "Perguntas Frequentes",
          style: AppTextStyles.interMedium20,
        ),
        leading: InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: ExpandedUnboundedConstraintScrollMolecule(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    kMarginDefault,
                    kMarginMedium,
                    kMarginDefault,
                    kMarginDefault,
                  ),
                  child: Text(
                    category,
                    style: AppTextStyles.interSemiBold24,
                  ),
                ),
                for (var faqQuestionItem in faqQuestionItensList)
                  FaqQuestionMolecule(
                    question: faqQuestionItem.question,
                    answer: faqQuestionItem.answer,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
