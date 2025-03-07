import 'package:flutter/material.dart';

/// 🔧 [Helpers] provides utility methods for navigation, theming, and context-based operations.
/// This class centralizes common actions, promoting clean and maintainable code.

abstract class Helpers {
  /// 🚀 Pushes a new route to the navigation stack with a smooth transition.
  static Future<void> pushTo(BuildContext context, Widget child) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  /// 🧭 Navigates to a named route using the [routeName].
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 🎨 Retrieves the current [ThemeData] from the application context.
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// 📝 Returns the current [TextTheme] for consistent text styling.
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  /// 🌈 Fetches the [ColorScheme] from the app's theme.
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}
