part of 'app_settings_bloc.dart';

/// State class for managing application settings within the BLoC architecture.
class AppSettingsStateOnBloc extends Equatable {
  /// Indicates whether the app is using BLoC for state management.
  final bool isAppSettingsUsingBloc;

  /// Manages dark mode state when using BLoC or Cubit
  final bool isDarkThemeForBloc;
  final bool isDarkThemeForCubit;

  const AppSettingsStateOnBloc({
    required this.isAppSettingsUsingBloc,
    required this.isDarkThemeForBloc,
    required this.isDarkThemeForCubit,
  });

  /// Factory method for the initial state of the app settings.
  factory AppSettingsStateOnBloc.initial() {
    return const AppSettingsStateOnBloc(
      isAppSettingsUsingBloc: true,
      isDarkThemeForBloc: false,
      isDarkThemeForCubit: false,
    );
  }

  /// Creates a copy of the current state with optional overrides.
  AppSettingsStateOnBloc copyWith({
    bool? isUseBloc,
    bool? isDarkThemeForBloc,
    bool? isDarkThemeForCubit,
  }) {
    return AppSettingsStateOnBloc(
      isAppSettingsUsingBloc: isUseBloc ?? isAppSettingsUsingBloc,
      isDarkThemeForBloc: isDarkThemeForBloc ?? this.isDarkThemeForBloc,
      isDarkThemeForCubit: isDarkThemeForCubit ?? this.isDarkThemeForCubit,
    );
  }

  @override
  List<Object> get props =>
      [isAppSettingsUsingBloc, isDarkThemeForBloc, isDarkThemeForCubit];
}
