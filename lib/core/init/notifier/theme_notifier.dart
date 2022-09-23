import 'package:flutter/material.dart';
import 'package:turkce_sozluk/core/init/theme/dark/app_theme_dark.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;
  bool themeIcon = false;

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = AppThemeDark.instance.theme;
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }

  void changeIcon() {
    themeIcon = !themeIcon;
    notifyListeners();
  }
}
