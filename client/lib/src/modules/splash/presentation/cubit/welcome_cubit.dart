import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';

import 'package:permission_handler/permission_handler.dart';
import 'welcome_state.dart';

class WelcomeCubit extends DermaCubit<WelcomeState> {
  WelcomeCubit({
    required SharedNavigator sharedNavigator,
  })  : _sharedNavigator = sharedNavigator,
        super(const WelcomeState(status: Status.initial));
  final SharedNavigator _sharedNavigator;
  // final GetKoinUserUsecase _getKoinUserUsecase;

  // KoinUser? koinUser;

  // Init
  @override
  Future<void> onInitState() async {
    await Future.wait([
      _permissions(),
      // _getKoinUser(),
    ]);
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

  void onLoginTap() {}

  void onRegisterTap() {}
}
