import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/splash/presentation/cubit/welcome_cubit.dart';
import 'package:derma_detect/src/modules/splash/presentation/molecules/carousel_background_molecule.dart';
import 'package:derma_detect/src/modules/splash/presentation/templates/welcome_template.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:derma_detect/src/modules/splash/splash_strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const routeName = '/welcome';
  static const routePath = SplashModule.routePath + routeName;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends DermaCubitState<WelcomePage, WelcomeCubit> {
  @override
  void initState() {
    cubit.onInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: WelcomeTemplate(
        onLoginTap: cubit.onLoginTap,
        onRegisterTap: cubit.onRegisterTap,
        carouselContent: [
          CarouselContent(
            image: AppAssets.welcomeImg1,
            title: SplashStrings.carouselPage1Title,
            titleWidget: const SizedBox.shrink(),
          ),
          CarouselContent(
            image: AppAssets.welcomeImg2,
            title: SplashStrings.carouselPage2Title,
            titleWidget: const SizedBox.shrink(),
          ),
          CarouselContent(
            image: AppAssets.welcomeImg3,
            titleWidget: const SizedBox.shrink(),
            title: SplashStrings.carouselPage3Title,
          ),
        ],
      ),
    );
  }
}
