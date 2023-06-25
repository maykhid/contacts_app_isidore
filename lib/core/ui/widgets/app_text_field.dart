import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validate,
    this.textInputType,
    this.textInputAction,
    this.maxLines = 1, // based on ui maxLines are 1
    this.onSaved,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.suffixIcon,
  });
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  String? Function(String?)? validate;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.deepPurple,
      cursorHeight: 24,
      obscureText: obscureText,
      validator: validate,
      maxLines: obscureText == true ? 1 : maxLines,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.deepPurple, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.deepPurple, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.deepPurple, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
      ),
      onChanged: (value) {},
      onSaved: onSaved,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
