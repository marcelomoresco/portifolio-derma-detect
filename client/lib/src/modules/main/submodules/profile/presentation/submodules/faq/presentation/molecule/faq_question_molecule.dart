import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';

class FaqQuestionMolecule extends StatelessWidget {
  const FaqQuestionMolecule({
    super.key,
    required this.question,
    required this.answer,
  });
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: StatefulBuilder(
        builder: (context, setState) {
          return ExpansionTile(
            iconColor: Colors.black,
            collapsedIconColor: Colors.black,
            onExpansionChanged: (value) => setState(() => isExpanded = value),
            trailing: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Icon(
                key: UniqueKey(),
                isExpanded ? Icons.remove_circle_outline_outlined : Icons.add_circle_outline_outlined,
              ),
            ),
            title: Text(
              question,
              style: AppTextStyles.interMedium16.copyWith(color: Colors.black),
            ),
            expandedAlignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMarginDefault),
                child: Text(
                  answer,
                  style: AppTextStyles.interRegular16.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
