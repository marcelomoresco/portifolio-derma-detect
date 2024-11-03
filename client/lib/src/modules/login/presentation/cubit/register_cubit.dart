import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/modules/login/presentation/cubit/login_state.dart';

class RegisterCubit extends DermaCubit<LoginState> {
  RegisterCubit({
    required SharedNavigator sharedNavigator,
  })  : _sharedNavigator = sharedNavigator,
        super(const LoginState());

  final SharedNavigator _sharedNavigator;

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
