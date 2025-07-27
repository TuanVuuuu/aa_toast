# AAToast

A customizable Flutter toast library with simple API and cross-platform support.

## Features

- 🚀 **Simple API** - One line of code to show toast
- 🎨 **Customizable** - Custom colors, icons, positions, and animations
- 📱 **Cross-platform** - Works on iOS, Android, Web, and Desktop
- 🔄 **Queue Support** - Multiple toasts are queued automatically
- 🎯 **Multiple Types** - Success, error, info, warning, and custom toasts
- 📍 **Flexible Positioning** - Top, center, or bottom positioning

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  aa_toast: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:aa_toast/aa_toast.dart';

// Show a simple info toast
Toast.info(context, message: 'Hello World!');

// Show a success toast
Toast.success(context, message: 'Operation completed!');

// Show an error toast
Toast.error(context, message: 'Something went wrong!');

// Show a warning toast
Toast.warning(context, message: 'Please be careful!');
```

## API Reference

### Basic Usage

```dart
// Show toast with custom type
Toast.show(
  context,
  message: 'Your message here',
  type: ToastType.info,
  position: ToastPosition.bottom,
  duration: Duration(seconds: 3),
);
```

### Toast Types

```dart
// Predefined methods for common toast types
Toast.success(context, message: 'Success message');
Toast.error(context, message: 'Error message');
Toast.info(context, message: 'Info message');
Toast.warning(context, message: 'Warning message');

// Custom toast with full control
Toast.show(
  context,
  message: 'Custom message',
  type: ToastType.custom,
  backgroundColor: Colors.purple,
  textColor: Colors.white,
  icon: Icon(Icons.star, color: Colors.white),
);
```

### Toast Positions

```dart
// Position toasts at different locations
Toast.info(context, message: 'Top toast', position: ToastPosition.top);
Toast.info(context, message: 'Center toast', position: ToastPosition.center);
Toast.info(context, message: 'Bottom toast', position: ToastPosition.bottom);
```

### Customization

```dart
Toast.show(
  context,
  message: 'Highly customized toast',
  backgroundColor: Colors.deepPurple,
  textColor: Colors.white,
  icon: Icon(Icons.favorite, color: Colors.white),
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.all(16),
  borderRadius: 12.0,
  maxWidth: 400.0,
  duration: Duration(seconds: 5),
  animationDuration: Duration(milliseconds: 500),
);
```

### Dismiss All Toasts

```dart
// Dismiss all currently showing toasts
Toast.dismissAll();
```

## Example

Check out the [example](example/) directory for a complete demo app showing all features.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 