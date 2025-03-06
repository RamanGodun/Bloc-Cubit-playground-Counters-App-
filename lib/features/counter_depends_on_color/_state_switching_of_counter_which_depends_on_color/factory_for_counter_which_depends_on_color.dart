import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_settings_managing/app_config.dart';

/* BLoC */
import '../counter_on_bloc/counter_bloc.dart';
import '../color_on_bloc/color_bloc.dart';
import '../../../core/app_settings_managing/app_settings_on_bloc/app_settings_bloc.dart'
    as bloc_state;

/* CUBIT */
import '../../../core/app_settings_managing/app_settings_on_cubit/app_settings_cubit.dart'
    as cubit_state;
import '../counter_on_cubit/counter_which_depends_on_color_cubit.dart';
import '../color_on_cubit/color_cubit.dart';

import 'counter_depends_on_color_manager.dart';

/// 🟢 [CounterDependsOnColorFactory] creates the appropriate manager based on state management strategy (BLoC or Cubit).
class CounterDependsOnColorFactory {
  /// 🟢 Creates a [CounterDependsOnColorManager] using BLoC or Cubit.
  ///
  /// Automatically selects the state management strategy using `context.select()`
  /// to avoid unnecessary rebuilds of the widget tree.
  static CounterDependsOnColorManager create(BuildContext context) {
    final bool isCounterOnBloc = _isCounterOnBloc(context);

    return isCounterOnBloc
        ? BlocCounterDependsOnColorManager(
            context.read<CounterBlocWhichDependsOnColorBLoC>(),
            context.read<ColorOnBloc>(),
          )
        : CubitCounterDependsOnColorManager(
            context.read<CounterCubitWhichDependsOnColorCubit>(),
            context.read<ColorOnCubit>(),
          );
  }

  /// Determines if the app should use BLoC or Cubit for state management.
  ///
  /// The method selects the current strategy based on whether [isAppSettingsOnBloc] is `true`.
  /// When [isAppSettingsOnBloc] is `true`, it fetches the state from [AppSettingsOnBloc].
  /// Otherwise, it fetches from [AppSettingsOnCubit].
  ///
  /// [context] is the current [BuildContext] used to access the correct provider.
  static bool _isCounterOnBloc(BuildContext context) {
    try {
      return AppConfig.isAppSettingsOnBlocStateShape
          ? context
              .read<bloc_state.AppSettingsOnBloc>()
              .state
              .isUsingBlocForAppFeatures
          : context
              .read<cubit_state.AppSettingsOnCubit>()
              .state
              .isUsingBlocForAppFeatures;
    } catch (e) {
      debugPrint('⚠️ Provider not found: $e');
      return AppConfig.isAppSettingsOnBlocStateShape;
    }
  }
}
