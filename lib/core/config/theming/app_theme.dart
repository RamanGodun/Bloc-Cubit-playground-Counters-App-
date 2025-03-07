import 'package:flutter/material.dart';
import 'text_styles.dart';
import '../constants/app_constants.dart';

/// 🎨 [AppThemes] defines the dark and light themes for the application.
///
/// Uses [ThemeData] and [ColorScheme] to provide a consistent look and feel
/// across all components, including dynamic theme switching.
abstract class AppThemes {
  /// 🌑 **Dark Theme** - Provides a modern, low-light UI with high contrast.
  ///
  /// Uses [Material3] guidelines and leverages [AppConstants] for consistent
  /// color and styling choices.
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppConstants.darkPrimaryColor,
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppConstants.darkAppBarBackgroundColor,
      foregroundColor: AppConstants.darkForegroundColor,
      elevation: 0,
      titleTextStyle: TextStyles4ThisAppThemes.kTextThemeData(true)
          .titleMedium
          ?.copyWith(color: AppConstants.darkForegroundColor),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppConstants.darkPrimaryColor,
      secondary: AppConstants.secondaryColor4DarkTheme,
      surface: AppConstants.darkAppBarBackgroundColor,
      background: AppConstants.darkScaffoldBackgroundColor,
      error: AppConstants.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(true),
  );

  /// 🌞 **Light Theme** - Delivers a bright, clean, and inviting user interface.
  ///
  /// The light theme uses softer colors and maintains readability and usability
  /// even in well-lit environments.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppConstants.lightPrimaryColor,
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppConstants.lightAppBarBackgroundColor,
      foregroundColor: AppConstants.lightForegroundColor,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppConstants.lightPrimaryColor,
      secondary: AppConstants.secondaryColor4LightTheme,
      surface: AppConstants.lightScaffoldBackgroundColor,
      background: AppConstants.lightScaffoldBackgroundColor,
      error: AppConstants.errorColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    ),
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(false),
  );
}
