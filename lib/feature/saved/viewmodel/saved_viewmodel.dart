import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedViewModel extends ChangeNotifier {
  late final Box savedWordBox;

  SavedViewModel() {
    savedWordBox = Hive.box('saved');
  }
}
