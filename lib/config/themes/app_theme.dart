import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.amber,
      surface: Colors.white,
      background: Colors.grey[50]!,
      error: Colors.red,
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[100],
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.grey[50],
   
  );
}