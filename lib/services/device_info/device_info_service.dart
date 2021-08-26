import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceInfoServiceProvider =
    Provider<DeviceInfoService>(((ref) => throw UnimplementedError()));

class DeviceInfo {
  String? uniqueId;
  String? version;
  String? model;
  String? platform;
  DeviceInfo({this.uniqueId, this.version, this.model, this.platform});
}

Future<DeviceInfo> getDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  if (kIsWeb) {
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    return DeviceInfo(
      uniqueId: webBrowserInfo.product,
      model: webBrowserInfo.appName,
      version: '0.0.1.0',
      platform: webBrowserInfo.platform,
    );
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
    return DeviceInfo(
      uniqueId: windowsDeviceInfo.computerName,
      model: windowsDeviceInfo.computerName,
      version: '0.0.1.0',
      platform: 'Windows',
    );
  } else if (Platform.isLinux) {
    LinuxDeviceInfo windowsDeviceInfo = await deviceInfo.linuxInfo;
    return DeviceInfo(
      uniqueId: windowsDeviceInfo.machineId,
      model: windowsDeviceInfo.prettyName,
      version: '0.0.1.0',
      platform: 'Linux',
    );
  } else if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return DeviceInfo(
      uniqueId: androidDeviceInfo.androidId,
      model: androidDeviceInfo.model,
      version: androidDeviceInfo.version.release,
      platform: 'Android',
    );
  } else if (Platform.isIOS) {
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