import 'package:derma_detect/src/core/helpers/derma_cubit.dart';
import 'package:derma_detect/src/core/services/device/device_service.dart';
import 'package:derma_detect/src/core/utils/status.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'about_state.dart';

class AboutCubit extends DermaCubit<AboutState> {
  AboutCubit({
    required DeviceInfoService deviceInfoService,
  })  : _deviceInfoService = deviceInfoService,
        super(const AboutState(status: Status.initial));

  final DeviceInfoService _deviceInfoService;

  getInfo() async {
    emit(state.copyWith(status: Status.loading));
    await _getAppInfo();
    await _getDeviceInfo();
    emit(state.copyWith(status: Status.success));
  }

  Future<void> _getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    emit(state.copyWith(version: version, build: buildNumber));
  }

  Future<void> _getDeviceInfo() async {
    final deviceInfo = await _deviceInfoService.getDeviceInformation();

    emit(
      state.copyWith(
        model: deviceInfo.deviceModel,
        system: '${deviceInfo.os} ${deviceInfo.osVersion}',
      ),
    );
  }
}
