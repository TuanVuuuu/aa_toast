import 'package:flutter/material.dart';
import 'package:aa_toast/src/models/toast_position.dart';
import 'package:aa_toast/src/models/toast_type.dart';

class ToastConfig {
  const ToastConfig({
    this.message = '',
    this.type = ToastType.info,
    this.position = ToastPosition.bottom,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.all(16),
    this.borderRadius = 8.0,
    this.maxWidth = 300.0,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final String message;
  final ToastType type;
  final ToastPosition position;
  final Duration duration;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final double maxWidth;
  final Duration animationDuration;

  ToastConfig copyWith({
    String? message,
    ToastType? type,
    ToastPosition? position,
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
    return ToastConfig(
      message: message ?? this.message,
      type: type ?? this.type,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      icon: icon ?? this.icon,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      maxWidth: maxWidth ?? this.maxWidth,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
