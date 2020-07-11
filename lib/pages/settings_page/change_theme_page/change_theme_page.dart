import 'package:flutter/material.dart';
import 'package:gunluk/constants/my_themes.dart';
import 'package:gunluk/helpers/shared_preferences_helper.dart';
import 'package:gunluk/providers/theme_provider.dart';
import 'package:gunluk/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemePage extends StatefulWidget {
  const ChangeThemePage({Key key}) : super(key: key);

  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  List<ThemeData> _myThemes;
  @override
  void initState() {
    super.initState();
    _myThemes = MyThemes.myThemes();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Theme'),
      ),
      body: Container(
        height: _height,
        width: _width,
        child: GridView.builder(
          itemCount: _myThemes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                onChangeThemePressed(context, index);
              },
              child: index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Dark\nTheme",
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: _myThemes[index].primaryColor,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  void onChangeThemePressed(BuildContext context, int index) {
    try {
      Provider.of<ThemeProvider>(context, listen: false)
          .changeTheme(_myThemes[index]);
      SharedPreferencesHelper.setThemeToSharedPreferences(index);
      print("THEME shared pref save is successful");
    } catch (e) {
      print("THEME there is an error: " + e.toString());
    }
  }
}
