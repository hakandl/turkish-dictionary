import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/constants/enums/string/string_constants.dart';

class HistoryViewModel extends ChangeNotifier {
  late final Box historyWordBox;

  HistoryViewModel() {
    historyWordBox = Hive.box(TurkishDictionaryStringConstants.history);
  }
}
