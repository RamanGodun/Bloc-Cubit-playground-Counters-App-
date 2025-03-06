part of 'app_settings_bloc.dart';

/// State class for managing application settings within the BLoC architecture.
class AppSettingsOnBlocState extends Equatable {
  /// Indicates whether the app is using BLoC for state management.
  final bool isUsingBlocForAppFeatures;

  /// Manages dark mode state when using BLoC or Cubit
  final bool isDarkThemeForBloc;
  final bool isDarkThemeForCubit;

  const AppSettingsOnBlocState({
    required this.isUsingBlocForAppFeatures,
    required this.isDarkThemeForBloc,
    required this.isDarkThemeForCubit,
  });

  /// Factory method for the initial state of the app settings.
  factory AppSettingsOnBlocState.initial() {
    return const AppSettingsOnBlocState(
      isUsingBlocForAppFeatures: true,
      isDarkThemeForBloc: false,
      isDarkThemeForCubit: false,
    );
  }

  /// Creates a copy of the current state with optional overrides.
  AppSettingsOnBlocState copyWith({
    bool? isUseBloc,
    bool? isDarkThemeForBloc,
    bool? isDarkThemeForCubit,
  }) {
    return AppSettingsOnBlocState(
      isUsingBlocForAppFeatures: isUseBloc ?? isUsingBlocForAppFeatures,
      isDarkThemeForBloc: isDarkThemeForBloc ?? this.isDarkThemeForBloc,
      isDarkThemeForCubit: isDarkThemeForCubit ?? this.isDarkThemeForCubit,
    );
  }

  @override
  List<Object> get props =>
      [isUsingBlocForAppFeatures, isDarkThemeForBloc, isDarkThemeForCubit];
}
