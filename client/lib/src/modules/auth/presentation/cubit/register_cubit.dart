import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/register_state.dart';

class RegisterCubit extends DermaCubit<RegisterState> {
  RegisterCubit({
    required SharedNavigator sharedNavigator,
    required SignUpUsecase signUpUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _signUpUsecase = signUpUsecase,
        super(const RegisterState());

  final SharedNavigator _sharedNavigator;
  final SignUpUsecase _signUpUsecase;

  bool? isRegistered;
  String inputDocument = '';

  void onFieldChanged({String? name, String? email, String? password, String? confirmPassword}) {
    final data = state.authData?.copyWith(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    bool isAllValid = data?.isValidLogin ?? false;

    if (data?.password != data?.confirmPassword) {
      isAllValid = false;
    }

    emit(
      state.copyWith(
        authData: data,
        isContinueButtonEnabled: isAllValid,
      ),
    );
  }

  void toggleShowPassword() => emit(state.copyWith(showPassword: !state.showPassword));

  void onRegister() async {
    emit(state.copyWith(isContinueButtonLoading: true));

    if (state.authData == null) {
      emit(state.copyWith(isContinueButtonLoading: false));
      return;
    }
    final result = await _signUpUsecase(
      SignUpUsecaseParams(auth: state.authData!),
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
        _openHome();
      },
    );
  }

  void openLogin() {
    _sharedNavigator.openLogin();
  }

  void _openHome() {
    _sharedNavigator.openMain();
  }
}
