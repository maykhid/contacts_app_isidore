import 'package:contacts_app_isidore/core/ui/ui.dart';
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

  static void showSuccessSnackBar(
    BuildContext context,
    String successMsg, [
    Duration duration = const Duration(milliseconds: 3000),
  ]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          successMsg,
          style: const TextStyle(color: Colors.black),
        ),
        duration: duration,
        backgroundColor: AppColors.lightPink,
      ),
    );
  }
}
