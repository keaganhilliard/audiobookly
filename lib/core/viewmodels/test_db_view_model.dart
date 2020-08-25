import 'dart:async';

import 'package:audiobookly/core/database/database.dart';
import 'package:audiobookly/core/viewmodels/base_model.dart';
import 'package:audiobookly/repository/repository.dart';

class TestDbViewModel extends BaseModel {
  Stream<BookWithTracks> books;

  init() {
    // books = Repository.to.allBooks;
    notifyListeners();
  }
}
