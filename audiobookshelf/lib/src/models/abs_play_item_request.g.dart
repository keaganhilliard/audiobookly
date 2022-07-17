// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_play_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsPlayItemRequest _$$_AbsPlayItemRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AbsPlayItemRequest(
      mediaPlayer: json['mediaPlayer'] as String,
      forceDirectPlay: json['forceDirectPlay'] as bool,
      forceTranscode: json['forceTranscode'] as bool,
      deviceInfo:
          DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AbsPlayItemRequestToJson(
        _$_AbsPlayItemRequest instance) =>
    <String, dynamic>{
      'mediaPlayer': instance.mediaPlayer,
      'forceDirectPlay': instance.forceDirectPlay,
      'forceTranscode': instance.forceTranscode,
      'deviceInfo': instance.deviceInfo,
    };

_$_DeviceInfo _$$_DeviceInfoFromJson(Map<String, dynamic> json) =>
    _$_DeviceInfo(
      manufacturer: json['manufacturer'] as String,
      model: json['model'] as String,
      brand: json['brand'] as String,
      sdkVersion: json['sdkVersion'] as String,
      clientVersion: json['clientVersion'] as String,
    );

Map<String, dynamic> _$$_DeviceInfoToJson(_$_DeviceInfo instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'brand': instance.brand,
      'sdkVersion': instance.sdkVersion,
      'clientVersion': instance.clientVersion,
    };
