import 'package:flutter/material.dart';
import 'package:gunluk/constants/google_text_themes.dart';
import 'package:gunluk/helpers/shared_preferences_helper.dart';
import 'package:gunluk/providers/text_theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeFontPage extends StatefulWidget {
  const ChangeFontPage({Key key}) : super(key: key);

  @override
  _ChangeFontPageState createState() => _ChangeFontPageState();
}

class _ChangeFontPageState extends State<ChangeFontPage> {
  List<TextTheme> _myTextThemes;
  List<String> _myTextThemeNames;
  @override
  void initState() {
    super.initState();
    _myTextThemes = MyGoogleTextThemes.getMyTextThemes();
    _myTextThemeNames = MyGoogleTextThemes.getMyTextThemeStrings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazı tipi'),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: _myTextThemes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => onChangeFontPressed(context, index),
            title: Text(
              "Pijamalı hasta yağız şoföre çabucak güvendi, 1234567890.",
              style: _myTextThemes[index].bodyText1,
            ),
            subtitle: Text(
              "${_myTextThemeNames[index]}",
              style: _myTextThemes[index].bodyText1,
            ),
          );
        },
      ),
    );
  }

  void onChangeFontPressed(BuildContext context, int index) {
    try {
      Provider.of<TextThemeProvider>(context, listen: false)
          .changeTextTheme(_myTextThemes[index]);
      SharedPreferencesHelper.setFontToSharedPreferences(index);
      print("FONT shared pref save is successful");
    } catch (e) {
      print("FONT there is an error: " + e.toString());
    }
  }
}
