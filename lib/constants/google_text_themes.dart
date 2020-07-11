import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGoogleTextThemes {
  static List<TextTheme> getMyTextThemes() {
    return <TextTheme>[
      GoogleFonts.latoTextTheme(), // 0
      GoogleFonts.ubuntuMonoTextTheme(), // 1
      GoogleFonts.firaSansTextTheme(), // 2
      GoogleFonts.robotoTextTheme(), // 3
      GoogleFonts.openSansTextTheme(), // 4
      GoogleFonts.fondamentoTextTheme(), // 5
      GoogleFonts.doHyeonTextTheme(), // 6
      GoogleFonts.galadaTextTheme(), // 7
    ];
  }

  static List<String> getMyTextThemeStrings() {
    return <String>[
      "Lato", // 0
      "Ubuntu Mono", // 1
      "Fira Sans", // 2
      "Roboto", // 3
      "Open Sans", // 4
      "Fondamento", // 5
      "Do Hyeon", // 6
      "Galada", // 7
    ];
  }
}
