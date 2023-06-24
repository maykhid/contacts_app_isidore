import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle smallTextGrey =  TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.5),
  );
  
  static TextStyle normalTextPrimary = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.deepPurple,
  );

  static TextStyle normalTextPrimary2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.deepPurple,
  );

  static TextStyle normalTextWhite = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle largeTextPrimary = const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w700,
    color: AppColors.deepPurple,
  );
}
