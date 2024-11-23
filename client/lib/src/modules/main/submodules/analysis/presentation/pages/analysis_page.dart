import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/analysis_list_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});
  static const routeName = '/analysis-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends DermaCubitState<AnalysisPage, AnalysisCubit> {
  @override
  void initState() {
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisCubit, AnalysisState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: SimpleAppBarMolecule(
            shouldShowBackButtonLabel: false,
            showBackButton: false,
            height: kToolbarHeight,
            elevation: 1,
            title: Text(
              "Suas análises",
              style: AppTextStyles.interSemiBold20,
            ),
            shapeBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(kCornerBig),
              ),
            ),
          ),
          body: AnalysisListTemplate(
            onTapNewAnalyze: cubit.openOnboardingAnalyze,
            onRefresh: cubit.onRefresh,
            analysis: state.analysis,
            analysisStatus: state.analysisStatus,
            onTapAnalysis: cubit.onTapAnalysis,
            user: state.dermaUser,
          ),
          floatingActionButton: (state.dermaUser?.isLimitAnalyses ?? false)
              ? null
              : FloatingActionButton(
                  onPressed: cubit.openOnboardingAnalyze,
                  backgroundColor: context.colors.sucess,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
        );
      },
    );
  }
}
