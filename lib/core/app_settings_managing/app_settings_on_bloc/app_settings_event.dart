part of 'app_settings_bloc.dart';

/// 🎯 **[AppSettingsEvents]** - Base class for all events related to [AppSettingsOnBloc].
///
/// Utilizes `Equatable` for proper event comparison and immutability.
sealed class AppSettingsEvents extends Equatable {
  const AppSettingsEvents();

  @override
  List<Object> get props => [];
}

/// 🔄 **[ToggleUseBlocEvent]** - Event to switch between BLoC and Cubit state management modes.
/// Triggered when the user toggles the state management approach in the app.
final class ToggleUseBlocEvent extends AppSettingsEvents {}

/// 📥 **[LoadAppStateEvent]** - Event to load the application's state.
/// Reserved for future use, in case state restoration is needed.
final class LoadAppStateEvent extends AppSettingsEvents {}

/// 🌗 **[ToggleThemeEvent]** - Event to switch between light and dark themes.
/// Accepts [isDarkMode] to determine whether to enable dark mode.
final class ToggleThemeEvent extends AppSettingsEvents {
  final bool isDarkMode;

  /// 🆕 Constructor for creating a theme toggle event.
  const ToggleThemeEvent({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}
