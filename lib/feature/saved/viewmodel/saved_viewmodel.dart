import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../product/constants/enums/string/string_constants.dart';

class SavedViewModel extends ChangeNotifier {
  late final Box savedWordBox;

  SavedViewModel() {
    savedWordBox = Hive.box(TurkishDictionaryStringConstants.saved);
  }
}
