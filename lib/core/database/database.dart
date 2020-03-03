import 'dart:io';
import 'dart:isolate';

import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'database.g.dart';

class Authors extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Books extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get author => text().customConstraint('REFERENCES authors(id)')();
  IntColumn get duration => integer()();
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

  Future<List<Book>> get allBooks => select(books).get();
  Future<List<Author>> get allAuthors => select(authors).get();

  Future addAuthorEntry(AuthorsCompanion entry) async {
    return await into(authors).insert(entry);
  }

  Future<dynamic> insertMultipleAuthors(List<Author> input) async {
    return await batch((batch) {
      batch.insertAll(
          authors,
          input.map((author) {
            return AuthorsCompanion.insert(id: author.id, title: author.title);
          }).toList());
    });
  }

  // watches all todo entries in a given category. The stream will automatically
  // emit new items whenever the underlying data changes.
  // Stream<List<TodoEntry>> watchEntriesInCategory(Category c) {
  //   return (select(todos)..where((t) => t.category.equals(c.id))).watch();
  // }
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

// Future<MoorIsolate> createMoorIsolate() async {
//   // this method is called from the main isolate. Since we can't use
//   // getApplicationDocumentsDirectory on a background isolate, we calculate
//   // the database path in the foreground isolate and then inform the
//   // background isolate about the path.
//   final dir = await getApplicationDocumentsDirectory();
//   final path = p.join(dir.path, 'db.sqlite');
//   final receivePort = ReceivePort();

//   await Isolate.spawn(
//     _startBackground,
//     _IsolateStartRequest(receivePort.sendPort, path),
//   );

//   // _startBackground will send the MoorIsolate to this ReceivePort
//   return (await receivePort.first as MoorIsolate);
// }

// void _startBackground(_IsolateStartRequest request) {
//   // this is the entrypoint from the background isolate! Let's create
//   // the database from the path we received
//   final executor = VmDatabase(File(request.targetPath));
//   // we're using MoorIsolate.inCurrent here as this method already runs on a
//   // background isolate. If we used MoorIsolate.spawn, a third isolate would be
//   // started which is not what we want!
//   final moorIsolate = MoorIsolate.inCurrent(
//     () => DatabaseConnection.fromExecutor(executor),
//   );
//   // inform the starting isolate about this, so that it can call .connect()
//   request.sendMoorIsolate.send(moorIsolate);
// }

// // used to bundle the SendPort and the target path, since isolate entrypoint
// // functions can only take one parameter.
// class _IsolateStartRequest {
//   final SendPort sendMoorIsolate;
//   final String targetPath;

//   _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
// }
