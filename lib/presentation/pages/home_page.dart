import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/core_config_export.dart';

/* State Management */
import '../../core/app_settings_managing/app_settings_on_cubit/app_settings_cubit.dart';
import '../../core/app_settings_managing/app_settings_on_bloc/app_settings_bloc.dart';

/* UI Components */
import '../../presentation/widgets/text_widget.dart';
import '../widgets/custom_elevated_button.dart';

/// 🏠 [HomePage] is the main entry point for navigating through the app features.
/// It dynamically switches between BLoC and Cubit state management based on [AppConfig].
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 Determine if the app uses BLoC or Cubit for state management
    final isUsingBlocForAppFeatures = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures);

    final isDarkMode = isUsingBlocForAppFeatures
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isDarkThemeForBloc)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isDarkThemeForCubit);
/*
? Alternative: 
  // 🔍 Determine if the app uses BLoC or Cubit for state management
    final state = AppConfig.isAppSettingsOnBlocStateShape
        ? context.watch<AppSettingsOnBloc>().state
        : context.watch<AppSettingsOnCubit>().state;

  !  // ⚠️ Casting to dynamic is used to avoid type issues
  !  // Be careful: Incorrect state casting might cause runtime exceptions
    final isUseBloc = (state as dynamic).isUsingBlocForAppFeatures;
    final isDarkMode = isUseBloc
        ? (state as dynamic).isDarkThemeForBloc
        : (state as dynamic).isDarkThemeForCubit;
 */

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextWidget(
            isUsingBlocForAppFeatures
                ? AppStrings.appIsOnBloc
                : AppStrings.appIsOnCubit,
            TextType.titleMedium,
          ),
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
      body: const ButtonsList(),
    );
  }
}

class ButtonsList extends StatelessWidget {
  const ButtonsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderText(),
          const SizedBox(height: AppConstants.largePadding),
          // 🚀 Navigation Buttons using `AppElevatedButton`
          AppElevatedButton(
            label: AppStrings.goToCounterPage,
            onPressed: () => Helpers.pushNamed(context, RouteNames.counterPage),
          ),
          AppElevatedButton(
            label: AppStrings.goToCounterDependsOnColor,
            onPressed: () =>
                Helpers.pushNamed(context, RouteNames.counterDependsOnColor),
          ),
          AppElevatedButton(
            label: AppStrings.hydratedBlocCounter,
            onPressed: () =>
                Helpers.pushNamed(context, RouteNames.counterHydrated),
          ),
          AppElevatedButton(
            label: AppStrings.toStateAccessPage,
            onPressed: () => Helpers.pushNamed(context, RouteNames.blocAccess),
          ),
          AppElevatedButton(
            label: AppStrings.eventTransformers,
            onPressed: () => Helpers.pushNamed(
              context,
              RouteNames.counterEventTransformerDemo,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final textColor =
        Helpers.getColorScheme(context).onSurface.withOpacity(0.7);
    return Column(
      children: [
        TextWidget(
          AppStrings.exploreFeatures,
          TextType.headline,
          color: textColor,
        ),
        const SizedBox(height: 4),
        TextWidget(
          AppStrings.smashThoseButtons,
          TextType.titleMedium,
          color: textColor,
        ),
      ],
    );
  }
}
