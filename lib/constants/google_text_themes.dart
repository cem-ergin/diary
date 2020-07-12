import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGoogleTextThemes {
  static List<TextTheme> getMyTextThemes() {
    return <TextTheme>[
      GoogleFonts.montserratTextTheme(), // 0
      GoogleFonts.ubuntuMonoTextTheme(), // 1
      GoogleFonts.firaSansTextTheme(), // 2
      GoogleFonts.robotoTextTheme(), // 3
      GoogleFonts.openSansTextTheme(), // 4
      GoogleFonts.fondamentoTextTheme(), // 5
      GoogleFonts.josefinSansTextTheme(), // 6
      GoogleFonts.cedarvilleCursiveTextTheme(), // 7
    ];
  }

  static List<String> getMyTextThemeStrings() {
    return <String>[
      "Montserrat", // 0
      "Ubuntu Mono", // 1
      "Fira Sans", // 2
      "Roboto", // 3
      "Open Sans", // 4
      "Fondamento", // 5
      "Josefin Sans", // 6
      "Cedarville Cursive", // 7
    ];
  }
}
