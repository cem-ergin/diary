import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeProvider extends ChangeNotifier {
  TextTheme _textTheme = GoogleFonts.aclonicaTextTheme();
  TextTheme get textTheme => _textTheme;
  void changeTextTheme(TextTheme textTheme) {
    _textTheme = textTheme;
    notifyListeners();
  }
}
