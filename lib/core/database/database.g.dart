// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Book extends DataClass implements Insertable<Book> {
  final String id;
  final String title;
  final String artUrl;
  final String author;
  final int savedPosition;
  Book(
      {@required this.id,
      @required this.title,
      @required this.artUrl,
      @required this.author,
      this.savedPosition});
  factory Book.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Book(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      artUrl:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}art_url']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      savedPosition: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}saved_position']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || artUrl != null) {
      map['art_url'] = Variable<String>(artUrl);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || savedPosition != null) {
      map['saved_position'] = Variable<int>(savedPosition);
    }
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      artUrl:
          artUrl == null && nullToAbsent ? const Value.absent() : Value(artUrl),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      savedPosition: savedPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(savedPosition),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artUrl: serializer.fromJson<String>(json['artUrl']),
      author: serializer.fromJson<String>(json['author']),
      savedPosition: serializer.fromJson<int>(json['savedPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artUrl': serializer.toJson<String>(artUrl),
      'author': serializer.toJson<String>(author),
      'savedPosition': serializer.toJson<int>(savedPosition),
    };
  }

  Book copyWith(
          {String id,
          String title,
          String artUrl,
          String author,
          int savedPosition}) =>
      Book(
        id: id ?? this.id,
        title: title ?? this.title,
        artUrl: artUrl ?? this.artUrl,
        author: author ?? this.author,
        savedPosition: savedPosition ?? this.savedPosition,
      );
  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artUrl: $artUrl, ')
          ..write('author: $author, ')
          ..write('savedPosition: $savedPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(artUrl.hashCode,
              $mrjc(author.hashCode, savedPosition.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.title == this.title &&
          other.artUrl == this.artUrl &&
          other.author == this.author &&
          other.savedPosition == this.savedPosition);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artUrl;
  final Value<String> author;
  final Value<int> savedPosition;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artUrl = const Value.absent(),
    this.author = const Value.absent(),
    this.savedPosition = const Value.absent(),
  });
  BooksCompanion.insert({
    @required String id,
    @required String title,
    @required String artUrl,
    @required String author,
    this.savedPosition = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        artUrl = Value(artUrl),
        author = Value(author);
  static Insertable<Book> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> artUrl,
    Expression<String> author,
    Expression<int> savedPosition,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artUrl != null) 'art_url': artUrl,
      if (author != null) 'author': author,
      if (savedPosition != null) 'saved_position': savedPosition,
    });
  }

  BooksCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> artUrl,
      Value<String> author,
      Value<int> savedPosition}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artUrl: artUrl ?? this.artUrl,
      author: author ?? this.author,
      savedPosition: savedPosition ?? this.savedPosition,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artUrl.present) {
      map['art_url'] = Variable<String>(artUrl.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (savedPosition.present) {
      map['saved_position'] = Variable<int>(savedPosition.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artUrl: $artUrl, ')
          ..write('author: $author, ')
          ..write('savedPosition: $savedPosition')
          ..write(')'))
        .toString();
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

  final VerificationMeta _artUrlMeta = const VerificationMeta('artUrl');
  GeneratedTextColumn _artUrl;
  @override
  GeneratedTextColumn get artUrl => _artUrl ??= _constructArtUrl();
  GeneratedTextColumn _constructArtUrl() {
    return GeneratedTextColumn(
      'art_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn('author', $tableName, false,
        $customConstraints: 'REFERENCES authors(id)');
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
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, artUrl, author, savedPosition];
  @override
  $BooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('art_url')) {
      context.handle(_artUrlMeta,
          artUrl.isAcceptableOrUnknown(data['art_url'], _artUrlMeta));
    } else if (isInserting) {
      context.missing(_artUrlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('saved_position')) {
      context.handle(
          _savedPositionMeta,
          savedPosition.isAcceptableOrUnknown(
              data['saved_position'], _savedPositionMeta));
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
  $BooksTable createAlias(String alias) {
    return $BooksTable(_db, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  final String id;
  final String title;
  final String artUrl;
  Author({@required this.id, @required this.title, @required this.artUrl});
  factory Author.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Author(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      artUrl:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}art_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || artUrl != null) {
      map['art_url'] = Variable<String>(artUrl);
    }
    return map;
  }

  AuthorsCompanion toCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      artUrl:
          artUrl == null && nullToAbsent ? const Value.absent() : Value(artUrl),
    );
  }

  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artUrl: serializer.fromJson<String>(json['artUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artUrl': serializer.toJson<String>(artUrl),
    };
  }

  Author copyWith({String id, String title, String artUrl}) => Author(
        id: id ?? this.id,
        title: title ?? this.title,
        artUrl: artUrl ?? this.artUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artUrl: $artUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(title.hashCode, artUrl.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Author &&
          other.id == this.id &&
          other.title == this.title &&
          other.artUrl == this.artUrl);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> artUrl;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artUrl = const Value.absent(),
  });
  AuthorsCompanion.insert({
    @required String id,
    @required String title,
    @required String artUrl,
  })  : id = Value(id),
        title = Value(title),
        artUrl = Value(artUrl);
  static Insertable<Author> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> artUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artUrl != null) 'art_url': artUrl,
    });
  }

  AuthorsCompanion copyWith(
      {Value<String> id, Value<String> title, Value<String> artUrl}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artUrl: artUrl ?? this.artUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artUrl.present) {
      map['art_url'] = Variable<String>(artUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artUrl: $artUrl')
          ..write(')'))
        .toString();
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

  final VerificationMeta _artUrlMeta = const VerificationMeta('artUrl');
  GeneratedTextColumn _artUrl;
  @override
  GeneratedTextColumn get artUrl => _artUrl ??= _constructArtUrl();
  GeneratedTextColumn _constructArtUrl() {
    return GeneratedTextColumn(
      'art_url',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, artUrl];
  @override
  $AuthorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'authors';
  @override
  final String actualTableName = 'authors';
  @override
  VerificationContext validateIntegrity(Insertable<Author> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('art_url')) {
      context.handle(_artUrlMeta,
          artUrl.isAcceptableOrUnknown(data['art_url'], _artUrlMeta));
    } else if (isInserting) {
      context.missing(_artUrlMeta);
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
  final int index;
  Track(
      {@required this.id,
      this.title,
      @required this.book,
      this.cachedPath,
      @required this.fileUrl,
      @required this.cached,
      @required this.duration,
      this.savedPosition,
      @required this.index});
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
      index: intType.mapFromDatabaseResponse(data['${effectivePrefix}index']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || book != null) {
      map['book'] = Variable<String>(book);
    }
    if (!nullToAbsent || cachedPath != null) {
      map['cached_path'] = Variable<String>(cachedPath);
    }
    if (!nullToAbsent || fileUrl != null) {
      map['file_url'] = Variable<String>(fileUrl);
    }
    if (!nullToAbsent || cached != null) {
      map['cached'] = Variable<bool>(cached);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || savedPosition != null) {
      map['saved_position'] = Variable<int>(savedPosition);
    }
    if (!nullToAbsent || index != null) {
      map['index'] = Variable<int>(index);
    }
    return map;
  }

  TracksCompanion toCompanion(bool nullToAbsent) {
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
      index:
          index == null && nullToAbsent ? const Value.absent() : Value(index),
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
      index: serializer.fromJson<int>(json['index']),
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
      'index': serializer.toJson<int>(index),
    };
  }

  Track copyWith(
          {String id,
          String title,
          String book,
          String cachedPath,
          String fileUrl,
          bool cached,
          int duration,
          int savedPosition,
          int index}) =>
      Track(
        id: id ?? this.id,
        title: title ?? this.title,
        book: book ?? this.book,
        cachedPath: cachedPath ?? this.cachedPath,
        fileUrl: fileUrl ?? this.fileUrl,
        cached: cached ?? this.cached,
        duration: duration ?? this.duration,
        savedPosition: savedPosition ?? this.savedPosition,
        index: index ?? this.index,
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
          ..write('savedPosition: $savedPosition, ')
          ..write('index: $index')
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
                              duration.hashCode,
                              $mrjc(savedPosition.hashCode,
                                  index.hashCode)))))))));
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
          other.savedPosition == this.savedPosition &&
          other.index == this.index);
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
  final Value<int> index;
  const TracksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.book = const Value.absent(),
    this.cachedPath = const Value.absent(),
    this.fileUrl = const Value.absent(),
    this.cached = const Value.absent(),
    this.duration = const Value.absent(),
    this.savedPosition = const Value.absent(),
    this.index = const Value.absent(),
  });
  TracksCompanion.insert({
    @required String id,
    this.title = const Value.absent(),
    @required String book,
    this.cachedPath = const Value.absent(),
    @required String fileUrl,
    this.cached = const Value.absent(),
    @required int duration,
    this.savedPosition = const Value.absent(),
    @required int index,
  })  : id = Value(id),
        book = Value(book),
        fileUrl = Value(fileUrl),
        duration = Value(duration),
        index = Value(index);
  static Insertable<Track> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<String> book,
    Expression<String> cachedPath,
    Expression<String> fileUrl,
    Expression<bool> cached,
    Expression<int> duration,
    Expression<int> savedPosition,
    Expression<int> index,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (book != null) 'book': book,
      if (cachedPath != null) 'cached_path': cachedPath,
      if (fileUrl != null) 'file_url': fileUrl,
      if (cached != null) 'cached': cached,
      if (duration != null) 'duration': duration,
      if (savedPosition != null) 'saved_position': savedPosition,
      if (index != null) 'index': index,
    });
  }

  TracksCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<String> book,
      Value<String> cachedPath,
      Value<String> fileUrl,
      Value<bool> cached,
      Value<int> duration,
      Value<int> savedPosition,
      Value<int> index}) {
    return TracksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      book: book ?? this.book,
      cachedPath: cachedPath ?? this.cachedPath,
      fileUrl: fileUrl ?? this.fileUrl,
      cached: cached ?? this.cached,
      duration: duration ?? this.duration,
      savedPosition: savedPosition ?? this.savedPosition,
      index: index ?? this.index,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (book.present) {
      map['book'] = Variable<String>(book.value);
    }
    if (cachedPath.present) {
      map['cached_path'] = Variable<String>(cachedPath.value);
    }
    if (fileUrl.present) {
      map['file_url'] = Variable<String>(fileUrl.value);
    }
    if (cached.present) {
      map['cached'] = Variable<bool>(cached.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (savedPosition.present) {
      map['saved_position'] = Variable<int>(savedPosition.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TracksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('book: $book, ')
          ..write('cachedPath: $cachedPath, ')
          ..write('fileUrl: $fileUrl, ')
          ..write('cached: $cached, ')
          ..write('duration: $duration, ')
          ..write('savedPosition: $savedPosition, ')
          ..write('index: $index')
          ..write(')'))
        .toString();
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
      true,
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
      true,
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
    return GeneratedBoolColumn('cached', $tableName, false,
        defaultValue: const Constant(false));
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
      true,
    );
  }

  final VerificationMeta _indexMeta = const VerificationMeta('index');
  GeneratedIntColumn _index;
  @override
  GeneratedIntColumn get index => _index ??= _constructIndex();
  GeneratedIntColumn _constructIndex() {
    return GeneratedIntColumn(
      'index',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        book,
        cachedPath,
        fileUrl,
        cached,
        duration,
        savedPosition,
        index
      ];
  @override
  $TracksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tracks';
  @override
  final String actualTableName = 'tracks';
  @override
  VerificationContext validateIntegrity(Insertable<Track> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book'], _bookMeta));
    } else if (isInserting) {
      context.missing(_bookMeta);
    }
    if (data.containsKey('cached_path')) {
      context.handle(
          _cachedPathMeta,
          cachedPath.isAcceptableOrUnknown(
              data['cached_path'], _cachedPathMeta));
    }
    if (data.containsKey('file_url')) {
      context.handle(_fileUrlMeta,
          fileUrl.isAcceptableOrUnknown(data['file_url'], _fileUrlMeta));
    } else if (isInserting) {
      context.missing(_fileUrlMeta);
    }
    if (data.containsKey('cached')) {
      context.handle(_cachedMeta,
          cached.isAcceptableOrUnknown(data['cached'], _cachedMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration'], _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('saved_position')) {
      context.handle(
          _savedPositionMeta,
          savedPosition.isAcceptableOrUnknown(
              data['saved_position'], _savedPositionMeta));
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index'], _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
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
  static Insertable<Collection> custom({
    Expression<String> id,
    Expression<String> title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  CollectionsCompanion copyWith({Value<String> id, Value<String> title}) {
    return CollectionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
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
  VerificationContext validateIntegrity(Insertable<Collection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || collection != null) {
      map['collection'] = Variable<String>(collection);
    }
    if (!nullToAbsent || book != null) {
      map['book'] = Variable<String>(book);
    }
    return map;
  }

  CollectionMembersCompanion toCompanion(bool nullToAbsent) {
    return CollectionMembersCompanion(
      collection: collection == null && nullToAbsent
          ? const Value.absent()
          : Value(collection),
      book: book == null && nullToAbsent ? const Value.absent() : Value(book),
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
  static Insertable<CollectionMember> custom({
    Expression<String> collection,
    Expression<String> book,
  }) {
    return RawValuesInsertable({
      if (collection != null) 'collection': collection,
      if (book != null) 'book': book,
    });
  }

  CollectionMembersCompanion copyWith(
      {Value<String> collection, Value<String> book}) {
    return CollectionMembersCompanion(
      collection: collection ?? this.collection,
      book: book ?? this.book,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collection.present) {
      map['collection'] = Variable<String>(collection.value);
    }
    if (book.present) {
      map['book'] = Variable<String>(book.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionMembersCompanion(')
          ..write('collection: $collection, ')
          ..write('book: $book')
          ..write(')'))
        .toString();
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
    return GeneratedTextColumn('collection', $tableName, false,
        $customConstraints: 'REFERENCES collections(id)');
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
  VerificationContext validateIntegrity(Insertable<CollectionMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection')) {
      context.handle(
          _collectionMeta,
          collection.isAcceptableOrUnknown(
              data['collection'], _collectionMeta));
    } else if (isInserting) {
      context.missing(_collectionMeta);
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book'], _bookMeta));
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
