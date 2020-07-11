import 'package:gunluk/constants/shared_preferences_constants.dart';
import 'package:gunluk/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    print("getting default theme...");
    getDefaultTheme();
  }

  ThemeData _themeData = blueGreyTheme;
  ThemeData get themeData => _themeData;
  void changeTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  Future<void> getDefaultTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt(SharedPreferencesConstants.THEME);

    print("main get theme index: " + index.toString());
    notifyListeners();

    switch (index) {
      case 0:
        _themeData = darkTheme;
        break;
      case 1:
        _themeData = amberTheme;
        break;
      case 2:
        _themeData = blueGreyTheme;
        break;
      case 3:
        _themeData = blueTheme;
        break;
      case 4:
        _themeData = brownTheme;
        break;
      case 5:
        _themeData = cyanTheme;
        break;
      case 6:
        _themeData = deepOrangeTheme;
        break;
      case 7:
        _themeData = deepPurpleTheme;
        break;
      case 8:
        _themeData = greenTheme;
        break;
      case 9:
        _themeData = greyTheme;
        break;
      case 10:
        _themeData = indigoTheme;
        break;
      case 11:
        _themeData = lightGreenTheme;
        break;
      case 12:
        _themeData = limeTheme;
        break;
      case 13:
        _themeData = orangeTheme;
        break;
      case 14:
        _themeData = pinkTheme;
        break;
      case 15:
        _themeData = purpleTheme;
        break;
      case 16:
        _themeData = redTheme;
        break;
      case 17:
        _themeData = tealTheme;
        break;
      case 18:
        _themeData = blackTheme;
        break;
      case 19:
        _themeData = yellowTheme;
        break;
      default:
        _themeData = blueGreyTheme;
        break;
    }
  }
}
