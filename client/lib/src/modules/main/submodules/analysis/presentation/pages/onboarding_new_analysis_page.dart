import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/onboarding_new_analysis_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingNewAnalysisPage extends StatefulWidget {
  const OnboardingNewAnalysisPage({super.key});
  static const routeName = '/onboarding-new-analysis';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<OnboardingNewAnalysisPage> createState() => _OnboardingNewAnalysisPageState();
}

class _OnboardingNewAnalysisPageState extends State<OnboardingNewAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: context.colors.primary,
        centerTitle: true,
        title: Text(
          "Começe agora mesmo",
          style: AppTextStyles.interMedium20,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kMarginSmall),
            bottomRight: Radius.circular(kMarginSmall),
          ),
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
      body: OnboardingNewAnalysisTemplate(
        onTapStarted: () {},
      ),
    );
  }
}
