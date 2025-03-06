import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_settings_state.dart';

/// A HydratedCubit responsible for managing application settings
/// using Cubit state management.
class AppSettingsOnCubit extends HydratedCubit<AppSettingsOnCubitState> {
  /// Initializes the Cubit with the default or hydrated state.
  AppSettingsOnCubit() : super(AppSettingsOnCubitState.initial());

  /// Toggles between BLoC and Cubit state management.
  void toggleUseBloc() {
    final newUseBloc = !state.isUsingBlocForAppFeatures;
    emit(state.copyWith(isUseBloc: newUseBloc));
  }

  /// Toggles the theme between light and dark mode based on the current state.
  /// The change is applied to either BLoC or Cubit theme state depending on `isUseBloc`.
  void toggleTheme(bool isDarkMode) {
    if (state.isUsingBlocForAppFeatures) {
      emit(state.copyWith(isDarkThemeForBloc: isDarkMode));
    } else {
      emit(state.copyWith(isDarkThemeForCubit: isDarkMode));
    }
  }

  /// Converts the current Cubit state to a JSON map for persistent storage.
  @override
  Map<String, dynamic>? toJson(AppSettingsOnCubitState state) {
    return {
      'isUsingBlocForAppFeatures': state.isUsingBlocForAppFeatures,
      'isDarkThemeForBloc': state.isDarkThemeForBloc,
      'isDarkThemeForCubit': state.isDarkThemeForCubit,
    };
  }

  /// Restores the Cubit state from a JSON map during application startup.
  @override
  AppSettingsOnCubitState? fromJson(Map<String, dynamic> json) {
    return AppSettingsOnCubitState(
      isUsingBlocForAppFeatures:
          json['isUsingBlocForAppFeatures'] as bool? ?? true,
      isDarkThemeForBloc: json['isDarkThemeForBloc'] as bool? ?? false,
      isDarkThemeForCubit: json['isDarkThemeForCubit'] as bool? ?? false,
    );
  }
}
