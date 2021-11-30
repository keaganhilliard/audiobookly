import 'dart:convert';

import 'package:audiobookshelf/audiobookshelf.dart';

class AbsSeriesSearchResult {
  final String series;
  final List<AbsAudiobook> audiobooks;
  AbsSeriesSearchResult({
    required this.series,
    required this.audiobooks,
  });

  AbsSeriesSearchResult copyWith({
    String? series,
    List<AbsAudiobook>? audiobooks,
  }) {
    return AbsSeriesSearchResult(
      series: series ?? this.series,
      audiobooks: audiobooks ?? this.audiobooks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'series': series,
      'audiobooks': audiobooks,
    };
  }

  factory AbsSeriesSearchResult.fromMap(Map<String, dynamic> map) {
    return AbsSeriesSearchResult(
      series: map['series'],
      audiobooks: [for (final a in map['audiobooks']) AbsAudiobook.fromJson(a)],
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsSeriesSearchResult.fromJson(String source) =>
      AbsSeriesSearchResult.fromMap(json.decode(source));

  @override
  String toString() =>
      'AbsSeriesSearchResult(series: $series, audiobooks: $audiobooks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbsSeriesSearchResult && other.series == series;
  }

  @override
  int get hashCode => series.hashCode ^ audiobooks.hashCode;
}
