// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Book extends DataClass implements Insertable<Book> {
  final String id;
  final String title;
  final String author;
  final int duration;
  final int savedPosition;
  Book(
      {@required this.id,
      @required this.title,
      @required this.author,
      @required this.duration,
      @required this.savedPosition});
  factory Book.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Book(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      duration:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}duration']),
      savedPosition: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}saved_position']),
    );
  }
  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      author: serializer.fromJson<String>(json['author']),
      duration: serializer.fromJson<int>(json['duration']),
      savedPosition: serializer.fromJson<int>(json['savedPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'author': serializer.toJson<String>(author),
      'duration': serializer.toJson<int>(duration),
      'savedPosition': serializer.toJson<int>(savedPosition),
    };
  }

  @override
  BooksCompanion createCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      savedPosition: savedPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(savedPosition),
    );
  }

  Book copyWith(
          {String id,
          String title,
          String author,
          int duration,
          int savedPosition}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        duration: duration ?? this.duration,
        savedPosition: savedPosition ?? this.savedPosition,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('author: $author, ')
          ..write('duration: $duration, ')
          ..write('savedPosition: $savedPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(author.hashCode,
              $mrjc(duration.hashCode, savedPosition.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.author == this.author &&
          other.duration == this.duration &&
          other.savedPosition == this.savedPosition);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> author;
  final Value<int> duration;
  final Value<int> savedPosition;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.author = const Value.absent(),
    this.duration = const Value.absent(),
    this.savedPosition = const Value.absent(),
  });
  BooksCompanion.insert({
    @required String id,
    @required String title,
    @required String author,
    @required int duration,
    @required int savedPosition,
  })  : id = Value(id),
        title = Value(title),
        author = Value(author),
        duration = Value(duration),
        savedPosition = Value(savedPosition);
  BooksCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> author,
      Value<int> duration,
      Value<int> savedPosition}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      duration: duration ?? this.duration,
      savedPosition: savedPosition ?? this.savedPosition,
    );
  }
}

class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  final GeneratedDatabase _db;
  final String _alias;
  $BooksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  GeneratedIntColumn _duration;
  @override
  GeneratedIntColumn get duration => _duration ??= _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _savedPositionMeta =
      const VerificationMeta('savedPosition');
  GeneratedIntColumn _savedPosition;
  @override
  GeneratedIntColumn get savedPosition =>
      _savedPosition ??= _constructSavedPosition();
  GeneratedIntColumn _constructSavedPosition() {
    return GeneratedIntColumn(
      'saved_position',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, author, duration, savedPosition];
  @override
  $BooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(BooksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.author.present) {
      context.handle(
          _authorMeta, author.isAcceptableValue(d.author.value, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (d.duration.present) {
      context.handle(_durationMeta,
          duration.isAcceptableValue(d.duration.value, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (d.savedPosition.present) {
      context.handle(
          _savedPositionMeta,
          savedPosition.isAcceptableValue(
              d.savedPosition.value, _savedPositionMeta));
    } else if (isInserting) {
      context.missing(_savedPositionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Book.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BooksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.author.present) {
      map['author'] = Variable<String, StringType>(d.author.value);
    }
    if (d.duration.present) {
      map['duration'] = Variable<int, IntType>(d.duration.value);
    }
    if (d.savedPosition.present) {
      map['saved_position'] = Variable<int, IntType>(d.savedPosition.value);
    }
    return map;
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  final String id;
  final String title;
  Author({@required this.id, @required this.title});
  factory Author.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Author(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
    );
  }
  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  @override
  AuthorsCompanion createCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  Author copyWith({String id, String title}) => Author(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Author && other.id == this.id && other.title == this.title);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<String> id;
  final Value<String> title;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  AuthorsCompanion.insert({
    @required String id,
    @required String title,
  })  : id = Value(id),
        title = Value(title);
  AuthorsCompanion copyWith({Value<String> id, Value<String> title}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  final GeneratedDatabase _db;
  final String _alias;
  $AuthorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $AuthorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'authors';
  @override
  final String actualTableName = 'authors';
  @override
  VerificationContext validateIntegrity(AuthorsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Author map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Author.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AuthorsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    return map;
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(_db, alias);
  }
}

class Track extends DataClass implements Insertable<Track> {
  final String id;
  final String title;
  final String book;
  final String cachedPath;
  final String fileUrl;
  final bool cached;
  final int duration;
  final int savedPosition;
  Track(
      {@required this.id,
      @required this.title,
      @required this.book,
      @required this.cachedPath,
      @required this.fileUrl,
      @required this.cached,
      @required this.duration,
      @required this.savedPosition});
  factory Track.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final intType = db.typeSystem.forDartType<int>();
    return Track(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      book: stringType.mapFromDatabaseResponse(data['${effectivePrefix}book']),
      cachedPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cached_path']),
      fileUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}file_url']),
      cached:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}cached']),
      duration:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}duration']),
      savedPosition: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}saved_position']),
    );
  }
  factory Track.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Track(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      book: serializer.fromJson<String>(json['book']),
      cachedPath: serializer.fromJson<String>(json['cachedPath']),
      fileUrl: serializer.fromJson<String>(json['fileUrl']),
      cached: serializer.fromJson<bool>(json['cached']),
      duration: serializer.fromJson<int>(json['duration']),
      savedPosition: serializer.fromJson<int>(json['savedPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'book': serializer.toJson<String>(book),
      'cachedPath': serializer.toJson<String>(cachedPath),
      'fileUrl': serializer.toJson<String>(fileUrl),
      'cached': serializer.toJson<bool>(cached),
      'duration': serializer.toJson<int>(duration),
      'savedPosition': serializer.toJson<int>(savedPosition),
    };
  }

  @override
  TracksCompanion createCompanion(bool nullToAbsent) {
    return TracksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      book: book == null && nullToAbsent ? const Value.absent() : Value(book),
      cachedPath: cachedPath == null && nullToAbsent
          ? const Value.absent()
          : Value(cachedPath),
      fileUrl: fileUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(fileUrl),
      cached:
          cached == null && nullToAbsent ? const Value.absent() : Value(cached),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      savedPosition: savedPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(savedPosition),
    );
  }

  Track copyWith(
          {String id,
          String title,
          String book,
          String cachedPath,
          String fileUrl,
          bool cached,
          int duration,
          int savedPosition}) =>
      Track(
        id: id ?? this.id,
        title: title ?? this.title,
        book: book ?? this.book,
        cachedPath: cachedPath ?? this.cachedPath,
        fileUrl: fileUrl ?? this.fileUrl,
        cached: cached ?? this.cached,
        duration: duration ?? this.duration,
        savedPosition: savedPosition ?? this.savedPosition,
      );
  @override
  String toString() {
    return (StringBuffer('Track(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('book: $book, ')
          ..write('cachedPath: $cachedPath, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('cached: $cached, ')
          ..write('duration: $duration, ')
          ..write('savedPosition: $savedPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              book.hashCode,
              $mrjc(
                  cachedPath.hashCode,
                  $mrjc(
                      fileUrl.hashCode,
                      $mrjc(
                          cached.hashCode,
                          $mrjc(
                              duration.hashCode, savedPosition.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Track &&
          other.id == this.id &&
          other.title == this.title &&
          other.book == this.book &&
          other.cachedPath == this.cachedPath &&
          other.fileUrl == this.fileUrl &&
          other.cached == this.cached &&
          other.duration == this.duration &&
          other.savedPosition == this.savedPosition);
}

class TracksCompanion extends UpdateCompanion<Track> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> book;
  final Value<String> cachedPath;
  final Value<String> fileUrl;
  final Value<bool> cached;
  final Value<int> duration;
  final Value<int> savedPosition;
  const TracksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.book = const Value.absent(),
    this.cachedPath = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.cached = const Value.absent(),
    this.duration = const Value.absent(),
    this.savedPosition = const Value.absent(),
  });
  TracksCompanion.insert({
    @required String id,
    @required String title,
    @required String book,
    @required String cachedPath,
    @required String fileUrl,
    @required bool cached,
    @required int duration,
    @required int savedPosition,
  })  : id = Value(id),
        title = Value(title),
        book = Value(book),
        cachedPath = Value(cachedPath),
        fileUrl = Value(fileUrl),
        cached = Value(cached),
        duration = Value(duration),
        savedPosition = Value(savedPosition);
  TracksCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> book,
      Value<String> cachedPath,
      Value<String> fileUrl,
      Value<bool> cached,
      Value<int> duration,
      Value<int> savedPosition}) {
    return TracksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      book: book ?? this.book,
      cachedPath: cachedPath ?? this.cachedPath,
      fileUrl: fileUrl ?? this.fileUrl,
      cached: cached ?? this.cached,
      duration: duration ?? this.duration,
      savedPosition: savedPosition ?? this.savedPosition,
    );
  }
}

class $TracksTable extends Tracks with TableInfo<$TracksTable, Track> {
  final GeneratedDatabase _db;
  final String _alias;
  $TracksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bookMeta = const VerificationMeta('book');
  GeneratedTextColumn _book;
  @override
  GeneratedTextColumn get book => _book ??= _constructBook();
  GeneratedTextColumn _constructBook() {
    return GeneratedTextColumn('book', $tableName, false,
        $customConstraints: 'REFERENCES books(id)');
  }

  final VerificationMeta _cachedPathMeta = const VerificationMeta('cachedPath');
  GeneratedTextColumn _cachedPath;
  @override
  GeneratedTextColumn get cachedPath => _cachedPath ??= _constructCachedPath();
  GeneratedTextColumn _constructCachedPath() {
    return GeneratedTextColumn(
      'cached_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _fileUrlMeta = const VerificationMeta('fileUrl');
  GeneratedTextColumn _fileUrl;
  @override
  GeneratedTextColumn get fileUrl => _fileUrl ??= _constructFileUrl();
  GeneratedTextColumn _constructFileUrl() {
    return GeneratedTextColumn(
      'file_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cachedMeta = const VerificationMeta('cached');
  GeneratedBoolColumn _cached;
  @override
  GeneratedBoolColumn get cached => _cached ??= _constructCached();
  GeneratedBoolColumn _constructCached() {
    return GeneratedBoolColumn(
      'cached',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  GeneratedIntColumn _duration;
  @override
  GeneratedIntColumn get duration => _duration ??= _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _savedPositionMeta =
      const VerificationMeta('savedPosition');
  GeneratedIntColumn _savedPosition;
  @override
  GeneratedIntColumn get savedPosition =>
      _savedPosition ??= _constructSavedPosition();
  GeneratedIntColumn _constructSavedPosition() {
    return GeneratedIntColumn(
      'saved_position',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, book, cachedPath, fileUrl, cached, duration, savedPosition];
  @override
  $TracksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tracks';
  @override
  final String actualTableName = 'tracks';
  @override
  VerificationContext validateIntegrity(TracksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (d.book.present) {
      context.handle(
          _bookMeta, book.isAcceptableValue(d.book.value, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (d.cachedPath.present) {
      context.handle(_cachedPathMeta,
          cachedPath.isAcceptableValue(d.cachedPath.value, _cachedPathMeta));
    } else if (isInserting) {
      context.missing(_cachedPathMeta);
    }
    if (d.fileUrl.present) {
      context.handle(_fileUrlMeta,
          fileUrl.isAcceptableValue(d.fileUrl.value, _fileUrlMeta));
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (d.cached.present) {
      context.handle(
          _cachedMeta, cached.isAcceptableValue(d.cached.value, _cachedMeta));
    } else if (isInserting) {
      context.missing(_cachedMeta);
    }
    if (d.duration.present) {
      context.handle(_durationMeta,
          duration.isAcceptableValue(d.duration.value, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (d.savedPosition.present) {
      context.handle(
          _savedPositionMeta,
          savedPosition.isAcceptableValue(
              d.savedPosition.value, _savedPositionMeta));
    } else if (isInserting) {
      context.missing(_savedPositionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Track map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Track.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TracksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.book.present) {
      map['book'] = Variable<String, StringType>(d.book.value);
    }
    if (d.cachedPath.present) {
      map['cached_path'] = Variable<String, StringType>(d.cachedPath.value);
    }
    if (d.fileUrl.present) {
      map['file_url'] = Variable<String, StringType>(d.fileUrl.value);
    }
    if (d.cached.present) {
      map['cached'] = Variable<bool, BoolType>(d.cached.value);
    }
    if (d.duration.present) {
      map['duration'] = Variable<int, IntType>(d.duration.value);
    }
    if (d.savedPosition.present) {
      map['saved_position'] = Variable<int, IntType>(d.savedPosition.value);
    }
    return map;
  }

  @override
  $TracksTable createAlias(String alias) {
    return $TracksTable(_db, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final String id;
  final String title;
  Collection({@required this.id, @required this.title});
  factory Collection.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Collection(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
    );
  }
  factory Collection.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  @override
  CollectionsCompanion createCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  Collection copyWith({String id, String title}) => Collection(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Collection && other.id == this.id && other.title == this.title);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<String> id;
  final Value<String> title;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  CollectionsCompanion.insert({
    @required String id,
    @required String title,
  })  : id = Value(id),
        title = Value(title);
  CollectionsCompanion copyWith({Value<String> id, Value<String> title}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  final GeneratedDatabase _db;
  final String _alias;
  $CollectionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $CollectionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'collections';
  @override
  final String actualTableName = 'collections';
  @override
  VerificationContext validateIntegrity(CollectionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Collection.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CollectionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    return map;
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(_db, alias);
  }
}

class CollectionMember extends DataClass
    implements Insertable<CollectionMember> {
  final String collection;
  final String book;
  CollectionMember({@required this.collection, @required this.book});
  factory CollectionMember.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return CollectionMember(
      collection: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}collection']),
      book: stringType.mapFromDatabaseResponse(data['${effectivePrefix}book']),
    );
  }
  factory CollectionMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CollectionMember(
      collection: serializer.fromJson<String>(json['collection']),
      book: serializer.fromJson<String>(json['book']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collection': serializer.toJson<String>(collection),
      'book': serializer.toJson<String>(book),
    };
  }

  @override
  CollectionMembersCompanion createCompanion(bool nullToAbsent) {
    return CollectionMembersCompanion(
      collection: collection == null && nullToAbsent
          ? const Value.absent()
          : Value(collection),
      book: book == null && nullToAbsent ? const Value.absent() : Value(book),
    );
  }

  CollectionMember copyWith({String collection, String book}) =>
      CollectionMember(
        collection: collection ?? this.collection,
        book: book ?? this.book,
      );
  @override
  String toString() {
    return (StringBuffer('CollectionMember(')
          ..write('collection: $collection, ')
          ..write('book: $book')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(collection.hashCode, book.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CollectionMember &&
          other.collection == this.collection &&
          other.book == this.book);
}

class CollectionMembersCompanion extends UpdateCompanion<CollectionMember> {
  final Value<String> collection;
  final Value<String> book;
  const CollectionMembersCompanion({
    this.collection = const Value.absent(),
    this.book = const Value.absent(),
  });
  CollectionMembersCompanion.insert({
    @required String collection,
    @required String book,
  })  : collection = Value(collection),
        book = Value(book);
  CollectionMembersCompanion copyWith(
      {Value<String> collection, Value<String> book}) {
    return CollectionMembersCompanion(
      collection: collection ?? this.collection,
      book: book ?? this.book,
    );
  }
}

class $CollectionMembersTable extends CollectionMembers
    with TableInfo<$CollectionMembersTable, CollectionMember> {
  final GeneratedDatabase _db;
  final String _alias;
  $CollectionMembersTable(this._db, [this._alias]);
  final VerificationMeta _collectionMeta = const VerificationMeta('collection');
  GeneratedTextColumn _collection;
  @override
  GeneratedTextColumn get collection => _collection ??= _constructCollection();
  GeneratedTextColumn _constructCollection() {
    return GeneratedTextColumn(
      'collection',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bookMeta = const VerificationMeta('book');
  GeneratedTextColumn _book;
  @override
  GeneratedTextColumn get book => _book ??= _constructBook();
  GeneratedTextColumn _constructBook() {
    return GeneratedTextColumn(
      'book',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [collection, book];
  @override
  $CollectionMembersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'collection_members';
  @override
  final String actualTableName = 'collection_members';
  @override
  VerificationContext validateIntegrity(CollectionMembersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.collection.present) {
      context.handle(_collectionMeta,
          collection.isAcceptableValue(d.collection.value, _collectionMeta));
    } else if (isInserting) {
      context.missing(_collectionMeta);
    }
    if (d.book.present) {
      context.handle(
          _bookMeta, book.isAcceptableValue(d.book.value, _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collection, book};
  @override
  CollectionMember map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CollectionMember.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CollectionMembersCompanion d) {
    final map = <String, Variable>{};
    if (d.collection.present) {
      map['collection'] = Variable<String, StringType>(d.collection.value);
    }
    if (d.book.present) {
      map['book'] = Variable<String, StringType>(d.book.value);
    }
    return map;
  }

  @override
  $CollectionMembersTable createAlias(String alias) {
    return $CollectionMembersTable(_db, alias);
  }
}

abstract class _$BookDatabase extends GeneratedDatabase {
  _$BookDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$BookDatabase.connect(DatabaseConnection c) : super.connect(c);
  $BooksTable _books;
  $BooksTable get books => _books ??= $BooksTable(this);
  $AuthorsTable _authors;
  $AuthorsTable get authors => _authors ??= $AuthorsTable(this);
  $TracksTable _tracks;
  $TracksTable get tracks => _tracks ??= $TracksTable(this);
  $CollectionsTable _collections;
  $CollectionsTable get collections => _collections ??= $CollectionsTable(this);
  $CollectionMembersTable _collectionMembers;
  $CollectionMembersTable get collectionMembers =>
      _collectionMembers ??= $CollectionMembersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [books, authors, tracks, collections, collectionMembers];
}
