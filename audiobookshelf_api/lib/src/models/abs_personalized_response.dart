import 'package:audiobookshelf/audiobookshelf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'abs_personalized_response.freezed.dart';
part 'abs_personalized_response.g.dart';

@Freezed(unionKey: 'type', fallbackUnion: 'unknown')
class AbsPersonalizedResponse with _$AbsPersonalizedResponse {
  const factory AbsPersonalizedResponse.book({
    required String id,
    required String label,
    required String labelStringKey,
    required String type,
    required List<AbsAudiobookMinified> entities,
    required String category,
  }) = AbsPersonalizedResponseBook;

  const factory AbsPersonalizedResponse.authors({
    required String id,
    required String label,
    required String labelStringKey,
    required String type,
    required List<Author> entities,
    required String category,
  }) = AbsPersonalizedResponseAuthor;

  // const factory AbsPersonalizedResponse.series({
  //   required String id,
  //   required String label,
  //   required String labelStringKey,
  //   required String type,
  //   required List<AbsSeries> entities,
  //   required String category,
  // }) = AbsPersonalizedResponseSeries;

  const factory AbsPersonalizedResponse.unknown({
    required String id,
    required String label,
    required String labelStringKey,
    required String type,
    required List<Map<String, dynamic>> entities,
    required String category,
  }) = AbsPersonalizedResponseUnknown;

  factory AbsPersonalizedResponse.fromJson(Map<String, dynamic> json) =>
      _$AbsPersonalizedResponseFromJson(json);
}

// Entities _toEntities(dynamic entities) {
//   return Entities.unknown(entities);
// }

// @freezed
// class Entities with _$Entities {
//   const factory Entities.book(List<AbsAudiobookMinified> value) = BookValue;
//   const factory Entities.author(List<Author> value) = AuthorValue;
//   const factory Entities.series(List<AbsSeries> value) = SeriesValue;
//   const factory Entities.unknown(List<Map<String, dynamic>> entities) =
//       UnkonwnValue;

//   factory Entities.fromJson(Map<String, dynamic> json) =>
//       _$EntitiesFromJson(json);
// }
