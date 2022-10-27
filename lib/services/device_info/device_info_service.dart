import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';

final deviceInfoServiceProvider =
    Provider<DeviceInfoService>(((ref) => GetIt.I.get()));

class DeviceInfo {
  String? uniqueId;
  String? version;
  String? model;
  String? platform;
  String? manufacturer;
  DeviceInfo({
    this.uniqueId,
    this.version,
    this.model,
    this.platform,
    this.manufacturer,
  });
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
    // LinuxDeviceInfo linuxDeviceInfo = await deviceInfo.linuxInfo;
    return DeviceInfo(
      uniqueId: 'Unknown',
      model: 'Unknown',
      version: '0.0.1.0',
      platform: 'Linux',
    );
  } else if (Platform.isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return DeviceInfo(
      uniqueId: androidDeviceInfo.id,
      model: androidDeviceInfo.model,
      manufacturer: androidDeviceInfo.manufacturer,
      version: '0.0.1.0',
      platform: 'Android',
    );
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return DeviceInfo(
      uniqueId: iosInfo.identifierForVendor,
      model: iosInfo.utsname.machine,
      version: '0.0.1.0',
      platform: iosInfo.model,
      manufacturer: 'Apple',
    );
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo macOsDeviceInfo = await deviceInfo.macOsInfo;
    return DeviceInfo(
      uniqueId: macOsDeviceInfo.systemGUID,
      model: macOsDeviceInfo.model,
      version: '0.0.1.0',
      platform: macOsDeviceInfo.model,
      manufacturer: 'Apple',
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
