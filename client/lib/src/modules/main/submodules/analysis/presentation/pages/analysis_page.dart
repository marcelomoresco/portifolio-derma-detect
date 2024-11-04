import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:flutter/cupertino.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});
  static const routeName = '/analysis-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
