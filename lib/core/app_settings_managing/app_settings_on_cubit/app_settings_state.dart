part of 'app_settings_cubit.dart';

/// Represents the state for application settings managed by [AppSettingsOnCubit].
/// It includes whether the app is using BLoC or Cubit, and the theme settings for both approaches.
class AppSettingsOnCubitState extends Equatable {
  /// Indicates whether the app uses BLoC or Cubit state management.
  final bool isUsingBlocForAppFeatures;

  /// Stores the dark theme preference when using BLoC or Cubit
  final bool isDarkThemeForBloc;
  final bool isDarkThemeForCubit;

  const AppSettingsOnCubitState({
    required this.isUsingBlocForAppFeatures,
    required this.isDarkThemeForBloc,
    required this.isDarkThemeForCubit,
  });

  /// Returns the initial state with default values.
  /// Defaults to BLoC as the state management approach with light themes.
  factory AppSettingsOnCubitState.initial() {
    return const AppSettingsOnCubitState(
      isUsingBlocForAppFeatures: true,
      isDarkThemeForBloc: false,
      isDarkThemeForCubit: false,
    );
  }

  /// Creates a new state instance with the option to override specific values.
  /// This method maintains immutability by returning a new instance instead of modifying the existing state.
  AppSettingsOnCubitState copyWith({
    bool? isUseBloc,
    bool? isDarkThemeForBloc,
    bool? isDarkThemeForCubit,
  }) {
    return AppSettingsOnCubitState(
      isUsingBlocForAppFeatures: isUseBloc ?? isUsingBlocForAppFeatures,
      isDarkThemeForBloc: isDarkThemeForBloc ?? this.isDarkThemeForBloc,
      isDarkThemeForCubit: isDarkThemeForCubit ?? this.isDarkThemeForCubit,
    );
  }

  /// Properties used for equality checks to ensure proper state comparison.
  @override
  List<Object> get props =>
      [isUsingBlocForAppFeatures, isDarkThemeForBloc, isDarkThemeForCubit];
}
