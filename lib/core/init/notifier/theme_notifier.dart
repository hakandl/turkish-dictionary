import 'package:flutter/material.dart';

import '../../constants/enums/app_theme.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  AppThemes _currentThemeEnum = AppThemes.LIGHT;
  bool themeIcon = false;

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }

  void changeIcon() {
    themeIcon = !themeIcon;
    notifyListeners();
  }
}

/* class ThemeNotifier extends ChangeNotifier {
  ValueNotifier<bool> box = ValueNotifier(Hive.box('theme_change').get('darkMode') ?? false);

  void themeChange() {
    box.value = !box.value;

    Hive.box('theme_change').put('darkMode', box.value);
  }
} */
