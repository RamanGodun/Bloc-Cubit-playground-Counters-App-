import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/helpers.dart';

/// 🎨 [TextStyles4ThisAppThemes] provides consistent typography styles for both dark and light themes.
///
/// Uses [GoogleFonts.montserratTextTheme] for a modern and clean appearance.
abstract class TextStyles4ThisAppThemes {
  /// 📝 Generates the [TextTheme] based on the app's theme mode (dark/light).
  ///
  /// Applies specific font weights and sizes to various text styles such as
  /// title, body, label, and display text types.
  static TextTheme kTextThemeData(bool isDarkTheme) {
    return GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: _getTextStyle(isDarkTheme, FontWeight.w600, 22),
      titleMedium: _getTextStyle(isDarkTheme, FontWeight.w500, 19),
      titleSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyLarge: _getTextStyle(isDarkTheme, FontWeight.w400, 16),
      bodyMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 14),
      bodySmall: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelLarge: _getTextStyle(isDarkTheme, FontWeight.w500, 14),
      labelMedium: _getTextStyle(isDarkTheme, FontWeight.w400, 12),
      labelSmall: _getTextStyle(isDarkTheme, FontWeight.w400, 11),
      displayLarge: _getTextStyle(isDarkTheme, FontWeight.w700, 25),
      displayMedium: _getTextStyle(isDarkTheme, FontWeight.w600, 22),
      displaySmall: _getTextStyle(isDarkTheme, FontWeight.w500, 19),
    );
  }

  /// 🎯 [_getTextStyle] creates a [TextStyle] with specific weight, size, and color.
  /// The color adapts based on whether the app is in dark or light mode.
  static TextStyle _getTextStyle(
      bool isDarkTheme, FontWeight fontWeight, double fontSize) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: isDarkTheme ? Colors.white : Colors.black,
    );
  }

  /// 🍎 Provides [CupertinoTextThemeData] for iOS-styled components.
  /// Automatically adapts the primary color to the current [ColorScheme].
  static CupertinoTextThemeData getCupertinoTextStyle(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);
    return CupertinoTextThemeData(
      primaryColor: colorScheme.onSurface,
      navTitleTextStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
