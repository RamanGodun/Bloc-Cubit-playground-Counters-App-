import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* BLoC */
import '../../../core/app_settings_managing/app_settings_on_bloc/app_settings_bloc.dart'
    as bloc_state;
import '../counter_on_bloc/counter_bloc.dart';

/* Cubit */
import '../../../core/app_settings_managing/app_settings_on_cubit/app_settings_cubit.dart'
    as cubit_state;
import '../counter_on_cubit/counter_cubit.dart';

import 'counter_manager.dart';

/// A factory class responsible for creating the appropriate [CounterManager]
/// based on the state management strategy (BLoC or Cubit).
class CounterFactory {
  /// Creates an instance of [CounterManager] based on the [useBloc] flag.
  ///
  /// When [useBloc] is `true`, a [BlocCounterManager] is returned.
  /// Otherwise, a [CubitCounterManager] is created.
  ///
  /// [context] is the current [BuildContext] used for dependency injection.
  static CounterManager create(BuildContext context, {required bool useBloc}) {
    return useBloc
        ? BlocCounterManager(context.read<CounterOnBloc>())
        : CubitCounterManager(context.read<CounterOnCubit>());
  }

  /// Determines if the app should use BLoC or Cubit for state management.
  ///
  /// The method selects the current strategy based on whether [isBlocActive] is `true`.
  /// When [isBlocActive] is `true`, it fetches the state from [AppSettingsOnBloc].
  /// Otherwise, it fetches from [AppSettingsOnCubit].
  ///
  /// [context] is the current [BuildContext] used to access the correct provider.
  static bool isUseBloc(BuildContext context, {required bool isBlocActive}) {
    return isBlocActive
        ? context
            .read<bloc_state.AppSettingsOnBloc>()
            .state
            .isAppSettingsUsingBloc
        : context
            .read<cubit_state.AppSettingsOnCubit>()
            .state
            .isAppSettingsUsingBloc;
  }
}
