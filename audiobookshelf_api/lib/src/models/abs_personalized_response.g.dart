// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_personalized_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsPersonalizedResponseBookImpl _$$AbsPersonalizedResponseBookImplFromJson(
        Map<String, dynamic> json) =>
    _$AbsPersonalizedResponseBookImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => AbsAudiobookMinified.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsPersonalizedResponseBookImplToJson(
        _$AbsPersonalizedResponseBookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseAuthorImpl
    _$$AbsPersonalizedResponseAuthorImplFromJson(Map<String, dynamic> json) =>
        _$AbsPersonalizedResponseAuthorImpl(
          id: json['id'] as String,
          label: json['label'] as String,
          labelStringKey: json['labelStringKey'] as String,
          type: json['type'] as String,
          entities: (json['entities'] as List<dynamic>)
              .map((e) => AbsAuthor.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$AbsPersonalizedResponseAuthorImplToJson(
        _$AbsPersonalizedResponseAuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseSeriesImpl
    _$$AbsPersonalizedResponseSeriesImplFromJson(Map<String, dynamic> json) =>
        _$AbsPersonalizedResponseSeriesImpl(
          id: json['id'] as String,
          label: json['label'] as String,
          labelStringKey: json['labelStringKey'] as String,
          type: json['type'] as String,
          entities: (json['entities'] as List<dynamic>)
              .map((e) => AbsSeries.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$AbsPersonalizedResponseSeriesImplToJson(
        _$AbsPersonalizedResponseSeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseUnknownImpl
    _$$AbsPersonalizedResponseUnknownImplFromJson(Map<String, dynamic> json) =>
        _$AbsPersonalizedResponseUnknownImpl(
          id: json['id'] as String,
          label: json['label'] as String,
          labelStringKey: json['labelStringKey'] as String,
          type: json['type'] as String,
          entities: (json['entities'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
        );

Map<String, dynamic> _$$AbsPersonalizedResponseUnknownImplToJson(
        _$AbsPersonalizedResponseUnknownImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };
