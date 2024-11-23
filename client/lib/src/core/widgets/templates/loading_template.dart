import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoadingTemplate extends StatelessWidget {
  const LoadingTemplate({
    super.key,
    this.isAppBarVisible = true,
    this.shouldShowBackButtonLabel = true,
    this.title,
    this.description,
    this.onBackButtonTap,
    this.backgroundColor = Colors.white,
    this.padding,
  });
  final bool isAppBarVisible;
  final bool shouldShowBackButtonLabel;
  final String? title;
  final String? description;
  final VoidCallback? onBackButtonTap;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: isAppBarVisible
          ? SimpleAppBarMolecule(
              onBackButtonTap: onBackButtonTap,
              shouldShowBackButtonLabel: shouldShowBackButtonLabel,
            )
          : null,
      body: ExpandedScrollView(
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: kMarginBig),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: context.colors.primary,
              ),
              const SizedBox(height: 54),
              Visibility(
                visible: title != null,
                child: Text(
                  title ?? '',
                  style: AppTextStyles.interSemiBold30,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
