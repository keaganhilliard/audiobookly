import 'package:audio_service/audio_service.dart';
import 'package:audiobookly/utils/utils.dart';

class Collection {
  final String id;
  final String name;
  final String? description;
  final String? artPath;
  final String? largeArtPath;

  Collection({
    required this.id,
    required this.name,
    this.description,
    this.artPath,
    this.largeArtPath,
  });

  factory Collection.fromMediaItem(MediaItem item) => Collection(
        id: item.id,
        name: item.title,
        description: item.displayDescription,
        artPath: item.artUri?.toString(),
      );

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
      'Collection(id: $id, name: $name, description: $description, artPath: $artPath)';
}
