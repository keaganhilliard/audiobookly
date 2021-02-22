import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info/device_info.dart';

final deviceInfoServiceProvider =
    Provider<DeviceInfoService>((ref) => throw UnimplementedError());

class DeviceInfo {
  String uniqueId;
  String version;
  String model;
  String platform;
  DeviceInfo({this.uniqueId, this.version, this.model, this.platform});
}

Future<DeviceInfo> getDeviceInfo() async {
  if (kIsWeb || Platform.isWindows) {
    return DeviceInfo(
      uniqueId: 'AUDIOBOOKLY_WEB',
      model: 'Chrome',
      version: '0.0.1.0',
      platform: 'Chrome',
    );
  } else if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return DeviceInfo(
      uniqueId: androidDeviceInfo.androidId,
      model: androidDeviceInfo.model,
      version: androidDeviceInfo.version.release,
      platform: 'Android',
    );
  } else if (Platform.isIOS) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return DeviceInfo(
      uniqueId: iosInfo.identifierForVendor,
      model: iosInfo.model,
      platform: 'iOS',
      version: iosInfo.systemVersion,
    );
  } else {
    return DeviceInfo(
      uniqueId: 'AUDIOBOOKLY_WEB',
      model: 'Chrome',
      version: '0.0.1.0',
      platform: 'Unknown',
    );
  }
}

class DeviceInfoService {
  DeviceInfoService(this.info);
  final DeviceInfo info;
}
