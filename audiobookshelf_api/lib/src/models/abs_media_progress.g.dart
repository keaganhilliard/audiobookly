// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_media_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsMediaProgressImpl _$$AbsMediaProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$AbsMediaProgressImpl(
      timeListened: (json['timeListened'] as num).toInt(),
      duration: (json['duration'] as num).toDouble(),
      currentTime: (json['currentTime'] as num).toDouble(),
    );

Map<String, dynamic> _$$AbsMediaProgressImplToJson(
        _$AbsMediaProgressImpl instance) =>
    <String, dynamic>{
      'timeListened': instance.timeListened,
      'duration': instance.duration,
      'currentTime': instance.currentTime,
    };
