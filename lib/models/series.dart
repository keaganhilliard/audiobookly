import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/models/book.dart';
import 'package:audiobookly/utils/utils.dart';

class Series {
  final String id;
  final String name;
  final String? description;
  final String artPath;
  final String? largeArtPath;
  final int numBooks;
  final List<Book>? books;

  Series({
    required this.id,
    required this.name,
    this.description,
    required this.artPath,
    required this.numBooks,
    this.largeArtPath,
    this.books,
  });

  Series copyWith({
    String? id,
    String? name,
    String? description,
    String? artPath,
    String? largeArtPath,
    int? numBooks,
    List<Book>? books,
  }) =>
      Series(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        artPath: artPath ?? this.artPath,
        largeArtPath: largeArtPath ?? this.largeArtPath,
        numBooks: numBooks ?? this.numBooks,
        books: books ?? this.books,
      );
  MediaItem toMediaItem() => MediaItem(
        id: id,
        title: name,
        artist: name,
        displayDescription: description,
        playable: true,
        artUri: artPath.uri,
        extras: <String, dynamic>{
          'largeThumbnail': largeArtPath,
        },
      );

  @override
  String toString() =>
      'Series(id: $id, name: $name, description: $description, artPath: $artPath, numBooks: $numBooks)';
}
