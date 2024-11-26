import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/show_modal.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analyze_processing_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/analyze_processing_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return BlocConsumer<AnalyzeProcessingCubit, AnalyzeProcessingState>(
      bloc: cubit,
      listener: (context, state) async {
        if (state.failure != null) {
          if (state.failure?.exception is ClientException) {
            final exception = state.failure?.exception as ClientException;
            showModalError(
              exception.message,
              context: context,
              enableDrag: false,
              onTap: () {
                Modular.get<SharedNavigator>().openMain();
              },
            );
          } else {
            showModalError(
              "Infelizmente algo deu errado, tente novamente mais tarde",
              context: context,
              enableDrag: false,
              onTap: () {
                Modular.get<SharedNavigator>().openMain();
              },
            );
          }
        }
      },
      listenWhen: (previous, current) => previous.failure != current.failure,
      builder: (context, state) {
        return const AnalyzeProcessingTemplate();
      },
    );
  }
}
