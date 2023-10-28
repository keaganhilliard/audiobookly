import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_item_results.freezed.dart';
part 'abs_item_results.g.dart';

@freezed
class AbsItemResults with _$AbsItemResults {
  const factory AbsItemResults({
    required List<AbsAudiobook> results,
  }) = _AbsItemResults;

  factory AbsItemResults.fromJson(Map<String, dynamic> json) =>
      _$AbsItemResultsFromJson(json);
}
