import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  searchBarTheme: searchBarThemeData,
  floatingActionButtonTheme: floatingActionButtonThemeData,
);

SearchBarThemeData searchBarThemeData = const SearchBarThemeData(
  backgroundColor: WidgetStatePropertyAll(Colors.white),
  surfaceTintColor: WidgetStatePropertyAll(Colors.white),
  overlayColor: WidgetStatePropertyAll(Colors.white),
  elevation: WidgetStatePropertyAll(4),
);

FloatingActionButtonThemeData floatingActionButtonThemeData =
    FloatingActionButtonThemeData(
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
);
