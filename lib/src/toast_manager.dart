import 'package:flutter/material.dart';
import 'package:aa_toast/src/models/toast_config.dart';
import 'package:aa_toast/src/models/toast_position.dart';
import 'package:aa_toast/src/models/toast_type.dart';
import 'package:aa_toast/src/toast_theme.dart';
import 'package:aa_toast/src/toast_widget.dart';

class ToastManager {
  static final ToastManager _instance = ToastManager._internal();
  factory ToastManager() => _instance;
  ToastManager._internal();

  final List<_ToastEntry> _toastQueue = [];
  OverlayEntry? _currentOverlay;
  final ToastTheme _defaultTheme = const ToastTheme();

  void show(
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
    final config = ToastConfig(
      message: message,
      type: type,
      position: position,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      padding: padding ?? _defaultTheme.padding,
      margin: margin ?? _defaultTheme.margin,
      borderRadius: borderRadius ?? _defaultTheme.borderRadius,
      maxWidth: maxWidth ?? _defaultTheme.maxWidth,
      animationDuration: animationDuration ?? _defaultTheme.animationDuration,
    );

    _addToast(context, config);
  }

  void _addToast(BuildContext context, ToastConfig config) {
    final entry = _ToastEntry(context, config);
    _toastQueue.add(entry);

    if (_currentOverlay == null) {
      _showNextToast();
    }
  }

  void _showNextToast() {
    if (_toastQueue.isEmpty) {
      _currentOverlay?.remove();
      _currentOverlay = null;
      return;
    }

    final entry = _toastQueue.removeAt(0);
    _showToast(entry);
  }

  void _showToast(_ToastEntry entry) {
    final overlay = Overlay.of(entry.context);
    _currentOverlay = OverlayEntry(
      builder: (context) => _buildOverlayWidget(entry),
    );

    overlay.insert(_currentOverlay!);
  }

  Widget _buildOverlayWidget(_ToastEntry entry) {
    return Positioned(
      top: _getTopPosition(entry.config.position),
      bottom: _getBottomPosition(entry.config.position),
      left: 0,
      right: 0,
      child: Align(
        alignment: _getAlignment(entry.config.position),
        child: ToastWidget(
          config: entry.config,
          theme: _defaultTheme,
          onDismiss: () {
            _currentOverlay?.remove();
            _currentOverlay = null;
            _showNextToast();
          },
        ),
      ),
    );
  }

  double? _getTopPosition(ToastPosition position) {
    switch (position) {
      case ToastPosition.top:
        return 50;
      case ToastPosition.center:
      case ToastPosition.bottom:
        return null;
    }
  }

  double? _getBottomPosition(ToastPosition position) {
    switch (position) {
      case ToastPosition.top:
      case ToastPosition.center:
        return null;
      case ToastPosition.bottom:
        return 50;
    }
  }

  Alignment _getAlignment(ToastPosition position) {
    switch (position) {
      case ToastPosition.top:
        return Alignment.topCenter;
      case ToastPosition.center:
        return Alignment.center;
      case ToastPosition.bottom:
        return Alignment.bottomCenter;
    }
  }

  void dismissAll() {
    _toastQueue.clear();
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

class _ToastEntry {
  _ToastEntry(this.context, this.config);

  final BuildContext context;
  final ToastConfig config;
}
