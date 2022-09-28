import 'package:flutter/material.dart';

abstract class LoadingStateful<T extends StatefulWidget> extends ChangeNotifier {
  bool isLoading = false;
  void get changeLoading => isLoading = !isLoading;
}
