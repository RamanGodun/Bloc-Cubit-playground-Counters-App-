import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_config.dart';
import 'counter_manager.dart';

/* BLoC */
import '../../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart'
    as bloc_state;
import '../counter_on_bloc/counter_bloc.dart';

/* Cubit */
import '../../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart'
    as cubit_state;
import '../counter_on_cubit/counter_cubit.dart';

/// 🏭 [CounterFactory] is responsible for creating the appropriate [CounterManager]
/// based on the state management strategy (BLoC or Cubit).
class CounterFactory {
  /// 🔄 Creates an instance of [CounterManager] based on the [isCounterOnBloc] flag.

  /// 📥 [context] is the current [BuildContext] used for dependency injection.
  static CounterManager create(BuildContext context,
      {required bool isCounterOnBloc}) {
    return isCounterOnBloc
        ? BlocCounterManager(context.read<CounterOnBloc>())
        : CubitCounterManager(context.read<CounterOnCubit>());
  }

  /// 🔍 Determines if the app should use BLoC or Cubit for state management of feature.
  ///
  /// The method selects the current strategy based on whether [isAppSettingsOnBloc] is `true`.
  /// When `true`, it fetches the state from [AppSettingsOnBloc].
  /// Otherwise, it fetches from [AppSettingsOnCubit].
  ///
  /// 📥 [context] is the current [BuildContext] used to access the correct provider.
  static bool isCounterOnBloc(BuildContext context,
      {required bool isAppSettingsOnBloc}) {
    try {
      return isAppSettingsOnBloc
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
