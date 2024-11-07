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

  void onFieldChanged(String text) {
    inputDocument = text;
    const isValid = true;

    emit(state.copyWith(isContinueButtonEnabled: isValid));
  }

  void onRegisterTap() {
    _sharedNavigator.openRegister();
  }

  void onLoginTap() {
    _sharedNavigator.openMain();
    // _sharedNavigator.openRegister();
  }
}
