import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:expenses_tracker/widgets/widgets.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(150, 255, 0, 0));
var kDarkScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 6, 91, 6));

void main() {
  runApp(
    MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''), // Español
      ],
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkScheme.primary,
          foregroundColor: kDarkScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkScheme.tertiaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkScheme.primaryContainer,
                foregroundColor: kDarkScheme.onPrimaryContainer,
                shadowColor: Colors.black,
              )
          )
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.tertiaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.errorContainer,
            shadowColor: Colors.black,
          )
        )
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    )
  );
}