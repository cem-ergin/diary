import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gunluk/pages/home_page/home_page.dart';
import 'package:gunluk/providers/text_theme_provider.dart';
import 'package:gunluk/routes/route_generator.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<TextThemeProvider>(
          create: (_) => TextThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('tr', 'TR'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeProvider.themeData.copyWith(
        textTheme: Provider.of<TextThemeProvider>(context).textTheme.apply(
              displayColor: Theme.of(context).canvasColor,
            ),
        primaryTextTheme:
            Provider.of<TextThemeProvider>(context).textTheme.apply(
                  bodyColor: Theme.of(context).canvasColor,
                ),
        accentTextTheme:
            Provider.of<TextThemeProvider>(context).textTheme.apply(
                  displayColor: Theme.of(context).canvasColor,
                ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
