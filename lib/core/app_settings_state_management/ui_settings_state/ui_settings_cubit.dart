import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cubit_and_bloc_depend_on_others/domain/color_on_bloc/color_bloc.dart';
import '../../../features/cubit_and_bloc_depend_on_others/domain/color_on_cubit/color_cubit.dart';
import '../../app_constants/app_strings.dart';
import '../../config/app_config.dart';
import '../app_settings_on_bloc/app_settings_bloc.dart';
import '../app_settings_on_cubit/app_settings_cubit.dart';

part 'ui_settings_state.dart';

class UiSettingsCubit extends Cubit<UiSettingsState> {
  final BuildContext context;

  UiSettingsCubit(this.context) : super(_initState(context));

  static UiSettingsState _initState(BuildContext context) {
    final isBloc = AppConfig.isAppSettingsOnBlocStateShape
        ? context.read<AppSettingsOnBloc>().state.isUsingBlocForAppFeatures
        : context.read<AppSettingsOnCubit>().state.isUsingBlocForAppFeatures;

    final isDark = isBloc
        ? context.read<AppSettingsOnBloc>().state.isDarkThemeForBloc
        : context.read<AppSettingsOnCubit>().state.isDarkThemeForCubit;

    final color = isBloc
        ? context.read<ColorOnBloc>().state.color
        : context.read<ColorOnCubit>().state.color;

    return UiSettingsState(
      isUsingBloc: isBloc,
      isDarkMode: isDark,
      backgroundColor: color,
      appBarTitle: isBloc
          ? AppStrings.counterPageTitleOnBloc
          : AppStrings.counterPageTitleOnCubit,
    );
  }
}
