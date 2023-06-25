import 'dart:ui';

import 'package:flutter/material.dart';

class AppModal {
  // modal
  static void showAppModal(
    BuildContext context,
    Widget widget, [
    Color? backgroundColor,
  ]) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: widget,
      ),
    );
  }
}
