import 'dart:developer';

import 'package:contacts_app_isidore/core/extensions/sized_context.dart';
import 'package:contacts_app_isidore/core/ui/ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppButton({
    required this.onPressed,
    required this.child,
    this.onPressedOnLoading,
    this.width = 80,
    this.height = 60,
    this.foregroundColor,
    this.borderRadius = 8,
    this.backgroundColor = AppColors.deepPurple,
    this.buttonTextStyle = const TextStyle(color: Colors.white),
    this.borderColor = Colors.transparent,
    this.active = true,
    this.loadingColor = Colors.white,
    this.isLoading = false,
    this.boxShadowColor,
    this.boxShadowRadius = 30,
  });

  final void Function() onPressed;
  final void Function()? onPressedOnLoading;
  final double width;
  final double? height;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final Color? foregroundColor;
  final TextStyle buttonTextStyle;
  final bool active;
  final bool isLoading;
  final Widget child;
  final Color loadingColor;
  final Color? boxShadowColor;
  final double? boxShadowRadius;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      textStyle: buttonTextStyle,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    return Container(
      height: height ?? context.height * 0.07,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(boxShadowRadius!),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor ?? Colors.transparent,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 5),
          ).scale(1)
        ],
      ),
      child: TextButton(
        style: style,
        onPressed: !isLoading
            ? onPressed
            : onPressedOnLoading ?? () => log('Please wait...'),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: loadingColor,
                      strokeWidth: 1,
                    ),
                  ),
                  // Text(
                  //     'Please wait...', color: loadingColor, size: 15),
                ],
              )
            : Center(child: child),
      ),
    );
  }
}
