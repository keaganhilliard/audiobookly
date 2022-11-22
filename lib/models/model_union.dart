import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_union.freezed.dart';

@freezed
class ModelUnion with _$ModelUnion {
  const factory ModelUnion.book(Book value) = BookValue;
  const factory ModelUnion.author(Author value) = AuthorValue;
  const factory ModelUnion.series(Series value) = SeriesValue;
  const factory ModelUnion.collection(Collection value) = CollectionValue;
}
