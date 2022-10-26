import 'dart:convert';

import 'package:audiobookshelf/audiobookshelf.dart';

class AbsSeriesSearchResult {
  final Series series;
  final List<AbsAudiobook> books;
  AbsSeriesSearchResult({
    required this.series,
    required this.books,
  });

  AbsSeriesSearchResult copyWith({
    Series? series,
    List<AbsAudiobook>? books,
  }) {
    return AbsSeriesSearchResult(
      series: series ?? this.series,
      books: books ?? this.books,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'series': series,
      'books': books,
    };
  }

  factory AbsSeriesSearchResult.fromMap(Map<String, dynamic> map) {
    return AbsSeriesSearchResult(
      series: Series.fromJson(map['series']),
      books: [for (final a in map['books']) AbsAudiobook.fromJson(a)],
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsSeriesSearchResult.fromJson(String source) =>
      AbsSeriesSearchResult.fromMap(json.decode(source));

  @override
  String toString() => 'AbsSeriesSearchResult(series: $series, books: $books)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbsSeriesSearchResult && other.series == series;
  }

  @override
  int get hashCode => series.hashCode ^ books.hashCode;
}
