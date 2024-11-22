import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analyze_processing_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/analyze_processing_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisProcessingPage extends StatefulWidget {
  const AnalysisProcessingPage({super.key});
  static const routeName = '/analysis-processing-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<AnalysisProcessingPage> createState() => _AnalysisProcessingPageState();
}

class _AnalysisProcessingPageState extends DermaCubitState<AnalysisProcessingPage, AnalyzeProcessingCubit> {
  @override
  void initState() {
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalyzeProcessingCubit, AnalyzeProcessingState>(
      bloc: cubit,
      builder: (context, state) {
        return const AnalyzeProcessingTemplate();
      },
    );
  }
}
