import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

///  [AppSettingsOnBloc] manages application settings using the BLoC pattern
/// with persistent state management through [HydratedBloc].
///
/// This BLoC allows toggling between **BLoC** and **Cubit** state management
/// and switching between **light** and **dark** themes.
class AppSettingsOnBloc
    extends HydratedBloc<AppSettingsEvents, AppSettingsOnBlocState> {
  /// 🆕 Initializes the BLoC with the initial state and sets up event handlers.
  AppSettingsOnBloc() : super(AppSettingsOnBlocState.initial()) {
    /// 🔁 Toggles between BLoC and Cubit state management modes.
    on<ToggleUseBlocEvent>((event, emit) {
      emit(state.copyWith(isUseBloc: !state.isUsingBlocForAppFeatures));
    });

    /// 🔁 🎨 Toggles the theme between light and dark modes.
    /// Updates either `isDarkThemeForBloc` or `isDarkThemeForCubit` based on the active state manager.
    on<ToggleThemeEvent>((event, emit) {
      emit(state.isUsingBlocForAppFeatures
          ? state.copyWith(isDarkThemeForBloc: event.isDarkMode)
          : state.copyWith(isDarkThemeForCubit: event.isDarkMode));
    });
  }

  /// 💾 Persists the current state into a JSON object using `HydratedBloc` storage.
  @override
  Map<String, dynamic>? toJson(AppSettingsOnBlocState state) => {
        'isUsingBlocForAppFeatures': state.isUsingBlocForAppFeatures,
        'isDarkThemeForBloc': state.isDarkThemeForBloc,
        'isDarkThemeForCubit': state.isDarkThemeForCubit,
      };

  /// 💾 Restores the state from a JSON object during app startup.
  /// Handles potential errors and defaults to the initial state if deserialization fails.
  @override
  AppSettingsOnBlocState? fromJson(Map<String, dynamic> json) {
    try {
      return AppSettingsOnBlocState(
        isUsingBlocForAppFeatures:
            json['isUsingBlocForAppFeatures'] as bool? ?? true,
        isDarkThemeForBloc: json['isDarkThemeForBloc'] as bool? ?? false,
        isDarkThemeForCubit: json['isDarkThemeForCubit'] as bool? ?? false,
      );
    } catch (e) {
      print('⚠️ Error restoring AppSettingsOnBloc state: $e');
      return AppSettingsOnBlocState.initial();
    }
  }
}
