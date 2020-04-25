import 'package:flutter/material.dart';

import 'package:gunluk/pages/error/error_page.dart';
import 'package:gunluk/pages/home_page/home_page.dart';
import 'package:gunluk/pages/settings_page/change_theme_page/change_theme_page.dart';
import 'package:gunluk/pages/settings_page/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/settingsPage':
        return MaterialPageRoute(builder: (context) => SettingsPage());
      case '/changeThemePage':
        return MaterialPageRoute(builder: (context) => ChangeThemePage());

      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}
