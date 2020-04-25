import 'package:flutter/material.dart';
import 'package:gunluk/providers/theme_provider.dart';
import 'package:gunluk/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

Future<void> getTheme(BuildContext context) async {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int index = prefs.getInt(SharedPrefs.ThemePref);
  print("main get theme index: " + index.toString());
  switch (index) {
    case 0:
      return themeProvider.changeTheme(darkTheme);
    case 1:
      return themeProvider.changeTheme(amberTheme);
    case 2:
      return themeProvider.changeTheme(blueGreyTheme);
    case 3:
      return themeProvider.changeTheme(blueTheme);
    case 4:
      return themeProvider.changeTheme(brownTheme);
    case 5:
      return themeProvider.changeTheme(cyanTheme);
    case 6:
      return themeProvider.changeTheme(deepOrangeTheme);
    case 7:
      return themeProvider.changeTheme(deepPurpleTheme);
    case 8:
      return themeProvider.changeTheme(greenTheme);
    case 9:
      return themeProvider.changeTheme(greyTheme);
    case 10:
      return themeProvider.changeTheme(indigoTheme);
    case 11:
      return themeProvider.changeTheme(lightGreenTheme);
    case 12:
      return themeProvider.changeTheme(limeTheme);
    case 13:
      return themeProvider.changeTheme(orangeTheme);
    case 14:
      return themeProvider.changeTheme(pinkTheme);
    case 15:
      return themeProvider.changeTheme(purpleTheme);
    case 16:
      return themeProvider.changeTheme(redTheme);
    case 17:
      return themeProvider.changeTheme(tealTheme);
    case 18:
      return themeProvider.changeTheme(blackTheme);
    case 19:
      return themeProvider.changeTheme(yellowTheme);
    default:
      return themeProvider.changeTheme(blueTheme);
  }
}
