import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeGenericSectionOrganism extends StatelessWidget {
  const HomeGenericSectionOrganism({
    super.key,
    required this.title,
    this.description,
    this.child,
    this.spacing,
    this.icon,
    this.onTapQuestion,
  });

  final String title;
  final String? description;
  final Widget? child;
  final double? spacing;
  final String? icon;
  final VoidCallback? onTapQuestion;

  BorderRadius get border => BorderRadius.circular(12);

  double get sizedIcon => 32;

  double get sizedIconShimmer => 28;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kMarginDefault),
      child: InkWell(
        borderRadius: border,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: border,
            color: const Color(0xFFF2F4F6),
          ),
          padding: const EdgeInsets.all(kMarginDefault),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(title, style: AppTextStyles.interSemiBold18),
                            if (onTapQuestion != null)
                              GestureDetector(
                                onTap: onTapQuestion,
                                child: const Icon(
                                  FontAwesomeIcons.circleQuestion,
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: kMarginDetail,
                        ),
                        Text(
                          description ?? '',
                          style: AppTextStyles.interRegular12,
                        ),
                      ],
                    ),
                    if (child != null) ...[
                      SizedBox(height: spacing ?? kMarginDefault),
                      child!,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
