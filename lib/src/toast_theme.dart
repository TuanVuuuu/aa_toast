import 'package:flutter/material.dart';
import 'package:aa_toast/src/models/toast_config.dart';
import 'package:aa_toast/src/models/toast_type.dart';

class ToastTheme {
  const ToastTheme({
    this.successColor = const Color(0xFF4CAF50),
    this.errorColor = const Color(0xFFF44336),
    this.infoColor = const Color(0xFF2196F3),
    this.warningColor = const Color(0xFFFF9800),
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(16),
    this.borderRadius = 8.0,
    this.maxWidth = 300.0,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final Color successColor;
  final Color errorColor;
  final Color infoColor;
  final Color warningColor;
  final Color textColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double maxWidth;
  final Duration animationDuration;

  Color getColorByType(ToastType type) {
    switch (type) {
      case ToastType.success:
        return successColor;
      case ToastType.error:
        return errorColor;
      case ToastType.info:
        return infoColor;
      case ToastType.warning:
        return warningColor;
      case ToastType.custom:
        return infoColor;
    }
  }

  ToastConfig getDefaultConfig() {
    return ToastConfig(
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      maxWidth: maxWidth,
      animationDuration: animationDuration,
    );
  }
}
