part of 'ui_settings_cubit.dart';

@immutable
class UiSettingsState {
  final bool isUsingBlocForFeatures;
  final bool isDarkMode;
  final Color backgroundColor;
  final String appBarTitle;

  const UiSettingsState({
    required this.isUsingBlocForFeatures,
    required this.isDarkMode,
    required this.backgroundColor,
    required this.appBarTitle,
  });
}
