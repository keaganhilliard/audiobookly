import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'abs_series.freezed.dart';
part 'abs_series.g.dart';

AbsSeries absSeriesFromJson(String str) => AbsSeries.fromJson(json.decode(str));

String absSeriesToJson(AbsSeries data) => json.encode(data.toJson());

@freezed
abstract class AbsSeries with _$AbsSeries {
  const factory AbsSeries({
    required String id,
    required String name,
    required String nameIgnorePrefix,
    required String nameIgnorePrefixSort,
    required String type,
    required List<AbsAudiobookMinified> books,
    required int addedAt,
    required double totalDuration,
  }) = _AbsSeries;

  factory AbsSeries.fromJson(Map<String, dynamic> json) =>
      _$AbsSeriesFromJson(json);
}
