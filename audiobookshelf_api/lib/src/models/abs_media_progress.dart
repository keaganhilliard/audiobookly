import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_media_progress.freezed.dart';
part 'abs_media_progress.g.dart';

@freezed
class AbsMediaProgress with _$AbsMediaProgress {
  const factory AbsMediaProgress({
    required int timeListened,
    required double duration,
    required double currentTime,
  }) = _AbsMediaProgress;

  factory AbsMediaProgress.fromJson(Map<String, dynamic> json) =>
      _$AbsMediaProgressFromJson(json);
}
