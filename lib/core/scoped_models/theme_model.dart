import 'package:flutter/material.dart';
import 'package:flutter_scaffold/core/scoped_models/base_model.dart';

class ThemeModel extends BaseModel {
  ThemeCase _themeModel = ThemeCase.auto;

  get themeModel => _themeModel;

  ThemeData theme({bool platformDarkMode = false}) {
    var isDark = (_themeModel == ThemeCase.auto && platformDarkMode) || _themeModel == ThemeCase.dark;
    Brightness brightness = isDark ? Brightness.dark : Brightness.light;

    var accentColor = isDark ? Colors.green[700] : Colors.green;

    return ThemeData(
      brightness: brightness,
      primarySwatch: Colors.green,
      primaryColorBrightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      accentColor: accentColor,
    );
  }

  switchTheme(ThemeCase theme) {
    _themeModel = theme;
    setState(ViewState.Success);
  }
}

enum ThemeCase { auto, light, dark }
