import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:derma_detect/src/modules/splash/splash_module.dart';
import 'package:derma_detect/src/modules/splash/splash_navigator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash-page';
  static const routePath = SplashModule.routePath + routeName;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigateToNextPage();
    });
    super.initState();
  }

  void _navigateToNextPage() {
    SplashNavigator().openWelcomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: 'logoSplashLogin',
                child: Image.asset(
                  AppAssets.logo,
                  height: 190,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
