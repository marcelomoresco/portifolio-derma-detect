import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_by_id_analyse_usecase.dart';
import 'package:equatable/equatable.dart';
part 'analysis_detail_state.dart';

class AnalysisDetailCubit extends DermaCubit<AnalysisDetailState> {
  AnalysisDetailCubit({
    required SharedNavigator sharedNavigator,
    required GetByIdAnalysisUsecase getByIdAnalysisUsecase,
    required AnalysisDetailCubitParams params,
  })  : _sharedNavigator = sharedNavigator,
        _getByIdAnalysisUsecase = getByIdAnalysisUsecase,
        _params = params,
        super(const AnalysisDetailState());

  final SharedNavigator _sharedNavigator;
  final GetByIdAnalysisUsecase _getByIdAnalysisUsecase;
  final AnalysisDetailCubitParams _params;

  Future<void> onInit() async {
    _getByIdAnalysis();
  }

  void _getByIdAnalysis() async {
    emit(state.copyWith());
    final result = await _getByIdAnalysisUsecase(GetByIdAnalysisUsecaseParams(id: _params.id));
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

  void openOnboardingAnalyze() {
    _sharedNavigator.openOnboardingAnalyze();
  }
}

class AnalysisDetailCubitParams {
  const AnalysisDetailCubitParams({
    required this.id,
  });
  final String id;
}