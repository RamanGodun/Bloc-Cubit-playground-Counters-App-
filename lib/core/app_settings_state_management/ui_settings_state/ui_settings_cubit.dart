import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/dependence_from_other_cubit_or_blocs/domain/color_on_bloc/color_bloc.dart';
import '../../../features/dependence_from_other_cubit_or_blocs/domain/color_on_cubit/color_cubit.dart';
import '../../app_constants/app_strings.dart';
import '../../config/app_config.dart';
import '../app_settings_on_bloc/app_settings_bloc.dart';
import '../app_settings_on_cubit/app_settings_cubit.dart';

part 'ui_settings_state.dart';

class UiSettingsCubit extends Cubit<UiSettingsState> {
  final BuildContext context;
  final List<StreamSubscription> _subscriptions = [];

  UiSettingsCubit(this.context) : super(_initState(context)) {
    final isUsingBlocForFeatures = AppConfig.isAppSettingsOnBlocStateShape
        ? context.read<AppSettingsOnBloc>().state.isUsingBlocForAppFeatures
        : context.read<AppSettingsOnCubit>().state.isUsingBlocForAppFeatures;

    if (isUsingBlocForFeatures) {
      _subscriptions.addAll([
        context.read<AppSettingsOnBloc>().stream.listen((_) => _updateState()),
        context.read<ColorOnBloc>().stream.listen((_) => _updateState()),
      ]);
    } else {
      _subscriptions.addAll([
        context.read<AppSettingsOnCubit>().stream.listen((_) => _updateState()),
        context.read<ColorOnCubit>().stream.listen((_) => _updateState()),
      ]);
    }
  }

  static UiSettingsState _initState(BuildContext context) {
    final isUsingBlocForFeatures = AppConfig.isAppSettingsOnBlocStateShape
        ? context.read<AppSettingsOnBloc>().state.isUsingBlocForAppFeatures
        : context.read<AppSettingsOnCubit>().state.isUsingBlocForAppFeatures;

    final backgroundColor = isUsingBlocForFeatures
        ? context.read<ColorOnBloc>().state.color
        : context.read<ColorOnCubit>().state.color;

    final isDarkMode = isUsingBlocForFeatures
        ? context.read<AppSettingsOnBloc>().state.isDarkThemeForBloc
        : context.read<AppSettingsOnCubit>().state.isDarkThemeForCubit;

    final appBarText = isUsingBlocForFeatures
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;

    return UiSettingsState(
      isUsingBlocForFeatures: isUsingBlocForFeatures,
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
