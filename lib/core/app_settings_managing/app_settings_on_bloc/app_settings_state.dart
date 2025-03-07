part of 'app_settings_bloc.dart';

/// 🗂️ **[AppSettingsOnBlocState]** - Manages the state of application settings within the BLoC architecture.
///
/// Includes theme preferences and the selected state management mode (BLoC or Cubit).
class AppSettingsOnBlocState extends Equatable {
  /// 🔄 Indicates if the app is using BLoC for state management.
  final bool isUsingBlocForAppFeatures;

  /// 🌗 Manages dark mode state when using BLoC or Cubit.
  final bool isDarkThemeForBloc;
  final bool isDarkThemeForCubit;

  /// 🚀 Constructor for initializing the state with all required properties.
  const AppSettingsOnBlocState({
    required this.isUsingBlocForAppFeatures,
    required this.isDarkThemeForBloc,
    required this.isDarkThemeForCubit,
  });

  /// 🆕 Factory method for creating the **initial state** of app settings.
  /// - `isUsingBlocForAppFeatures`: Defaults to **true** (BLoC is the primary state management).
  /// - `isDarkThemeForBloc` & `isDarkThemeForCubit`: Defaults to **false** (Light mode).
  factory AppSettingsOnBlocState.initial() {
    return const AppSettingsOnBlocState(
      isUsingBlocForAppFeatures: true,
      isDarkThemeForBloc: false,
      isDarkThemeForCubit: false,
    );
  }

  /// 🧬 **[copyWith]** method to create a new state instance with optional overrides.
  /// This method maintains immutability and allows selective updates to state properties.
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

  /// ⚖️ Properties used for equality checks to ensure proper state comparison.
  @override
  List<Object> get props =>
      [isUsingBlocForAppFeatures, isDarkThemeForBloc, isDarkThemeForCubit];
}
