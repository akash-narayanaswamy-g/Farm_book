import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PieLogUtils {
  static bool isLog = false;

  static void logPrint(String message) {
    if (isLog) {
      debugPrint(message);
    }
  }
}
