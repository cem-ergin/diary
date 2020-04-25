import 'package:flutter/material.dart';
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
  List<ThemeData> themeData = [
    darkTheme, //0
    amberTheme, //1
    blueGreyTheme, //2
    blueTheme, //3
    brownTheme, //4
    cyanTheme, //5
    deepOrangeTheme, //6
    deepPurpleTheme, //7
    greenTheme, //8
    greyTheme, //9
    indigoTheme, //10
    lightGreenTheme, //11
    limeTheme, //12
    orangeTheme, //13
    pinkTheme, //14
    purpleTheme, //15
    redTheme, //16
    tealTheme, //17
    blackTheme, //18
    yellowTheme //19
  ];

  // Future<void> setThemeToSharedPreferences(int index) async {
  //   //!Theme indexi SharedPreferences'a kaydedilir.
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt(SharedPrefs.ThemePref, index);
  // }

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
          itemCount: themeData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                try {
                  // Provider.of<ThemeProvider>(context, listen: false)
                  //     .changeTheme(themeData[index]);
                  //setThemeToSharedPreferences(index);
                  print("shared pref save is successful");
                } catch (e) {
                  print("there is an error: " + e.toString());
                }
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
                        backgroundColor: themeData[index].primaryColor,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
