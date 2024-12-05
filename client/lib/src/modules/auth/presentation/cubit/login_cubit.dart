import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_in_usecase.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_state.dart';

class LoginCubit extends DermaCubit<LoginState> {
  LoginCubit({
    required SharedNavigator sharedNavigator,
    required SignInUsecase signInUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _signInUsecase = signInUsecase,
        super(const LoginState());

  final SharedNavigator _sharedNavigator;
  final SignInUsecase _signInUsecase;

  bool? isRegistered;
  String inputDocument = '';

  void onFieldChanged({String? email, String? password}) {
    final data = state.authData?.copyWith(
      email: email,
      password: password,
    );

    bool isAllValid = data?.isValidLogin ?? false;

    emit(
      state.copyWith(
        authData: data,
        isContinueButtonEnabled: isAllValid,
      ),
    );
  }

  void toggleShowPassword() => emit(state.copyWith(showPassword: !state.showPassword));

  void onRegisterTap() {
    _sharedNavigator.openRegister();
  }

  Future<void> onLoginTap() async {
    emit(state.copyWith(isContinueButtonLoading: true));
    if (state.authData == null) return;

    final result = await _signInUsecase(
      SignInUsecaseParams(auth: state.authData!),
    );

    return result.fold(
      (failure) => emit(
        state.copyWith(
          isContinueButtonLoading: false,
          failure: failure,
        ),
      ),
      (dermaUser) {
        emit(state.copyWith(isContinueButtonLoading: false));
        openHome();
      },
    );
  }

  void openHome() {
    _sharedNavigator.openMain();
  }
}
