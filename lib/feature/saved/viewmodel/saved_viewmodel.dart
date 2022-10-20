import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedViewModel extends ChangeNotifier {
  late final Box savedWordBox;

  SavedViewModel() {
    savedWordBox = Hive.box('saved');
    // notifyListeners();
  }

  void savedWordClear() {
    savedWordBox.clear();
    // notifyListeners();
  }

  savedWordGet(int index) {
    savedWordBox.getAt(index);
  }

  savedWordDelete(int index) {
    savedWordBox.deleteAt(index);
    // notifyListeners();
  }
}
