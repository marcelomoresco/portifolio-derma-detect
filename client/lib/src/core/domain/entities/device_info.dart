class DeviceInfo {
  const DeviceInfo({
    this.deviceId,
    this.deviceModel,
    this.deviceIp,
    this.longitude,
    this.latitude,
    this.os,
    this.osVersion,
    this.appInstallDate,
  });

  final String? deviceId;
  final String? deviceModel;
  final String? deviceIp;
  final double? longitude;
  final double? latitude;
  final String? os;
  final String? osVersion;
  final DateTime? appInstallDate;

  DeviceInfo copyWith(
    String? deviceId,
    String? deviceModel,
    String? deviceIp,
    double? longitude,
    double? latitude,
    String? os,
    String? osVersion,
    DateTime? appInstallDate,
  ) {
    return DeviceInfo(
      deviceId: deviceId ?? this.deviceId,
      deviceModel: deviceModel ?? this.deviceModel,
      deviceIp: deviceIp ?? this.deviceIp,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      os: os ?? this.os,
      osVersion: osVersion ?? this.osVersion,
      appInstallDate: appInstallDate ?? this.appInstallDate,
    );
  }
}
