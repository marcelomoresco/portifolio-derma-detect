import 'dart:async';
import 'dart:io';
import 'package:derma_detect/src/core/domain/entities/device_info.dart';
import 'package:derma_detect/src/core/errors/errors.dart';
import 'package:derma_detect/src/core/services/cache/cache_memory.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class DeviceInfoService {
  Future<DeviceInfo> getDeviceInformation({
    bool isRequiredIp = false,
  });

  Future<String> getDeviceModel();

  Future<DateTime> getInstallDate();

  Future<Position?> getPosition();
}

class DeviceInfoServiceImpl implements DeviceInfoService {
  DeviceInfoServiceImpl();

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static const Duration requestTimeout = Duration(seconds: 10);

  final _getDeviceModel = _GetDeviceModel(deviceInfoPlugin: deviceInfoPlugin);
  final _getAppInstallDate = _GetAppInstallDate();
  final _getDevicePosition = _GetDevicePosition();

  @override
  Future<DeviceInfo> getDeviceInformation({
    bool isRequiredIp = false,
  }) async {
    late final String deviceModel;
    late final DateTime appInstallDate;
    late final Position? position;

    await Future.wait([
      getDeviceModel().then((value) => deviceModel = value),
      getInstallDate().then((value) => appInstallDate = value),
      getPosition().then((value) => position = value),
    ]);

    final double? longitude = position?.longitude;
    final double? latitude = position?.longitude;

    final String os = Platform.operatingSystem;
    final String osVersion = Platform.operatingSystemVersion;

    return DeviceInfo(
      deviceModel: deviceModel,
      longitude: longitude,
      latitude: latitude,
      os: os,
      osVersion: osVersion,
      appInstallDate: appInstallDate,
    );
  }

  @override
  Future<String> getDeviceModel() async {
    try {
      return await _getDeviceModel.getData();
    } catch (e) {
      return '';
    }
  }

  @override
  Future<DateTime> getInstallDate() async {
    try {
      return await _getAppInstallDate.getData();
    } catch (e) {
      return DateTime.now();
    }
  }

  @override
  Future<Position?> getPosition() async {
    try {
      PermissionStatus permissionStatus = await Permission.locationWhenInUse.status;

      if (permissionStatus == PermissionStatus.denied) {
        while (true) {
          try {
            final now = DateTime.now();

            await Permission.locationWhenInUse.request();

            debugPrint(
              'Location Permission: success in ${DateTime.now().millisecond - now.millisecond} milliseconds!',
            );
            break;
          } on PlatformException catch (error) {
            // ? Delay to slow down the loop (avoiding expensive computing)
            await Future.delayed(const Duration(milliseconds: 200));

            const permissionRequestRunningMessage = 'already running';
            if (error.message?.contains(permissionRequestRunningMessage) ?? false) {
              continue;
            }
            break;
          }
        }
        permissionStatus = await Permission.locationWhenInUse.status;
        debugPrint('Location Permission Status: $permissionStatus');
      }

      if (permissionStatus != PermissionStatus.granted) {
        throw const CustomError('Geolocator: Denied permission.');
      }

      final result = await _getDevicePosition.getData();
      return result;
    } catch (e) {
      return null;
    }
  }
}

// ignore: unused_element
class _GetDeviceId extends CachedMemory<String> {
  _GetDeviceId({
    required DeviceInfoPlugin deviceInfoPlugin,
  })  : _deviceInfoPlugin = deviceInfoPlugin,
        super(requestTimeout: DeviceInfoServiceImpl.requestTimeout);

  final DeviceInfoPlugin _deviceInfoPlugin;

  @override
  @protected
  Future<String> request() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceData = await _deviceInfoPlugin.androidInfo;
      return androidDeviceData.id;
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceData = await _deviceInfoPlugin.iosInfo;
      return iosDeviceData.identifierForVendor!;
    }

    throw const DermaException(message: 'Invalid Platform.');
  }
}

class _GetDeviceModel extends CachedMemory<String> {
  _GetDeviceModel({
    required DeviceInfoPlugin deviceInfoPlugin,
  })  : _deviceInfoPlugin = deviceInfoPlugin,
        super(requestTimeout: DeviceInfoServiceImpl.requestTimeout);

  final DeviceInfoPlugin _deviceInfoPlugin;

  @override
  Future<String> request() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceData = await _deviceInfoPlugin.androidInfo;
      return androidDeviceData.model;
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceData = await _deviceInfoPlugin.iosInfo;
      return iosDeviceData.model;
    }

    throw const CustomError('Invalid Platform.');
  }
}

class _GetAppInstallDate extends CachedMemory<DateTime> {
  _GetAppInstallDate() : super(requestTimeout: DeviceInfoServiceImpl.requestTimeout);

  @override
  Future<DateTime> request() async {
    var applicationDocumentsDirectory = await getApplicationDocumentsDirectory();
    var stat = await FileStat.stat(applicationDocumentsDirectory.path);
    return stat.accessed;
  }
}

class _GetDevicePosition extends CachedMemory<Position?> {
  _GetDevicePosition()
      : super(
          keepCachedByDuration: const Duration(minutes: 10),
          requestTimeout: DeviceInfoServiceImpl.requestTimeout,
        );

  @override
  Future<Position?> request() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    PermissionStatus permissionStatus = await Permission.locationWhenInUse.status;

    if (permissionStatus == PermissionStatus.granted) {
      return await Geolocator.getCurrentPosition();
    } else {
      throw const CustomError('Geolocator: Denied permission.');
    }
  }
}
