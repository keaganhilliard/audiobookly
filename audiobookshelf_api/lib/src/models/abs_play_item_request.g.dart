// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_play_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsPlayItemRequestImpl _$$AbsPlayItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AbsPlayItemRequestImpl(
      mediaPlayer: json['mediaPlayer'] as String,
      forceDirectPlay: json['forceDirectPlay'] as bool,
      forceTranscode: json['forceTranscode'] as bool,
      deviceInfo:
          DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AbsPlayItemRequestImplToJson(
        _$AbsPlayItemRequestImpl instance) =>
    <String, dynamic>{
      'mediaPlayer': instance.mediaPlayer,
      'forceDirectPlay': instance.forceDirectPlay,
      'forceTranscode': instance.forceTranscode,
      'deviceInfo': instance.deviceInfo,
    };

_$DeviceInfoImpl _$$DeviceInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeviceInfoImpl(
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      brand: json['brand'] as String,
      sdkVersion: json['sdkVersion'] as String,
      clientVersion: json['clientVersion'] as String,
    );

Map<String, dynamic> _$$DeviceInfoImplToJson(_$DeviceInfoImpl instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'brand': instance.brand,
      'sdkVersion': instance.sdkVersion,
      'clientVersion': instance.clientVersion,
    };
