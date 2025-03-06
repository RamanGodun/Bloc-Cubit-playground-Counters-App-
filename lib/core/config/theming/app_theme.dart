import 'package:flutter/material.dart';
import 'text_styles.dart';
import '../constants/app_constants.dart';

/// 🎨 `AppThemes` визначає теми додатку
abstract class AppThemes {
  /// 🌓 Dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppConstants.darkPrimaryColor,
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
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

  /// 🌞 Light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppConstants.lightPrimaryColor,
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
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
