import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiaryProvider with ChangeNotifier {
  //simdilik boyle olusturuluyor fakat diary sayfasina
  //pushlanirken color degistirilebilir.
  Color _backgroundColor = ThemeData.light().scaffoldBackgroundColor;
  Color get backgroundColor => _backgroundColor;
  void setColor(Color c) {
    _backgroundColor = c;
    notifyListeners();
  }

  //simdilik boyle olusturuluyor fakat diary sayfasina
  //pushlanirken textTheme degistirilecek.
  TextTheme _textTheme = GoogleFonts.firaSansTextTheme();
  TextTheme get textTheme => _textTheme;
  void changeTextTheme(TextTheme textTheme) {
    _textTheme = textTheme;
    notifyListeners();
  }

  List<String> _imagePaths = [];
  List<String> get imagePaths => _imagePaths;
  void addImage(String path) {
    _imagePaths.add(path);
    notifyListeners();
  }

  List<String> _voicePaths = [];
  List<String> get voicePaths => _voicePaths;
  void setVoicePaths(List<String> vp) {
    _voicePaths = vp;
    notifyListeners();
  }

  void clearAll() {
    _backgroundColor = ThemeData.light().scaffoldBackgroundColor;
    _textTheme = GoogleFonts.firaSansTextTheme();
    _imagePaths = [];
    _voicePaths = [];
    notifyListeners();
  }
}
