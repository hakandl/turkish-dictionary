import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesViewModel extends ChangeNotifier {
  late final Box favoriteWordBox;

  FavoritesViewModel() {
    favoriteWordBox = Hive.box('favorites_word');
    // notifyListeners();
  }

  void favoritesWordClear() {
    favoriteWordBox.clear();
    // notifyListeners();
  }

  favoritesWordGet(int index) {
    favoriteWordBox.getAt(index);
  }

  favoritesWordDelete(int index) {
    favoriteWordBox.deleteAt(index);
    // notifyListeners();
  }
}
