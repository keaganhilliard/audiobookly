// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsAuthorImpl _$$AbsAuthorImplFromJson(Map<String, dynamic> json) =>
    _$AbsAuthorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      addedAt: (json['addedAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      numBooks: (json['numBooks'] as num?)?.toInt(),
      libraryId: json['libraryId'] as String?,
      asin: json['asin'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      libraryItems: (json['libraryItems'] as List<dynamic>?)
          ?.map((e) => AbsAudiobookMinified.fromJson(e as Map<String, dynamic>))
          .toList(),
      series: (json['series'] as List<dynamic>?)
          ?.map((e) => AuthorSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsAuthorImplToJson(_$AbsAuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'numBooks': instance.numBooks,
      'libraryId': instance.libraryId,
      'asin': instance.asin,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'libraryItems': instance.libraryItems,
      'series': instance.series,
    };

_$SeriesImpl _$$SeriesImplFromJson(Map<String, dynamic> json) => _$SeriesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => AbsAudiobookMinified.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeriesImplToJson(_$SeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
    };
