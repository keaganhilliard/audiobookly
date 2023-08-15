// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_personalized_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsPersonalizedResponseBook _$$AbsPersonalizedResponseBookFromJson(
        Map<String, dynamic> json) =>
    _$AbsPersonalizedResponseBook(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => AbsAudiobookMinified.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsPersonalizedResponseBookToJson(
        _$AbsPersonalizedResponseBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseAuthor _$$AbsPersonalizedResponseAuthorFromJson(
        Map<String, dynamic> json) =>
    _$AbsPersonalizedResponseAuthor(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsPersonalizedResponseAuthorToJson(
        _$AbsPersonalizedResponseAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseSeries _$$AbsPersonalizedResponseSeriesFromJson(
        Map<String, dynamic> json) =>
    _$AbsPersonalizedResponseSeries(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => AbsSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsPersonalizedResponseSeriesToJson(
        _$AbsPersonalizedResponseSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };

_$AbsPersonalizedResponseUnknown _$$AbsPersonalizedResponseUnknownFromJson(
        Map<String, dynamic> json) =>
    _$AbsPersonalizedResponseUnknown(
      id: json['id'] as String,
      label: json['label'] as String,
      labelStringKey: json['labelStringKey'] as String,
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$AbsPersonalizedResponseUnknownToJson(
        _$AbsPersonalizedResponseUnknown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'labelStringKey': instance.labelStringKey,
      'type': instance.type,
      'entities': instance.entities,
    };
