import 'package:audiobookly/models/author.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/models/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:audio_service/audio_service.dart';

part 'model_union.freezed.dart';

@freezed
sealed class ModelUnion with _$ModelUnion {
  const factory ModelUnion.book(Book value) = BookValue;
  const factory ModelUnion.author(Author value) = AuthorValue;
  const factory ModelUnion.series(Series value) = SeriesValue;
  const factory ModelUnion.collection(Collection value) = CollectionValue;
}

extension ToMediaItem on ModelUnion {
  MediaItem toMediaItem() {
    return switch (value) {
      Book() => toMediaItem(),
      Author() => toMediaItem(),
      Series() => toMediaItem(),
      Collection() => toMediaItem(),
      _ => throw UnimplementedError()
    };
  }
}
