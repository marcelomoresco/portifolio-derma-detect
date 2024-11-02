import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DermaCheck App',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: AppTheme.theme,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', '')],
      locale: const Locale('pt', 'BR'),
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
}
