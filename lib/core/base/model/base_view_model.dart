import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? context;

  // LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
