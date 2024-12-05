import 'dart:io';

import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/create_analyse_usecase.dart';
import 'package:equatable/equatable.dart';
part 'analyze_processing_state.dart';

class AnalyzeProcessingCubit extends DermaCubit<AnalyzeProcessingState> {
  AnalyzeProcessingCubit({
    required SharedNavigator sharedNavigator,
    required CreateAnalysisUsecase createAnalysisUsecase,
    required AnalyzeProcessingCubitParams params,
  })  : _sharedNavigator = sharedNavigator,
        _createAnalysisUsecase = createAnalysisUsecase,
        _params = params,
        super(const AnalyzeProcessingState());

  final SharedNavigator _sharedNavigator;
  final CreateAnalysisUsecase _createAnalysisUsecase;
  final AnalyzeProcessingCubitParams _params;

  Future<void> onInit() async {
    _createAnalyze();
  }

  Future<void> _createAnalyze() async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(seconds: 3));
    final result = await _createAnalysisUsecase(CreateAnalysisUsecaseParams(file: _params.file));
    result.fold(
      (failure) => emit(
        state.copyWith(
          failure: failure,
          status: Status.failure,
        ),
      ),
      (analysis) {
        emit(state.copyWith(status: Status.success));
        _openNextPage(analysis);
      },
    );
  }

  void _openNextPage(Analysis analysis) {
    _sharedNavigator.openDetailAnalysis(analysis);
  }

  void openOnboardingAnalyze() {
    _sharedNavigator.openOnboardingAnalyze();
  }
}

class AnalyzeProcessingCubitParams {
  const AnalyzeProcessingCubitParams({
    required this.file,
  });
  final File file;
}
