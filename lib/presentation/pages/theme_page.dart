import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exports/core_config_export.dart';

/* State management */
import '../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart';
import '../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart';

/* Presentation */
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_buttons/app_elevated_button.dart';

/// 🌓 [ThemePage] allows toggling between light and dark themes.
class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures
                ? bloc.state.isDarkThemeForBloc
                : bloc.state.isDarkThemeForCubit,
          )
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures
                ? cubit.state.isDarkThemeForBloc
                : cubit.state.isDarkThemeForCubit,
          );

    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.themeScreenTitle),
      body: Center(
        child: AppElevatedButton(
          label: AppStrings.toggleThemeButton,
          onPressed: () => _toggleTheme(context, isDarkMode),
        ),
      ),
    );
  }

  /// 🕹️ Toggles the theme between light and dark.
  void _toggleTheme(BuildContext context, bool isDarkMode) {
    if (AppConfig.isAppSettingsOnBlocStateShape) {
      context
          .read<AppSettingsOnBloc>()
          .add(ToggleThemeEvent(isDarkMode: !isDarkMode));
    } else {
      context.read<AppSettingsOnCubit>().toggleTheme(!isDarkMode);
    }
    print('Theme toggled to ${!isDarkMode ? 'Dark' : 'Light'} mode');
  }
}
