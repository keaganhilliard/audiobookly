import 'package:audiobookshelf/src/abs_track.dart';

import 'abs_utils.dart';

class AbsAudiobook {
  AbsAudiobook({
    this.id,
    this.ino,
    this.libraryId,
    this.folderId,
    this.book,
    this.tags,
    this.path,
    this.fullPath,
    this.addedAt,
    this.lastUpdate,
    this.duration,
    this.size,
    this.ebooks,
    this.numEbooks,
    this.numTracks,
    this.chapters,
    this.tracks,
    this.isMissing,
    this.isInvalid,
    this.hasMissingParts,
    this.hasInvalidParts,
  });

  String? id;
  String? ino;
  String? libraryId;
  String? folderId;
  Book? book;
  List<String>? tags;
  String? path;
  String? fullPath;
  DateTime? addedAt;
  DateTime? lastUpdate;
  Duration? duration;
  int? size;
  List<Ebook>? ebooks;
  int? numEbooks;
  int? numTracks;
  List<Chapter>? chapters;
  List<AbsTrack>? tracks;
  bool? isMissing;
  bool? isInvalid;
  int? hasMissingParts;
  int? hasInvalidParts;

  factory AbsAudiobook.fromJson(Map<String, dynamic> json) => AbsAudiobook(
        id: json["id"],
        ino: json["ino"],
        libraryId: json["libraryId"],
        folderId: json["folderId"],
        book: Book.fromJson(json["book"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        path: json["path"],
        fullPath: json["fullPath"],
        addedAt: AbsUtils.parseDateTime(json["addedAt"]),
        lastUpdate: AbsUtils.parseDateTime(json["lastUpdate"]),
        duration: AbsUtils.parseDuration(json["duration"]?.toDouble()),
        size: json["size"],
        ebooks: List<Ebook>.from(
            json["ebooks"]?.map((x) => Ebook.fromJson(x)) ?? []),
        numEbooks: json["numEbooks"],
        numTracks: json["numTracks"],
        chapters: [
          for (final chapter in json['chapters']) Chapter.fromJson(chapter)
        ],
        tracks: json['tracks'] == null
            ? []
            : [for (final t in json['tracks']) AbsTrack.fromMap(t)],
        isMissing: json["isMissing"],
        isInvalid: json["isInvalid"],
        hasMissingParts: json["hasMissingParts"],
        hasInvalidParts: json["hasInvalidParts"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ino": ino,
        "libraryId": libraryId,
        "folderId": folderId,
        "book": book?.toJson(),
        "tags": List<dynamic>.from(tags?.map((x) => x) ?? []),
        "path": path,
        "fullPath": fullPath,
        "addedAt": addedAt?.millisecondsSinceEpoch,
        "lastUpdate": lastUpdate?.millisecondsSinceEpoch,
        "duration": duration?.inMilliseconds,
        "size": size,
        "ebooks": List<dynamic>.from(ebooks?.map((x) => x.toJson()) ?? []),
        "numEbooks": numEbooks,
        "numTracks": numTracks,
        "chapters": List<dynamic>.from(chapters?.map((x) => x.toJson()) ?? []),
        "tracks": List<dynamic>.from(tracks?.map((x) => x.toMap()) ?? []),
        "isMissing": isMissing,
        "isInvalid": isInvalid,
        "hasMissingParts": hasMissingParts,
        "hasInvalidParts": hasInvalidParts,
      };
}

class Book {
  Book({
    this.title,
    this.subtitle,
    this.author,
    this.authorFl,
    this.authorLf,
    this.narrator,
    this.series,
    this.volumeNumber,
    this.publishYear,
    this.publisher,
    this.description,
    this.isbn,
    this.language,
    this.cover,
    this.coverFullPath,
    this.genres,
    this.lastUpdate,
    this.lastCoverSearch,
    this.lastCoverSearchTitle,
    this.lastCoverSearchAuthor,
  });

  String? title;
  String? subtitle;
  String? author;
  String? authorFl;
  String? authorLf;
  String? narrator;
  String? series;
  String? volumeNumber;
  String? publishYear;
  String? publisher;
  String? description;
  String? isbn;
  String? language;
  String? cover;
  String? coverFullPath;
  List<String>? genres;
  int? lastUpdate;
  dynamic lastCoverSearch;
  dynamic lastCoverSearchTitle;
  dynamic lastCoverSearchAuthor;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        authorFl: json["authorFL"],
        authorLf: json["authorLF"],
        narrator: json["narrator"],
        series: json["series"],
        volumeNumber: json["volumeNumber"],
        publishYear: json["publishYear"],
        publisher: json["publisher"],
        description: json["description"],
        isbn: json["isbn"],
        language: json["language"],
        cover: json["cover"],
        coverFullPath: json["coverFullPath"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        lastUpdate: json["lastUpdate"],
        lastCoverSearch: json["lastCoverSearch"],
        lastCoverSearchTitle: json["lastCoverSearchTitle"],
        lastCoverSearchAuthor: json["lastCoverSearchAuthor"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "authorFL": authorFl,
        "authorLF": authorLf,
        "narrator": narrator,
        "series": series,
        "volumeNumber": volumeNumber,
        "publishYear": publishYear,
        "publisher": publisher,
        "description": description,
        "isbn": isbn,
        "language": language,
        "cover": cover,
        "coverFullPath": coverFullPath,
        "genres": List<dynamic>.from(genres?.map((x) => x) ?? []),
        "lastUpdate": lastUpdate,
        "lastCoverSearch": lastCoverSearch,
        "lastCoverSearchTitle": lastCoverSearchTitle,
        "lastCoverSearchAuthor": lastCoverSearchAuthor,
      };
}

class Chapter {
  Chapter({
    required this.id,
    required this.start,
    required this.end,
    required this.title,
  });

  int id;
  double start;
  double end;
  String title;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        start: json["start"].toDouble(),
        end: json["end"].toDouble(),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "title": title,
      };
}

class Ebook {
  Ebook({
    required this.ino,
    required this.filetype,
    required this.filename,
    required this.ext,
    required this.path,
    required this.fullPath,
    required this.addedAt,
  });

  String ino;
  String filetype;
  String filename;
  String ext;
  String path;
  String fullPath;
  int addedAt;

  factory Ebook.fromJson(Map<String, dynamic> json) => Ebook(
        ino: json["ino"],
        filetype: json["filetype"],
        filename: json["filename"],
        ext: json["ext"],
        path: json["path"],
        fullPath: json["fullPath"],
        addedAt: json["addedAt"],
      );

  Map<String, dynamic> toJson() => {
        "ino": ino,
        "filetype": filetype,
        "filename": filename,
        "ext": ext,
        "path": path,
        "fullPath": fullPath,
        "addedAt": addedAt,
      };
}
