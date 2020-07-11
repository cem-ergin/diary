import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gunluk/constants/google_text_themes.dart';

import 'package:gunluk/constants/shared_preferences_constants.dart';
import 'package:gunluk/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextThemeProvider extends ChangeNotifier {
  TextThemeProvider() {
    print("getting default text theme...");
    getDefaultTextTheme();
  }

  TextTheme _textTheme = GoogleFonts.firaSansTextTheme();
  TextTheme get textTheme => _textTheme;
  void changeTextTheme(TextTheme textTheme) {
    _textTheme = textTheme;
    notifyListeners();
  }

  Future<void> getDefaultTextTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt(SharedPreferencesConstants.FONT);

    try {
      print("getting font index: " + index.toString());
      _textTheme = MyGoogleTextThemes.getMyTextThemes()[index];
    } catch (e) {
      print("an error accured on getDefaultTextTheme, error: $e");
      _textTheme = GoogleFonts.firaSansTextTheme();
    }

    notifyListeners();
  }
}
