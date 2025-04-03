import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/counter_that_depends_on_color/domain/color_on_bloc/color_bloc.dart';
import '../../../features/counter_that_depends_on_color/domain/color_on_cubit/color_cubit.dart';
import '../../app_constants/app_strings.dart';
import '../../config/app_config.dart';
import '../app_settings_on_bloc/app_settings_bloc.dart';
import '../app_settings_on_cubit/app_settings_cubit.dart';

part 'ui_settings_state.dart';

/// {@template ui_settings_cubit}
/// Manages UI-specific settings such as theme, background color, and title,
/// depending on the current AppSettings configuration (Bloc or Cubit).
///
/// It listens to both AppSettings and (optionally) Color state managers,
/// and reacts to switching between Bloc/Cubit at runtime.
/// {@endtemplate}
class UiSettingsCubit extends Cubit<UiSettingsState> {
  final BuildContext context;
  final List<StreamSubscription> _subscriptions = [];

  /// Initializes [UiSettingsCubit] and starts reactive subscriptions.
  UiSettingsCubit(this.context) : super(_initState(context)) {
    _subscribeToSettings();
  }

  /// Determines which state manager (Bloc or Cubit) is currently active for feature-level configuration.
  static bool _isUsingBloc(BuildContext context) =>
      AppConfig.isAppSettingsOnBlocStateShape
          ? context.read<AppSettingsOnBloc>().state.isUsingBlocForAppFeatures
          : context.read<AppSettingsOnCubit>().state.isUsingBlocForAppFeatures;

  /// Computes the initial UI state based on the current AppSettings and Color state.
  static UiSettingsState _initState(BuildContext context) {
    final isUsingBloc = _isUsingBloc(context);

    final backgroundColor = isUsingBloc
        ? context.read<ColorOnBloc?>()?.state.color ??
            Theme.of(context).scaffoldBackgroundColor
        : context.read<ColorOnCubit?>()?.state.color ??
            Theme.of(context).scaffoldBackgroundColor;

    final isDarkMode = isUsingBloc
        ? context.read<AppSettingsOnBloc>().state.isDarkThemeForBloc
        : context.read<AppSettingsOnCubit>().state.isDarkThemeForCubit;

    final appBarText = isUsingBloc
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;

    return UiSettingsState(
      isUsingBlocForFeatures: isUsingBloc,
      isDarkMode: isDarkMode,
      backgroundColor: backgroundColor,
      appBarTitle: appBarText,
    );
  }

  /// Subscribes to the active AppSettings stream and switches listeners
  /// when the feature manager (Bloc/Cubit) is changed.
  void _subscribeToSettings() {
    _subscribeToCurrentManager();

    final sourceStream = AppConfig.isAppSettingsOnBlocStateShape
        ? context.read<AppSettingsOnBloc>().stream
        : context.read<AppSettingsOnCubit>().stream;

    _subscriptions.add(
      sourceStream.listen((state) {
        final isBlocNow = AppConfig.isAppSettingsOnBlocStateShape
            ? (state as AppSettingsOnBlocState).isUsingBlocForAppFeatures
            : (state as AppSettingsOnCubitState).isUsingBlocForAppFeatures;

        _handleManagerSwitch(isBlocNow);
      }),
    );
  }

  /// Handles the Bloc/Cubit switching by unsubscribing from old sources
  /// and subscribing to the new state manager.
  void _handleManagerSwitch(bool isUsingBlocNow) {
    final current = state.isUsingBlocForFeatures;
    if (isUsingBlocNow != current) {
      for (final sub in _subscriptions) {
        sub.cancel();
      }
      _subscriptions.clear();
      _subscribeToCurrentManager();
      _updateState();
    }
  }

  /// Subscribes to AppSettings and optional Color state streams, based on the active feature manager (Bloc/Cubit)
  void _subscribeToCurrentManager() {
    final isUsingBloc = _isUsingBloc(context);

    if (isUsingBloc) {
      _subscriptions.addAll([
        context.read<AppSettingsOnBloc>().stream.listen((_) => _updateState()),
        if (context.read<ColorOnBloc?>() case final bloc?)
          bloc.stream.listen((_) => _updateState()),
      ]);
    } else {
      _subscriptions.addAll([
        context.read<AppSettingsOnCubit>().stream.listen((_) => _updateState()),
        if (context.read<ColorOnCubit?>() case final cubit?)
          cubit.stream.listen((_) => _updateState()),
      ]);
    }
  }

  /// Emits a new [UiSettingsState] based on current dependencies.
  void _updateState() => emit(_initState(context));

  /// Cancels all active subscriptions to avoid memory leaks.
  @override
  Future<void> close() async {
    for (final sub in _subscriptions) {
      await sub.cancel();
    }
    return super.close();
  }
}
