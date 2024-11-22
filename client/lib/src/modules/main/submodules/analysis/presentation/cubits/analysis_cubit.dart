import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_all_analysis_usecase.dart';
import 'package:equatable/equatable.dart';
part 'analysis_state.dart';

class AnalysisCubit extends DermaCubit<AnalysisState> {
  AnalysisCubit({
    required SharedNavigator sharedNavigator,
    required GetAllAnalysisUsecase getAllAnalysisUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _getAllAnalysisUsecase = getAllAnalysisUsecase,
        super(const AnalysisState());

  final SharedNavigator _sharedNavigator;
  final GetAllAnalysisUsecase _getAllAnalysisUsecase;

  Future<void> onInit() async {
    _getAllAnalysis();
  }

  void _getAllAnalysis() async {
    emit(state.copyWith());
    final result = await _getAllAnalysisUsecase();
    result.fold(
      (failure) => emit(state.copyWith(
        failure: failure,
        analysisStatus: Status.failure,
      )),
      (analysis) => emit(
        state.copyWith(
          analysisStatus: Status.success,
          analysis: analysis,
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    _getAllAnalysis();
  }

  void openOnboardingAnalyze() {
    _sharedNavigator.openOnboardingAnalyze();
  }
}
