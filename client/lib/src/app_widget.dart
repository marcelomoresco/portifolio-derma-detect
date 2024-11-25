import 'package:derma_detect/src/core/consts/app_assets.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _precacheImages(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp.router(
      title: 'DermaCheck App',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: AppTheme.theme,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', '')],
      locale: const Locale('pt', 'BR'),
      themeMode: ThemeMode.light,
      builder: (context, widget) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp],
        );
        return Material(
          child: widget,
        );
      },
    );
  }

  void _precacheImages(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.welcomeImg1), context);
    precacheImage(const AssetImage(AppAssets.welcomeImg2), context);
    precacheImage(const AssetImage(AppAssets.welcomeImg3), context);
    precacheImage(const AssetImage(AppAssets.logo), context);
  }
}
