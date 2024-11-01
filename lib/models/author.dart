import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/models/series.dart';
import 'package:audiobookly/utils/utils.dart';

class Author {
  final String id;
  final String name;
  final String? description;
  final String? artPath;
  final String? largeArtPath;
  final int? numBooks;
  final List<Book>? books;
  final List<Series>? series;

  Author({
    required this.id,
    required this.name,
    this.description,
    this.artPath,
    this.numBooks,
    this.largeArtPath,
    this.books,
    this.series,
  });

  Author copyWith({
    String? id,
    String? name,
    String? description,
    String? artPath,
    String? largeArtPath,
    int? numBooks,
    List<Book>? books,
    List<Series>? series,
  }) =>
      Author(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        artPath: artPath ?? this.artPath,
        largeArtPath: largeArtPath ?? this.largeArtPath,
        numBooks: numBooks ?? this.numBooks,
        books: books ?? this.books,
        series: series ?? this.series,
      );
  MediaItem toMediaItem() => MediaItem(
        id: id,
        title: name,
        artist: name,
        displayDescription: description,
        playable: true,
        artUri: artPath?.uri,
        extras: <String, dynamic>{
          'largeThumbnail': largeArtPath,
        },
      );

  @override
  String toString() =>
      'Author(id: $id, name: $name, description: $description, artPath: $artPath, numBooks: $numBooks)';
}
