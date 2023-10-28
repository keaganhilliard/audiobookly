// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abs_item_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsItemResultsImpl _$$AbsItemResultsImplFromJson(Map<String, dynamic> json) =>
    _$AbsItemResultsImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => AbsAudiobook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AbsItemResultsImplToJson(
        _$AbsItemResultsImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
