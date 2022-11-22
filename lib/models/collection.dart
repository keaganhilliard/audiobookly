import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/utils/utils.dart';

class Collection {
  final String id;
  final String name;
  final String description;
  final String artPath;
  final String? largeArtPath;
  final int numBooks;

  Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.artPath,
    required this.numBooks,
    this.largeArtPath,
  });

  Collection copyWith({
    String? id,
    String? name,
    String? description,
    String? artPath,
    String? largeArtPath,
    int? numBooks,
  }) =>
      Collection(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        artPath: artPath ?? this.artPath,
        largeArtPath: largeArtPath ?? this.largeArtPath,
        numBooks: numBooks ?? this.numBooks,
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
      'Collection(id: $id, name: $name, description: $description, artPath: $artPath, numBooks: $numBooks)';
}
