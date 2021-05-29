import 'package:audiobookly/database/entities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

final AutoDisposeProvider<DatabaseService> databaseServiceProvider =
    Provider.autoDispose<DatabaseService>(
        ((ref) => throw UnimplementedError()));

Future<Store> getStore() async {
  final dir = await getApplicationDocumentsDirectory();
  final _store = Store(getObjectBoxModel(), directory: dir.path + '/box');
  return _store;
}

class DatabaseService {
  Store _store;
  DatabaseService(this._store);

  List<DownloadTask> getDownloadTasks() {
    final taskBox = _store.box<DownloadTask>();
    return taskBox.getAll();
  }

  List<int> createOrUpdateDownloadTasks(List<DownloadTask> tasks) {
    final taskBox = _store.box<DownloadTask>();
    return taskBox.putMany(tasks);
  }

  List<Book> getBooks() {
    final bookBox = _store.box<Book>();
    return bookBox.getAll();
  }

  List<int> createOrUpdateBooks(List<Book> books) {
    final bookBox = _store.box<Book>();
    return bookBox.putMany(books);
  }
}
