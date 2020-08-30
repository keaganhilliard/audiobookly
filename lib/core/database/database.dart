import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'database.g.dart';

class Authors extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artUrl => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Books extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get artUrl => text()();
  TextColumn get author => text().customConstraint('REFERENCES authors(id)')();
  IntColumn get savedPosition => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Collections extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Tracks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().nullable()();
  TextColumn get book => text().customConstraint('REFERENCES books(id)')();
  TextColumn get cachedPath => text().nullable()();
  TextColumn get fileUrl => text()();
  BoolColumn get cached => boolean().withDefault(const Constant(false))();
  IntColumn get duration => integer()();
  IntColumn get savedPosition => integer().nullable()();
  IntColumn get index => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CollectionMembers extends Table {
  TextColumn get collection =>
      text().customConstraint('REFERENCES collections(id)')();
  TextColumn get book => text()();

  @override
  Set<Column> get primaryKey => {collection, book};
}

class BookWithTracks {
  final Book book;
  final Author author;
  int get duration =>
      tracks?.fold<int>(
          0, (previousValue, track) => previousValue + track.duration) ??
      0;
  final List<Track> tracks;

  BookWithTracks(this.author, this.book, this.tracks);
}

class BookWithAuthor {
  final Book book;
  final Author author;
  BookWithAuthor(this.author, this.book);
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@UseMoor(tables: [Books, Authors, Tracks, Collections, CollectionMembers])
class BookDatabase extends _$BookDatabase {
  BookDatabase() : super(_openConnection());

  // this is the new constructor
  BookDatabase.connect(DatabaseConnection connection)
      : super.connect(connection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA temp_store=2');
        },
      );

  Stream<List<Book>> get allBooks =>
      (select(books)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Stream<List<BookWithAuthor>> get allBooksWithAuthors {
    return (select(books)
        //..orderBy([(t) => OrderingTerm(expression: t.title)])
        )
        .join([leftOuterJoin(authors, authors.id.equalsExp(books.author))])
        .watch()
        .map((rows) {
          return rows.map((row) {
            return BookWithAuthor(row.readTable(authors), row.readTable(books));
          }).toList()
            ..sort((a, b) => a.author.title.compareTo(b.author.title));
        });
  }

  Stream<List<Author>> get allAuthors =>
      (select(authors)..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Stream<List<BookWithTracks>> allBooksWithTracks() {
    return allBooksWithAuthors.switchMap((books) {
      final idToBook = {for (var book in books) book.book.id: book};
      final ids = idToBook.keys;

      final trackQuery = select(tracks)
        ..orderBy([
          (t) => OrderingTerm(expression: t.index),
        ]);
      return trackQuery.watch().map((tracks) {
        final idToTracks = <String, List<Track>>{};

        for (var track in tracks) {
          idToTracks.putIfAbsent(track.book, () => []).add(track);
        }

        return [
          for (var id in ids)
            BookWithTracks(
                idToBook[id].author, idToBook[id].book, idToTracks[id] ?? [])
        ];
      });
    });
  }

  Future<dynamic> insertMultipleAuthors(List<Author> input) async {
    return await batch((batch) {
      batch.insertAll(
        authors,
        input.map((author) {
          return AuthorsCompanion.insert(
            id: author.id,
            title: author.title,
            artUrl: author.artUrl,
          );
        }).toList(),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future<dynamic> insertMultipleBooks(List<Book> input) async {
    return await batch((batch) {
      batch.insertAllOnConflictUpdate(
        books,
        input.map((book) {
          return BooksCompanion.insert(
            id: book.id,
            title: book.title,
            artUrl: book.artUrl ?? 'placeholder',
            author: book.author,
            savedPosition: Value(book.savedPosition),
          );
        }).toList(),
      );
    });
  }

  Future<dynamic> insertMultipleTracks(List<Track> input) async {
    return await batch((batch) {
      batch.insertAll(
        tracks,
        input.map((track) {
          return TracksCompanion.insert(
            id: track.id,
            fileUrl: track.fileUrl,
            savedPosition: Value(track.savedPosition),
            book: track.book,
            duration: track.duration,
            index: track.index,
          );
        }).toList(),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

const String _PORT_NAME = 'BOOK_DB_ISOLATE_NAME';

Future<MoorIsolate> getMoorIsolate() async {
  SendPort isolateSendPort = IsolateNameServer.lookupPortByName(_PORT_NAME);
  if (isolateSendPort == null) {
    print('Starting the isolate');
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'db.sqlite');
    final receivePort = ReceivePort();
    await Isolate.spawn(
      _startBackground,
      _IsolateStartRequest(receivePort.sendPort, path),
    );

    MoorIsolate moord = (await receivePort.first as MoorIsolate);
    IsolateNameServer.registerPortWithName(moord.connectPort, _PORT_NAME);

    // _startBackground will send the MoorIsolate to this ReceivePort
    return moord;
  } else {
    print('Already found an isolate');
    return MoorIsolate.fromConnectPort(isolateSendPort);
  }
}

void _startBackground(_IsolateStartRequest request) {
  // this is the entrypoint from the background isolate! Let's create
  // the database from the path we received
  final executor = VmDatabase(File(request.targetPath));
  // we're using MoorIsolate.inCurrent here as this method already runs on a
  // background isolate. If we used MoorIsolate.spawn, a third isolate would be
  // started which is not what we want!
  final moorIsolate = MoorIsolate.inCurrent(
    () => DatabaseConnection.fromExecutor(executor),
  );
  // inform the starting isolate about this, so that it can call .connect()
  request.sendMoorIsolate.send(moorIsolate);
}

// // used to bundle the SendPort and the target path, since isolate entrypoint
// // functions can only take one parameter.
class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}
