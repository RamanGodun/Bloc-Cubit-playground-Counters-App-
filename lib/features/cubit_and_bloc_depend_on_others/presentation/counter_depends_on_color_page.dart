import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../../core/config/app_config.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_constants.dart';

/* State Management */
import '../../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart';
import '../../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/utilities/helpers.dart';
import '../domain/_state_switching_of_counter_which_depends_on_color/factory_for_counter_which_depends_on_color.dart';
import '../domain/color_on_bloc/color_bloc.dart';
import '../domain/color_on_cubit/color_cubit.dart';
import '../domain/counter_on_bloc/counter_bloc.dart';
import '../domain/counter_on_cubit/counter_which_depends_on_color_cubit.dart';

/* UI components */
import '../../../presentation/widgets/custom_elevated_button.dart';
import '../../../presentation/widgets/text_widget.dart';
part 'counter_display_w.dart';

/// 🟢 [CounterDependsOnColorPage] dynamically handles counter and color states using BLoC or Cubit.
class CounterDependsOnColorPage extends StatelessWidget {
  const CounterDependsOnColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🛠️ Creates a manager for handling counter and color logic.
    final counterManager = CounterDependsOnColorFactory.create(context);

    /// 🔍 Determines if the app uses BLoC or Cubit for state management.
    final isUsingBlocForAppFeatures = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures,
          )
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures,
          );

    /// 🎨 Retrieves the current background color from the active state manager.
    final backgroundColor = isUsingBlocForAppFeatures
        ? context.select<ColorOnBloc, Color>((bloc) => bloc.state.color)
        : context.select<ColorOnCubit, Color>((cubit) => cubit.state.color);

    /// 🎨
    final isDarkMode = isUsingBlocForAppFeatures
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isDarkThemeForBloc)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isDarkThemeForCubit);

    /// 📄 Sets the app bar title based on the state management strategy.
    final appBarText = isUsingBlocForAppFeatures
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;

    ///
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextWidget(
          appBarText,
          TextType.titleSmall,
          color: AppConstants.darkForegroundColor,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode
                  ? AppConstants.darkModeIcon
                  : AppConstants.lightModeIcon,
              color: Helpers.getColorScheme(context).primary,
            ),
            onPressed: () => Helpers.pushNamed(context, RouteNames.themePage),
            tooltip: AppStrings.toggleThemeButton,
          ),
          IconButton(
            icon: Icon(
              isUsingBlocForAppFeatures
                  ? AppConstants.syncIcon
                  : AppConstants.changeCircleIcon,
              color: Helpers.getColorScheme(context).primary,
            ),
            onPressed: () => AppConfig.isAppSettingsOnBlocStateShape
                ? context.read<AppSettingsOnBloc>().add(ToggleUseBlocEvent())
                : context.read<AppSettingsOnCubit>().toggleUseBloc(),
            tooltip:
                'Switch to ${isUsingBlocForAppFeatures ? 'Cubit' : 'BLoC'} Mode',
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppConstants.largePadding,
        children: [
          AppElevatedButton(
            label: AppStrings.changeColor,
            onPressed: counterManager.changeColor,
          ),
          const CounterDisplayWidget(),
          AppElevatedButton(
            label: AppStrings.changeCounter,
            onPressed: counterManager.changeCounter,
          ),
        ],
      ),
    );
  }
}
