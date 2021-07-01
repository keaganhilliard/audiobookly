// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookDao? _bookDaoInstance;

  TrackDao? _trackDaoInstance;

  DownloadTaskDao? _downloadTaskDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `books` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `author` TEXT NOT NULL, `narrator` TEXT NOT NULL, `description` TEXT NOT NULL, `artPath` TEXT NOT NULL, `duration` INTEGER NOT NULL, `lastPlayedPosition` INTEGER NOT NULL, `downloadRequested` INTEGER NOT NULL, `downloadCompleted` INTEGER NOT NULL, `downloadFailed` INTEGER NOT NULL, `read` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tracks` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `duration` INTEGER NOT NULL, `downloadProgress` REAL NOT NULL, `isDownloaded` INTEGER NOT NULL, `downloadPath` TEXT NOT NULL, `bookId` TEXT NOT NULL, FOREIGN KEY (`bookId`) REFERENCES `books` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `downloads` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `progress` REAL NOT NULL, `status` TEXT NOT NULL, `path` TEXT NOT NULL, `url` TEXT NOT NULL, `trackId` INTEGER NOT NULL, FOREIGN KEY (`trackId`) REFERENCES `tracks` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }

  @override
  TrackDao get trackDao {
    return _trackDaoInstance ??= _$TrackDao(database, changeListener);
  }

  @override
  DownloadTaskDao get downloadTaskDao {
    return _downloadTaskDaoInstance ??=
        _$DownloadTaskDao(database, changeListener);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bookInsertionAdapter = InsertionAdapter(
            database,
            'books',
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'author': item.author,
                  'narrator': item.narrator,
                  'description': item.description,
                  'artPath': item.artPath,
                  'duration': _durationConverter.encode(item.duration),
                  'lastPlayedPosition':
                      _durationConverter.encode(item.lastPlayedPosition),
                  'downloadRequested': item.downloadRequested ? 1 : 0,
                  'downloadCompleted': item.downloadCompleted ? 1 : 0,
                  'downloadFailed': item.downloadFailed ? 1 : 0,
                  'read': item.read ? 1 : 0
                },
            changeListener),
        _bookUpdateAdapter = UpdateAdapter(
            database,
            'books',
            ['id'],
            (Book item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'author': item.author,
                  'narrator': item.narrator,
                  'description': item.description,
                  'artPath': item.artPath,
                  'duration': _durationConverter.encode(item.duration),
                  'lastPlayedPosition':
                      _durationConverter.encode(item.lastPlayedPosition),
                  'downloadRequested': item.downloadRequested ? 1 : 0,
                  'downloadCompleted': item.downloadCompleted ? 1 : 0,
                  'downloadFailed': item.downloadFailed ? 1 : 0,
                  'read': item.read ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Book> _bookInsertionAdapter;

  final UpdateAdapter<Book> _bookUpdateAdapter;

  @override
  Stream<List<Book>> findAllBooks() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM books ORDER BY author, title',
        mapper: (Map<String, Object?> row) => Book(
            row['id'] as String,
            row['title'] as String,
            row['author'] as String,
            row['narrator'] as String,
            row['description'] as String,
            row['artPath'] as String,
            _durationConverter.decode(row['duration'] as int),
            _durationConverter.decode(row['lastPlayedPosition'] as int),
            (row['downloadRequested'] as int) != 0,
            (row['downloadCompleted'] as int) != 0,
            (row['downloadFailed'] as int) != 0,
            (row['read'] as int) != 0),
        queryableName: 'books',
        isView: false);
  }

  @override
  Stream<List<Book>> getAllDownloadedBooks() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM books WHERE downloadCompleted = 1 ORDER BY author, title',
        mapper: (Map<String, Object?> row) => Book(
            row['id'] as String,
            row['title'] as String,
            row['author'] as String,
            row['narrator'] as String,
            row['description'] as String,
            row['artPath'] as String,
            _durationConverter.decode(row['duration'] as int),
            _durationConverter.decode(row['lastPlayedPosition'] as int),
            (row['downloadRequested'] as int) != 0,
            (row['downloadCompleted'] as int) != 0,
            (row['downloadFailed'] as int) != 0,
            (row['read'] as int) != 0),
        queryableName: 'books',
        isView: false);
  }

  @override
  Stream<Book?> findBookById(String id) {
    return _queryAdapter.queryStream('SELECT * FROM books WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Book(
            row['id'] as String,
            row['title'] as String,
            row['author'] as String,
            row['narrator'] as String,
            row['description'] as String,
            row['artPath'] as String,
            _durationConverter.decode(row['duration'] as int),
            _durationConverter.decode(row['lastPlayedPosition'] as int),
            (row['downloadRequested'] as int) != 0,
            (row['downloadCompleted'] as int) != 0,
            (row['downloadFailed'] as int) != 0,
            (row['read'] as int) != 0),
        arguments: [id],
        queryableName: 'books',
        isView: false);
  }

  @override
  Future<void> insertBook(Book book) async {
    await _bookInsertionAdapter.insert(book, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateBook(Book book) async {
    await _bookUpdateAdapter.update(book, OnConflictStrategy.abort);
  }
}

class _$TrackDao extends TrackDao {
  _$TrackDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _trackInsertionAdapter = InsertionAdapter(
            database,
            'tracks',
            (Track item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'duration': _durationConverter.encode(item.duration),
                  'downloadProgress': item.downloadProgress,
                  'isDownloaded': item.isDownloaded ? 1 : 0,
                  'downloadPath': item.downloadPath,
                  'bookId': item.bookId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Track> _trackInsertionAdapter;

  @override
  Stream<List<Track>> findAllTracks() {
    return _queryAdapter.queryListStream('SELECT * FROM tracks',
        mapper: (Map<String, Object?> row) => Track(
            row['id'] as String,
            row['title'] as String,
            _durationConverter.decode(row['duration'] as int),
            row['downloadProgress'] as double,
            (row['isDownloaded'] as int) != 0,
            row['downloadPath'] as String,
            row['bookId'] as String),
        queryableName: 'tracks',
        isView: false);
  }

  @override
  Stream<Track?> findTrackById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM tracks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Track(
            row['id'] as String,
            row['title'] as String,
            _durationConverter.decode(row['duration'] as int),
            row['downloadProgress'] as double,
            (row['isDownloaded'] as int) != 0,
            row['downloadPath'] as String,
            row['bookId'] as String),
        arguments: [id],
        queryableName: 'tracks',
        isView: false);
  }

  @override
  Future<List<Track>> findTracksForBookId(String bookId) async {
    return _queryAdapter.queryList('SELECT * FROM tracks WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) => Track(
            row['id'] as String,
            row['title'] as String,
            _durationConverter.decode(row['duration'] as int),
            row['downloadProgress'] as double,
            (row['isDownloaded'] as int) != 0,
            row['downloadPath'] as String,
            row['bookId'] as String),
        arguments: [bookId]);
  }

  @override
  Stream<List<Track>> streamTracksForBookId(String bookId) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM tracks WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) => Track(
            row['id'] as String,
            row['title'] as String,
            _durationConverter.decode(row['duration'] as int),
            row['downloadProgress'] as double,
            (row['isDownloaded'] as int) != 0,
            row['downloadPath'] as String,
            row['bookId'] as String),
        arguments: [bookId],
        queryableName: 'tracks',
        isView: false);
  }

  @override
  Future<void> insertTrack(Track track) async {
    await _trackInsertionAdapter.insert(track, OnConflictStrategy.replace);
  }
}

class _$DownloadTaskDao extends DownloadTaskDao {
  _$DownloadTaskDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _downloadTaskInsertionAdapter = InsertionAdapter(
            database,
            'downloads',
            (DownloadTask item) => <String, Object?>{
                  'id': item.id,
                  'progress': item.progress,
                  'status': item.status,
                  'path': item.path,
                  'url': item.url,
                  'trackId': item.trackId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DownloadTask> _downloadTaskInsertionAdapter;

  @override
  Stream<List<DownloadTask>> findAllDownloads() {
    return _queryAdapter.queryListStream('SELECT * FROM downloads',
        mapper: (Map<String, Object?> row) => DownloadTask(
            row['id'] as int,
            row['progress'] as double,
            row['status'] as String,
            row['path'] as String,
            row['url'] as String,
            row['trackId'] as int),
        queryableName: 'downloads',
        isView: false);
  }

  @override
  Stream<DownloadTask?> findDownloadById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM downloads WHERE id = ?1',
        mapper: (Map<String, Object?> row) => DownloadTask(
            row['id'] as int,
            row['progress'] as double,
            row['status'] as String,
            row['path'] as String,
            row['url'] as String,
            row['trackId'] as int),
        arguments: [id],
        queryableName: 'downloads',
        isView: false);
  }

  @override
  Stream<List<DownloadTask>> findDownloadsForTrackIds(List<int> trackIds) {
    const offset = 1;
    final _sqliteVariablesForTrackIds =
        Iterable<String>.generate(trackIds.length, (i) => '?${i + offset}')
            .join(',');
    return _queryAdapter.queryListStream(
        'SELECT * FROM downloads WHERE trackId in (' +
            _sqliteVariablesForTrackIds +
            ')',
        mapper: (Map<String, Object?> row) => DownloadTask(
            row['id'] as int,
            row['progress'] as double,
            row['status'] as String,
            row['path'] as String,
            row['url'] as String,
            row['trackId'] as int),
        arguments: [...trackIds],
        queryableName: 'downloads',
        isView: false);
  }

  @override
  Future<void> insertDownloadTask(DownloadTask task) async {
    await _downloadTaskInsertionAdapter.insert(task, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _durationConverter = DurationConverter();
