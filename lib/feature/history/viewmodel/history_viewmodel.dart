import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryViewModel extends ChangeNotifier {
  late final Box historyWordBox;

  HistoryViewModel() {
    historyWordBox = Hive.box('history');
    // notifyListeners();
  }
}
