import 'package:flutter/material.dart';

/// 🌈 [AppConstants] holds the application's static UI-related constants and theme configurations.
abstract class AppConstants {
  /// 🎨 Colors for dark theme
  static const Color darkPrimaryColor = Color.fromARGB(255, 0, 156, 203);
  static const Color darkScaffoldBackgroundColor = Color(0xFF181818);
  static const Color darkAppBarBackgroundColor =
      Color.fromARGB(255, 79, 78, 78);
  static const Color darkForegroundColor = Colors.white;
  static const Color darkGlassButtonBackgroundColor =
      Color.fromARGB(255, 79, 78, 78);

  /// 🎨 Colors for light theme
  static const Color lightPrimaryColor = Color.fromARGB(240, 6, 148, 187);
  static const Color lightScaffoldBackgroundColor = Colors.white;
  static const Color lightAppBarBackgroundColor = Colors.white;
  static const Color lightForegroundColor = Color.fromARGB(255, 46, 46, 46);

  /// 🌈 Button colors
  static const Color darkButtonBackgroundColor =
      Color.fromARGB(200, 100, 100, 100);
  static const Color lightButtonBackgroundColor =
      Color.fromARGB(124, 12, 90, 132);

  /// 🌈 Error color
  static const Color errorColor = Colors.redAccent;

  static const Color secondaryColor4DarkTheme =
      Color.fromARGB(255, 91, 101, 106);
  static const Color secondaryColor4LightTheme =
      Color.fromARGB(255, 174, 214, 215);

  /// 🎨 Cyclic colors for `ColorOnCubit`
  static const List<Color> cyclicColors = [
    grayColor,
    greenColor,
    blueColor,
    darkRedColor,
  ];

  /// 🟢 Specific colors used in the color cycle
  static const Color grayColor = Color(0xFF737373);
  static const Color greenColor = Color(0xFF639364);
  static const Color blueColor = Color(0xFF395267);
  static const Color darkRedColor = Color(0xFF572F2F);

  /// 🛠️ Icons
  static const IconData sunIcon = Icons.sunny;
  static const IconData addIcon = Icons.add;
  static const IconData removeIcon = Icons.remove;
  static const IconData deleteIcon = Icons.delete_forever;
  static const IconData lightModeIcon = Icons.light_mode;
  static const IconData darkModeIcon = Icons.dark_mode;
  static const IconData syncIcon = Icons.sync;
  static const IconData changeCircleIcon = Icons.change_circle;

  /// 📏 Paddings
  static const double smallPadding = 5.0;
  static const double mediumPadding = 10.0;
  static const double largePadding = 20.0;

  /// 📏 Sizes
  static const double appBarElevation = 0.0;

  /// 🆙 Border radius
  static const BorderRadius commonBorderRadius =
      BorderRadius.all(Radius.circular(8));

  /// 📏 Максимальне відношення висоти діалогу до екрану (40%)
  static const double dialogMaxHeightRatio = 0.4;
}
