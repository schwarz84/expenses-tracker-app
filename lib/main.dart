import 'package:flutter/material.dart';

import 'package:expenses_tracker/widgets/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    )
  );
}