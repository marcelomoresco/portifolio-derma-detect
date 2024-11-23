import 'dart:async';
import 'dart:io';

import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/utils/permission_manager.dart';
import 'package:derma_detect/src/core/utils/shared_navigator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
part 'onboarding_new_analysis_state.dart';

class OnboardingNewAnalysisCubit extends DermaCubit<OnboardingNewAnalysisState> {
  OnboardingNewAnalysisCubit({
    required SharedNavigator sharedNavigator,
    required PermissionManager permissionManager,
  })  : _sharedNavigator = sharedNavigator,
        _permissionManager = permissionManager,
        super(const OnboardingNewAnalysisState());

  final SharedNavigator _sharedNavigator;
  final PermissionManager _permissionManager;

  @override
  FutureOr<void> onInitState() {
    _shouldOpenCamera();
  }

  Future<void> _shouldOpenCamera() async {
    _permissionManager.checkPermission(
      requestPermission: Permission.camera.request,
      showModalPermission: () {
        _showModalPermission();
      },
      onGrantedPermission: () {
        emit(state.copyWith(statusPage: OnboardingNewAnalysis.authorizedCamera));
      },
      onLimitedPermission: () {
        _showModalPermission();
      },
    );
  }

  void _showModalPermission() {
    emit(state.copyWith(showModalPermission: true));
  }

  final _imagePicker = ImagePicker();

  void onTapCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      Modular.to.pop();
      return;
    }
    Modular.to.pop();
    final file = File(image.path);

    _sharedNavigator.openAnalyzeProcessing(file);
  }

  void onTapGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      Modular.to.pop();
      return;
    }

    final file = File(image.path);
    Modular.to.pop();
    _sharedNavigator.openAnalyzeProcessing(file);
  }

  void closeModal() {
    Modular.to.pop();
  }
}
