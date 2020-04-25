import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gunluk/providers/text_theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeFontPage extends StatefulWidget {
  const ChangeFontPage({Key key}) : super(key: key);

  @override
  _ChangeFontPageState createState() => _ChangeFontPageState();
}

class _ChangeFontPageState extends State<ChangeFontPage> {
  List<Map<String, TextStyle>> myStyles;
  @override
  void initState() {
    super.initState();
    var asdf = GoogleFonts.asMap();
    print(asdf.keys.elementAt(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yazi tipi degistir'),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: GoogleFonts.asMap().length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Provider.of<TextThemeProvider>(context, listen: false)
                  .changeTextTheme(
                GoogleFonts.getTextTheme(
                  GoogleFonts.asMap().keys.elementAt(index),
                ),
              );
            },
            title: Text(
              "Ornek yazi denemesi, 1234567890",
              style: GoogleFonts.getFont(
                GoogleFonts.asMap().keys.elementAt(index),
              ),
            ),
            subtitle: Text(
              "${GoogleFonts.asMap().keys.elementAt(index)}",
              style: GoogleFonts.getFont(
                GoogleFonts.asMap().keys.elementAt(index),
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
