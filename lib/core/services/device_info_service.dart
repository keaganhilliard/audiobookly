import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class DeviceInfoService {
  DeviceInfoService(this.info);
  final DeviceInfo info;
}
