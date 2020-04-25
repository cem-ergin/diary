import 'package:flutter/material.dart';
import 'package:gunluk/themes/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = blueTheme;
  ThemeData get themeData => _themeData;
  void changeTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
