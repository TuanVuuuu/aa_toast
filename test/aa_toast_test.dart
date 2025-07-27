import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aa_toast/aa_toast.dart';

void main() {
  group('ToastType', () {
    test('should have correct enum values', () {
      expect(ToastType.values.length, 5);
      expect(ToastType.success, ToastType.success);
      expect(ToastType.error, ToastType.error);
      expect(ToastType.info, ToastType.info);
      expect(ToastType.warning, ToastType.warning);
      expect(ToastType.custom, ToastType.custom);
    });
  });

  group('ToastPosition', () {
    test('should have correct enum values', () {
      expect(ToastPosition.values.length, 3);
      expect(ToastPosition.top, ToastPosition.top);
      expect(ToastPosition.center, ToastPosition.center);
      expect(ToastPosition.bottom, ToastPosition.bottom);
    });
  });

  group('ToastConfig', () {
    test('should create with default values', () {
      const config = ToastConfig();

      expect(config.message, '');
      expect(config.type, ToastType.info);
      expect(config.position, ToastPosition.bottom);
      expect(config.duration, const Duration(seconds: 3));
      expect(config.backgroundColor, null);
      expect(config.textColor, null);
      expect(config.icon, null);
      expect(config.padding, const EdgeInsets.all(16));
      expect(config.margin, const EdgeInsets.all(16));
      expect(config.borderRadius, 8.0);
      expect(config.maxWidth, 300.0);
      expect(config.animationDuration, const Duration(milliseconds: 300));
    });

    test('should create with custom values', () {
      const config = ToastConfig(
        message: 'Test message',
        type: ToastType.success,
        position: ToastPosition.top,
        duration: Duration(seconds: 5),
        backgroundColor: Colors.green,
        textColor: Colors.white,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        borderRadius: 12.0,
        maxWidth: 400.0,
        animationDuration: Duration(milliseconds: 500),
      );

      expect(config.message, 'Test message');
      expect(config.type, ToastType.success);
      expect(config.position, ToastPosition.top);
      expect(config.duration, const Duration(seconds: 5));
      expect(config.backgroundColor, Colors.green);
      expect(config.textColor, Colors.white);
      expect(config.padding, const EdgeInsets.all(20));
      expect(config.margin, const EdgeInsets.all(10));
      expect(config.borderRadius, 12.0);
      expect(config.maxWidth, 400.0);
      expect(config.animationDuration, const Duration(milliseconds: 500));
    });

    test('should copy with new values', () {
      const original = ToastConfig(
        message: 'Original',
        type: ToastType.info,
      );

      final copied = original.copyWith(
        message: 'Updated',
        type: ToastType.success,
      );

      expect(copied.message, 'Updated');
      expect(copied.type, ToastType.success);
      expect(copied.position, original.position);
      expect(copied.duration, original.duration);
    });
  });

  group('ToastTheme', () {
    test('should create with default values', () {
      const theme = ToastTheme();

      expect(theme.successColor, const Color(0xFF4CAF50));
      expect(theme.errorColor, const Color(0xFFF44336));
      expect(theme.infoColor, const Color(0xFF2196F3));
      expect(theme.warningColor, const Color(0xFFFF9800));
      expect(theme.textColor, Colors.white);
      expect(theme.padding, const EdgeInsets.all(16));
      expect(theme.margin, const EdgeInsets.all(16));
      expect(theme.borderRadius, 8.0);
      expect(theme.maxWidth, 300.0);
      expect(theme.animationDuration, const Duration(milliseconds: 300));
    });

    test('should get correct color by type', () {
      const theme = ToastTheme();

      expect(theme.getColorByType(ToastType.success), theme.successColor);
      expect(theme.getColorByType(ToastType.error), theme.errorColor);
      expect(theme.getColorByType(ToastType.info), theme.infoColor);
      expect(theme.getColorByType(ToastType.warning), theme.warningColor);
      expect(theme.getColorByType(ToastType.custom), theme.infoColor);
    });

    test('should get default config', () {
      const theme = ToastTheme();
      final config = theme.getDefaultConfig();

      expect(config.padding, theme.padding);
      expect(config.margin, theme.margin);
      expect(config.borderRadius, theme.borderRadius);
      expect(config.maxWidth, theme.maxWidth);
      expect(config.animationDuration, theme.animationDuration);
    });
  });
}
