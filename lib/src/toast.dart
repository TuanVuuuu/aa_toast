import 'package:flutter/material.dart';
import 'package:aa_toast/src/models/toast_position.dart';
import 'package:aa_toast/src/models/toast_type.dart';
import 'package:aa_toast/src/toast_manager.dart';

class Toast {
  static final ToastManager _manager = ToastManager();

  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    ToastPosition position = ToastPosition.bottom,
    Duration? duration,
    Color? backgroundColor,
    Color? textColor,
    Widget? icon,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    double? maxWidth,
    Duration? animationDuration,
  }) {
    _manager.show(
      context,
      message: message,
      type: type,
      position: position,
      duration: duration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      maxWidth: maxWidth,
      animationDuration: animationDuration,
    );
  }

  static void success(
    BuildContext context, {
    required String message,
    ToastPosition position = ToastPosition.bottom,
    Duration? duration,
  }) {
    show(
      context,
      message: message,
      type: ToastType.success,
      position: position,
      duration: duration,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
    ToastPosition position = ToastPosition.bottom,
    Duration? duration,
  }) {
    show(
      context,
      message: message,
      type: ToastType.error,
      position: position,
      duration: duration,
    );
  }

  static void info(
    BuildContext context, {
    required String message,
    ToastPosition position = ToastPosition.bottom,
    Duration? duration,
  }) {
    show(
      context,
      message: message,
      type: ToastType.info,
      position: position,
      duration: duration,
    );
  }

  static void warning(
    BuildContext context, {
    required String message,
    ToastPosition position = ToastPosition.bottom,
    Duration? duration,
  }) {
    show(
      context,
      message: message,
      type: ToastType.warning,
      position: position,
      duration: duration,
    );
  }

  static void dismissAll() {
    _manager.dismissAll();
  }
}
