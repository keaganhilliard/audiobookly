import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    try {
      notifyListeners();
    } catch (e) {
      print('Some shit caught: $e');
    }
  }
}
