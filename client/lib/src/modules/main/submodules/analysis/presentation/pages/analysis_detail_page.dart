import 'package:derma_detect/src/core/consts/app_textstyles.dart';
import 'package:derma_detect/src/core/consts/core_dimens.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit_state.dart';
import 'package:derma_detect/src/modules/main/main_module.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/cubits/analysis_detail_cubit.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/presentation/templates/analysis_detail_template.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisDetailPage extends StatefulWidget {
  const AnalysisDetailPage({super.key});
  static const routeName = '/analysis-detail-page';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<AnalysisDetailPage> createState() => _AnalysisDetailPageState();
}

class _AnalysisDetailPageState extends DermaCubitState<AnalysisDetailPage, AnalysisDetailCubit> {
  @override
  void initState() {
    cubit.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnalysisDetailCubit, AnalysisDetailState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: SimpleAppBarMolecule(
            shouldShowBackButtonLabel: false,
            showBackButton: true,
            height: kToolbarHeight,
            elevation: 0.5,
            title: Text(
              "Detalhes da análise",
              style: AppTextStyles.interSemiBold20,
            ),
            onBackButtonTap: cubit.onBackButtonTap,
            shapeBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(kCornerBig),
              ),
            ),
          ),
          body: AnalysisDetailTemplate(
            analysis: state.analysis,
            analysisStatus: state.analysisStatus,
          ),
        );
      },
    );
  }
}
