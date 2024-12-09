import 'package:derma_detect/src/core/domain/usecases/get_user_profile_usecase.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/auth/domain/entities/derma_user.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/entities/analysis.dart';
import 'package:derma_detect/src/modules/main/submodules/analysis/domain/usecases/get_recents_analysis_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/home/domain/entities/faq_category.dart';
import 'package:equatable/equatable.dart';
part 'home_state.dart';

class HomeCubit extends DermaCubit<HomeState> {
  HomeCubit({
    required SharedNavigator sharedNavigator,
    required GetUserProfileUsecase getUserProfileUsecase,
    required GetRecentsAnalysisUsecase getRecentsAnalysisUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _getUserProfileUsecase = getUserProfileUsecase,
        _getRecentsAnalysisUsecase = getRecentsAnalysisUsecase,
        super(const HomeState());

  final SharedNavigator _sharedNavigator;
  final GetUserProfileUsecase _getUserProfileUsecase;
  final GetRecentsAnalysisUsecase _getRecentsAnalysisUsecase;

  Future<void> onInit() async {
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Future.wait(
      [
        getUserProfile(),
        _getLastAnalysis(),
      ],
    );
  }

  Future<void> onRefresh() async {
    _fetchData();
  }

  Future<void> _getLastAnalysis() async {
    emit(state.copyWith(lastAnalysisStatus: Status.loading));
    final result = await _getRecentsAnalysisUsecase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          lastAnalysisStatus: Status.failure,
        ),
      ),
      (lastAnalysis) => emit(
        state.copyWith(
          lastAnalysisStatus: Status.success,
          lastAnalysis: lastAnalysis,
        ),
      ),
    );
  }

  Future<void> getUserProfile() async {
    emit(state.copyWith(userStatus: Status.loading));
    final result = await _getUserProfileUsecase();
    result.fold(
      (failure) => emit(state.copyWith(userStatus: Status.failure)),
      (dermaUser) => emit(
        state.copyWith(
          userStatus: Status.success,
          dermaUser: dermaUser,
        ),
      ),
    );
  }

  void onTapFaqCategory(FaqCategory faqCategory) {
    _sharedNavigator.openFaqByCategoryPage(faqCategory);
  }

  void onTapNewAnalysis() {
    _sharedNavigator.openOnboardingAnalyze();
  }

  void onTapAnalysis(Analysis analysis) {
    _sharedNavigator.openDetailAnalysis(analysis);
  }

  void onTapQuestion() {
    _sharedNavigator.openQuestions();
  }
}
