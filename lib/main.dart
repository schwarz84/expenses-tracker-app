import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:expenses_tracker/widgets/widgets.dart';

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
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    )
  );
}