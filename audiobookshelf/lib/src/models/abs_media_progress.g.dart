// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_media_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsMediaProgress _$$_AbsMediaProgressFromJson(Map<String, dynamic> json) =>
    _$_AbsMediaProgress(
      timeListened: json['timeListened'] as int,
      duration: (json['duration'] as num).toDouble(),
      currentTime: (json['currentTime'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AbsMediaProgressToJson(_$_AbsMediaProgress instance) =>
    <String, dynamic>{
      'timeListened': instance.timeListened,
      'duration': instance.duration,
      'currentTime': instance.currentTime,
    };
