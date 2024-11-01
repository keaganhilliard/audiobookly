import 'package:audiobookshelf/audiobookshelf.dart' hide Series;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_author.freezed.dart';
part 'abs_author.g.dart';

@freezed
class AbsAuthor with _$AbsAuthor {
  const factory AbsAuthor({
    required String id,
    required String name,
    int? addedAt,
    int? updatedAt,
    int? numBooks,
    String? libraryId,
    String? asin,
    String? description,
    String? imagePath,
    List<AbsAudiobookMinified>? libraryItems,
    List<AuthorSeries>? series,
  }) = _AbsAuthor;

  factory AbsAuthor.fromJson(Map<String, dynamic> json) =>
      _$AbsAuthorFromJson(json);
}

@freezed
class AuthorSeries with _$AuthorSeries {
  const factory AuthorSeries({
    required String id,
    required String name,
    List<AbsAudiobookMinified>? items,
  }) = _Series;
  factory AuthorSeries.fromJson(Map<String, dynamic> json) =>
      _$AuthorSeriesFromJson(json);
}
