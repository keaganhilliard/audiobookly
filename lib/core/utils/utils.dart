import 'package:audio_service/audio_service.dart';

class Utils {
  static format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  static cleanPath(String path) =>
      path.replaceAll(new RegExp(r'([^a-zA-Z0-9 /\.]+)'), '-');
  static cleanFileName(String fileName) =>
      fileName.replaceAll(new RegExp(r'([^a-zA-Z0-9 \.]+)'), '-');
}

extension MediaHelpers on MediaItem {
  String get partKey {
    return extras['partKey'];
  }

  Duration get viewOffset {
    return extras['viewOffset'] == null
        ? Duration.zero
        : Duration(milliseconds: extras['viewOffset']);
  }

  String get largeThumbnail => extras['largeThumbnail'];
}
