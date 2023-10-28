// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsSeriesImpl _$$AbsSeriesImplFromJson(Map<String, dynamic> json) =>
    _$AbsSeriesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameIgnorePrefix: json['nameIgnorePrefix'] as String?,
      nameIgnorePrefixSort: json['nameIgnorePrefixSort'] as String?,
      type: json['type'] as String?,
      books: (json['books'] as List<dynamic>)
          .map((e) => AbsAudiobookMinified.fromJson(e as Map<String, dynamic>))
          .toList(),
      addedAt: json['addedAt'] as int,
      totalDuration: (json['totalDuration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AbsSeriesImplToJson(_$AbsSeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameIgnorePrefix': instance.nameIgnorePrefix,
      'nameIgnorePrefixSort': instance.nameIgnorePrefixSort,
      'type': instance.type,
      'books': instance.books,
      'addedAt': instance.addedAt,
      'totalDuration': instance.totalDuration,
    };
