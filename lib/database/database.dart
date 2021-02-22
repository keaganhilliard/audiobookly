import 'package:audiobookly/database/entities.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:audiobookly/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

final databaseServiceProvider =
    FutureProvider.autoDispose<DatabaseService>((ref) async {
  final dir = await getApplicationDocumentsDirectory();
  final _store = Store(getObjectBoxModel(), directory: dir.path + '/box');
  ref.onDispose(_store.close);
  return DatabaseService(_store);
});

class DatabaseService {
  final Store _store;
  DatabaseService(this._store);

  List<DownloadTask> getDownloadTasks() {
    final taskBox = _store.box<DownloadTask>();
    return taskBox.getAll();
  }

  List<int> createOrUpdateDownloadTasks(List<DownloadTask> tasks) {
    final taskBox = _store.box<DownloadTask>();
    return taskBox.putMany(tasks);
  }
}
