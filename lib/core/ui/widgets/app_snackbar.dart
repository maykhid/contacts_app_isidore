import 'package:flutter/material.dart';

class AppSnackBar {
  static void showErrorSnackBar(
    BuildContext context,
    String errorMsg, [
    Duration duration = const Duration(milliseconds: 3000),
  ]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMsg),
        duration: duration,
        backgroundColor: Colors.red,
      ),
    );
  }
}
