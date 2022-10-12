import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

/* class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  AppThemes _currentThemeEnum = AppThemes.LIGHT;
  bool themeIcon = false;

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppThemes.DARK;
      Hive.box('theme_change').put('dark_mode', !Hive.box('theme_change').get('dark_mode', defaultValue: false));
    } else {
      Hive.box('theme_change').put('dark_mode', Hive.box('theme_change').get('dark_mode', defaultValue: false));

      _currentTheme = Hive.box('theme_change').get('dark_mode');
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }

  void changeIcon() {
    themeIcon = !themeIcon;
    notifyListeners();
  }
} */

class ThemeNotifier extends ChangeNotifier {
  ValueNotifier<bool> box = ValueNotifier(Hive.box('theme_change').get('darkMode') ?? false);

  void themeChange() {
    box.value = !box.value;

    Hive.box('theme_change').put('darkMode', box.value);
  }
}
