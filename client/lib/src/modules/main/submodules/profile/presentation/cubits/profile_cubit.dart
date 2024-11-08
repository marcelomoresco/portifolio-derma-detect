import 'dart:io';

import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/base_usecase.dart';
import 'package:derma_detect/src/core/utils/permission_manager.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/usecases/delete_account_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/domain/usecases/sign_out_usecase.dart';
import 'package:derma_detect/src/modules/main/submodules/profile/profile_navigator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:permission_handler/permission_handler.dart';
part 'profile_state.dart';

class ProfileCubit extends DermaCubit<ProfileState> {
  ProfileCubit({
    required SharedNavigator sharedNavigator,
    required SignOutUsecase signOutUsecase,
    required DeleteAccountUsecase deleteAccountUsecase,
    required ProfileNavigator profileNavigator,
  })  : _sharedNavigator = sharedNavigator,
        _signOutUsecase = signOutUsecase,
        _profileNavigator = profileNavigator,
        _deleteAccountUsecase = deleteAccountUsecase,
        super(const ProfileState());

  final SharedNavigator _sharedNavigator;
  final SignOutUsecase _signOutUsecase;
  final DeleteAccountUsecase _deleteAccountUsecase;
  final ProfileNavigator _profileNavigator;

  Future<void> onInit() async {
    // _getProfilePicturePath();
  }

  void openMyProfilePage() => _profileNavigator.openAccount();

  void openHelpMePage() => _profileNavigator.openFaq();

  void openAboutPage() => _profileNavigator.openAboutPage();

  Future<void> signOut() async {
    emit(state.copyWith(signOutStatus: Status.loading));
    final result = await _signOutUsecase(NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            signOutStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (success) {
        emit(
          state.copyWith(
            signOutStatus: Status.success,
          ),
        );
        _openLogin();
      },
    );
  }

  void _openLogin() {
    Modular.to.pop();
    debugPrint(Modular.to.path);
    _sharedNavigator.openFirstAccessModule();
  }
}
