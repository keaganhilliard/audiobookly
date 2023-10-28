// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_item_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AbsItemResults _$$_AbsItemResultsFromJson(Map<String, dynamic> json) =>
    _$_AbsItemResults(
      results: (json['results'] as List<dynamic>)
          .map((e) => AbsAudiobook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AbsItemResultsToJson(_$_AbsItemResults instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
