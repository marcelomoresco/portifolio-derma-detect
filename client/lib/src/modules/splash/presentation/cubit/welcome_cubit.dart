import 'package:derma_detect/src/core/domain/usecases/get_user_token_usecase.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';

import 'package:permission_handler/permission_handler.dart';
import 'welcome_state.dart';

class WelcomeCubit extends DermaCubit<WelcomeState> {
  WelcomeCubit({
    required SharedNavigator sharedNavigator,
    required GetTokenUsecase getTokenUsecase,
  })  : _sharedNavigator = sharedNavigator,
        _getTokenUsecase = getTokenUsecase,
        super(const WelcomeState(status: Status.initial));
  final SharedNavigator _sharedNavigator;
  final GetTokenUsecase _getTokenUsecase;

  // Init
  @override
  Future<void> onInitState() async {
    await Future.wait([
      _permissions(),
      _getToken(),
    ]);
  }

  Future<void> _getToken() async {
    final result = await _getTokenUsecase();
    result.fold(
      (failure) => null,
      (token) {
        if (token == null) return;
        //_sharedNavigator.openMain();
      },
    );
  }

  static bool _isRequestingPermissions = false;

  Future<void> _permissions() async {
    if (_isRequestingPermissions) {
      return;
    }
    _isRequestingPermissions = true;

    try {
      await [
        Permission.notification,
        Permission.locationWhenInUse,
        Permission.appTrackingTransparency,
        Permission.camera,
      ].request();
    } finally {
      _isRequestingPermissions = false;
    }
  }

  // Future<void> _getDeramUser() async {
  //   final result = await _getKoinUserUsecase(NoParams());

  //   if (result.isRight()) {
  //     koinUser = (result as Right).value;
  //   }
  // }

  void onLoginTap() {
    _sharedNavigator.openLogin();
  }

  void onRegisterTap() {
    _sharedNavigator.openRegister();
  }
}
