import 'dart:convert';

import 'package:audiobookshelf/audiobookshelf.dart';

class AbsCollection {
  final String id;
  final String libraryId;
  final String name;
  final String? description;
  final String? cover;
  final String? coverFullPath;
  final List<AbsAudiobook> books;
  final int lastUpdate;
  final int createdAt;
  AbsCollection({
    required this.id,
    required this.libraryId,
    required this.name,
    required this.description,
    required this.cover,
    required this.coverFullPath,
    required this.books,
    required this.lastUpdate,
    required this.createdAt,
  });

  AbsCollection copyWith({
    String? id,
    String? libraryId,
    String? name,
    String? description,
    String? cover,
    String? coverFullPath,
    List<AbsAudiobook>? books,
    int? lastUpdate,
    int? createdAt,
  }) {
    return AbsCollection(
      id: id ?? this.id,
      libraryId: libraryId ?? this.libraryId,
      name: name ?? this.name,
      description: description ?? this.description,
      cover: cover ?? this.cover,
      coverFullPath: coverFullPath ?? this.coverFullPath,
      books: books ?? this.books,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'libraryId': libraryId,
      'name': name,
      'description': description,
      'cover': cover,
      'coverFullPath': coverFullPath,
      'books': books.map((x) => x.toJson()),
      'lastUpdate': lastUpdate,
      'createdAt': createdAt,
    };
  }

  factory AbsCollection.fromMap(Map<String, dynamic> map) {
    return AbsCollection(
      id: map['id'],
      libraryId: map['libraryId'],
      name: map['name'],
      description: map['description'],
      cover: map['cover'],
      coverFullPath: map['coverFullPath'],
      books: [for (final book in map['books']) AbsAudiobook.fromJson(book)],
      lastUpdate: map['lastUpdate']?.toInt(),
      createdAt: map['createdAt']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AbsCollection.fromJson(String source) =>
      AbsCollection.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AbsCollection(id: $id, libraryId: $libraryId, name: $name, description: $description, cover: $cover, coverFullPath: $coverFullPath, books: $books, lastUpdate: $lastUpdate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbsCollection &&
        other.id == id &&
        other.libraryId == libraryId &&
        other.name == name &&
        other.description == description &&
        other.cover == cover &&
        other.coverFullPath == coverFullPath &&
        other.lastUpdate == lastUpdate &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        libraryId.hashCode ^
        name.hashCode ^
        description.hashCode ^
        cover.hashCode ^
        coverFullPath.hashCode ^
        books.hashCode ^
        lastUpdate.hashCode ^
        createdAt.hashCode;
  }
}

class Cover {}

class CoverFullPath {}
