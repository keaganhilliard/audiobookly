import 'dart:convert';

class AbsTrack {
  final int index;
  final String ino;
  final String path;
  final String fullPath;
  final String ext;
  final String filename;
  final String format;
  final Duration duration;
  final int size;
  final int bitRate;
  final String? language;
  final String codec;
  final String timeBase;
  final int channels;
  final String channelLayout;
  AbsTrack({
    required this.index,
    required this.ino,
    required this.path,
    required this.fullPath,
    required this.ext,
    required this.filename,
    required this.format,
    required this.duration,
    required this.size,
    required this.bitRate,
    required this.language,
    required this.codec,
    required this.timeBase,
    required this.channels,
    required this.channelLayout,
  });

  AbsTrack copyWith({
    int? index,
    String? ino,
    String? path,
    String? fullPath,
    String? ext,
    String? filename,
    String? format,
    Duration? duration,
    int? size,
    int? bitRate,
    String? language,
    String? codec,
    String? timeBase,
    int? channels,
    String? channelLayout,
  }) {
    return AbsTrack(
      index: index ?? this.index,
      ino: ino ?? this.ino,
      path: path ?? this.path,
      fullPath: fullPath ?? this.fullPath,
      ext: ext ?? this.ext,
      filename: filename ?? this.filename,
      format: format ?? this.format,
      duration: duration ?? this.duration,
      size: size ?? this.size,
      bitRate: bitRate ?? this.bitRate,
      language: language ?? this.language,
      codec: codec ?? this.codec,
      timeBase: timeBase ?? this.timeBase,
      channels: channels ?? this.channels,
      channelLayout: channelLayout ?? this.channelLayout,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'ino': ino,
      'path': path,
      'fullPath': fullPath,
      'ext': ext,
      'filename': filename,
      'format': format,
      'duration': duration.inMilliseconds,
      'size': size,
      'bitRate': bitRate,
      'language': language,
      'codec': codec,
      'timeBase': timeBase,
      'channels': channels,
      'channelLayout': channelLayout,
    };
  }

  factory AbsTrack.fromMap(Map<String, dynamic> map) {
    return AbsTrack(
      index: map['index']?.toInt(),
      ino: map['ino'],
      path: map['path'],
      fullPath: map['fullPath'],
      ext: map['ext'],
      filename: map['filename'],
      format: map['format'],
      duration:
          Duration(milliseconds: (map['duration']?.toDouble() * 1000).round()),
      size: map['size']?.toInt(),
      bitRate: map['bitRate']?.toInt(),
      language: map['language'],
      codec: map['codec'],
      timeBase: map['timeBase'],
      channels: map['channels']?.toInt(),
      channelLayout: map['channelLayout'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsTrack.fromJson(String source) =>
      AbsTrack.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AbsTrack(index: $index, ino: $ino, path: $path, fullPath: $fullPath, ext: $ext, filename: $filename, format: $format, duration: $duration, size: $size, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbsTrack &&
        other.index == index &&
        other.ino == ino &&
        other.path == path &&
        other.fullPath == fullPath &&
        other.ext == ext &&
        other.filename == filename &&
        other.format == format &&
        other.duration == duration &&
        other.size == size &&
        other.bitRate == bitRate &&
        other.language == language &&
        other.codec == codec &&
        other.timeBase == timeBase &&
        other.channels == channels &&
        other.channelLayout == channelLayout;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        ino.hashCode ^
        path.hashCode ^
        fullPath.hashCode ^
        ext.hashCode ^
        filename.hashCode ^
        format.hashCode ^
        duration.hashCode ^
        size.hashCode ^
        bitRate.hashCode ^
        language.hashCode ^
        codec.hashCode ^
        timeBase.hashCode ^
        channels.hashCode ^
        channelLayout.hashCode;
  }
}
