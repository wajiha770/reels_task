import 'package:flutter/material.dart';

ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blue.shade800,
  primaryColorDark: Colors.blue.shade900,
  fontFamily: 'dm-sans',
  secondaryHeaderColor: Colors.black,
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: const Color(0xFFFCFCFC),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
  ),
  unselectedWidgetColor: Colors.black38,
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  scrollbarTheme: const ScrollbarThemeData()
      .copyWith(thickness: WidgetStateProperty.all(2)),
);
