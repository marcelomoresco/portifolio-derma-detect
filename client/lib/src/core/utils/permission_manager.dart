import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  @visibleForTesting
  static bool isPermissionRequestInProgress = false;

  Future<void> checkPermission({
    required void Function() showModalPermission,
    required void Function() onGrantedPermission,
    void Function()? onLimitedPermission,
    required Future<PermissionStatus> Function() requestPermission,
  }) async {
    if (isPermissionRequestInProgress) {
      return;
    }

    isPermissionRequestInProgress = true;

    PermissionStatus permissionStatus;
    try {
      permissionStatus = await requestPermission();
    } finally {
      isPermissionRequestInProgress = false;
    }

    if (permissionStatus == PermissionStatus.permanentlyDenied || permissionStatus == PermissionStatus.denied) {
      showModalPermission();
    } else if (permissionStatus == PermissionStatus.limited) {
      onLimitedPermission?.call();
    } else if (permissionStatus == PermissionStatus.granted) {
      onGrantedPermission();
    }
  }
}
