import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:equatable/equatable.dart';
part 'analysis_state.dart';

class AnalysisCubit extends DermaCubit<AnalysisState> {
  AnalysisCubit({
    required SharedNavigator sharedNavigator,
  })  : _sharedNavigator = sharedNavigator,
        super(const AnalysisState());

  final SharedNavigator _sharedNavigator;

  Future<void> onInit() async {
    // _getProfilePicturePath();
  }

  void openOnboardingAnalyze() {
    _sharedNavigator.openOnboardingAnalyze();
  }
}
