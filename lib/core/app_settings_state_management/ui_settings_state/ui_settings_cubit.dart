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

class UiSettingsCubit extends Cubit<UiSettingsState> {
  final BuildContext context;
  final List<StreamSubscription> _subscriptions = [];

  UiSettingsCubit(this.context) : super(_initState(context)) {
    final isUsingBloc = _isUsingBloc(context);

    if (isUsingBloc) {
      _subscriptions.addAll([
        context.read<AppSettingsOnBloc>().stream.listen((_) => _updateState()),
        if (context.read<ColorOnBloc?>() case final bloc?) // if exists
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

  static bool _isUsingBloc(BuildContext context) =>
      AppConfig.isAppSettingsOnBlocStateShape
          ? context.read<AppSettingsOnBloc>().state.isUsingBlocForAppFeatures
          : context.read<AppSettingsOnCubit>().state.isUsingBlocForAppFeatures;

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

  void _updateState() => emit(_initState(context));

  @override
  Future<void> close() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    return super.close();
  }
}
