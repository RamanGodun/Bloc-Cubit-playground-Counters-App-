import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Core */
import '../../core/app_settings_managing/app_config.dart';
import '../../core/config/constants/app_strings.dart';
import '../../core/app_settings_managing/app_settings_on_cubit/app_settings_cubit.dart';
import '../../core/app_settings_managing/app_settings_on_bloc/app_settings_bloc.dart';

/* Presentation */
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_widget.dart';

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
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.themeScreenTitle,
          TextType.titleSmall,
        ),
      ),
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
