import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/auth/domain/usecases/sign_up_usecase.dart';
import 'package:derma_detect/src/modules/auth/presentation/cubit/login_state.dart';

class RegisterCubit extends DermaCubit<LoginState> {
  RegisterCubit({
    required SharedNavigator sharedNavigator,
    required SignUpUsecase signUpUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _signUpUsecase = signUpUsecase,
        super(const LoginState());

  final SharedNavigator _sharedNavigator;
  final SignUpUsecase _signUpUsecase;

  bool? isRegistered;
  String inputDocument = '';

  void onFieldChanged(String text) {
    inputDocument = text;
    const isValid = true;

    emit(state.copyWith(isContinueButtonEnabled: isValid));
  }

  void openLogin() {
    _sharedNavigator.openLogin();
  }

  void onRegister() {
    _sharedNavigator.openLogin();
  }
}
