import 'package:flutter/material.dart';

class Utilities {
  Utilities._();

  static Future<void> debugPrintCustom(dynamic exception,
      {StackTrace? stack, dynamic reason}) async {
    debugPrint("$exception");
  }
}
