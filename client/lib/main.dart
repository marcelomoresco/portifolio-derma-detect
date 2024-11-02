import 'package:derma_detect/src/app_module.dart';
import 'package:derma_detect/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await _load();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

Future<void> _load() async {
  WidgetsFlutterBinding.ensureInitialized();
}
