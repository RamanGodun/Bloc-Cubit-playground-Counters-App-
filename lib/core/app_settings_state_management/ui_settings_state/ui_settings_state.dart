part of 'ui_settings_cubit.dart';

@immutable
class UiSettingsState {
  final bool isUsingBloc;
  final bool isDarkMode;
  final Color backgroundColor;
  final String appBarTitle;

  const UiSettingsState({
    required this.isUsingBloc,
    required this.isDarkMode,
    required this.backgroundColor,
    required this.appBarTitle,
  });
}
