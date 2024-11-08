import 'dart:ui';

import 'package:derma_detect/src/core/components/molecules/conditional_parent_molecules.dart';
import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/mixin/modal_mixin.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModalOrganism extends StatelessWidget with ShowModal {
  const ModalOrganism({
    super.key,
    this.icon,
    required this.title,
    this.titleStyle,
    this.description,
    this.descriptionWidget,
    this.firstButtonTitle,
    this.firstButtonOnClick,
    this.titleColor,
    this.descriptionColor,
    this.firstButtonbackgroundColor,
    this.firstButtonIsLoading = false,
    this.firstButtonIsOutlined = false,
    this.firstButtonOutlineColor,
    this.firstButtonTextColor,
    this.isEnabledSecondButton = true,
    this.secondButtonOnClick,
    this.secondButtonTitle,
    this.secondButtonOutlineColor,
    this.secondButtonIsOutlined,
    this.secondButtonBackgroundColor,
    this.showBlur = false,
    this.isPopModalAllowed = true,
    this.descriptionStyle,
    this.child,
    this.descriptionPadding = EdgeInsets.zero,
    this.bottomWidget,
    this.hasCloseButton = false,
    this.onCloseButton,
  });

  final IconData? icon;
  final String title;
  final TextStyle? titleStyle;
  final Color? titleColor;
  final String? description;
  final TextStyle? descriptionStyle;
  final Widget? descriptionWidget;
  final Color? descriptionColor;
  final String? firstButtonTitle;
  final Color? firstButtonTextColor;
  final Color? firstButtonbackgroundColor;
  final bool firstButtonIsLoading;
  final VoidCallback? firstButtonOnClick;
  final String? secondButtonTitle;
  final VoidCallback? secondButtonOnClick;
  final bool isEnabledSecondButton;
  final bool firstButtonIsOutlined;
  final Color? firstButtonOutlineColor;
  final Color? secondButtonOutlineColor;
  final bool? secondButtonIsOutlined;
  final Color? secondButtonBackgroundColor;
  final bool showBlur;
  final bool isPopModalAllowed;
  final Widget? child;
  final EdgeInsetsGeometry descriptionPadding;
  final bool hasCloseButton;
  final Widget? bottomWidget;
  final VoidCallback? onCloseButton;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isPopModalAllowed,
      child: ConditionalParentMolecule(
        condition: showBlur,
        conditionalBuilder: (child) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: kMarginDetail, sigmaY: kMarginDetail),
          child: child,
        ),
        child: Dialog(
          clipBehavior: Clip.hardEdge,
          insetPadding: const EdgeInsets.only(
            left: kMarginDefault,
            right: kMarginDefault,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(kMarginDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon!),
                      const SizedBox(height: kMarginDefault),
                    ],
                    Text(
                      title,
                      style: titleStyle ??
                          AppTextStyles.interMedium18.copyWith(
                            color: titleColor ?? Colors.black,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    if (description != null) ...[
                      const SizedBox(height: kMarginSmall),
                      Padding(
                        padding: descriptionPadding,
                        child: Text(
                          description ?? '',
                          style: descriptionStyle ??
                              AppTextStyles.interRegular14.copyWith(
                                color: descriptionColor ?? Colors.grey,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ] else if (descriptionWidget != null) ...[
                      const SizedBox(height: kMarginSmall),
                      descriptionWidget!,
                    ],
                    if (child != null) ...[
                      const Gap(kMarginDefault),
                      child!,
                    ],
                    if (firstButtonTitle != null && firstButtonOnClick != null) ...[
                      const SizedBox(height: kMarginMedium),
                      DermaButton(
                        backgroundColor: firstButtonbackgroundColor ?? Colors.black,
                        text: firstButtonTitle!,
                        onPressed: firstButtonOnClick!,
                      ),
                    ],
                    if (secondButtonTitle != null && secondButtonOnClick != null) ...[
                      const SizedBox(height: 12),
                      DermaButton(
                        backgroundColor: secondButtonBackgroundColor ?? Colors.white,
                        text: secondButtonTitle!,
                        onPressed: secondButtonOnClick!,
                      ),
                    ],
                    if (bottomWidget != null) bottomWidget!,
                  ],
                ),
              ),
              if (hasCloseButton)
                Positioned(
                  top: kMarginSmall,
                  right: kMarginSmall,
                  child: IconButton(
                    onPressed: onCloseButton ?? Navigator.of(context).pop,
                    icon: const Icon(Icons.close, color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
