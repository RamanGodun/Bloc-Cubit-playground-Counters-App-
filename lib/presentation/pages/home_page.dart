import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_settings_state_management/ui_settings_state/ui_settings_cubit.dart';
import '../../core/exports/core_config_export.dart';
import '../../core/exports/cubits_and_blocs_exports.dart'
    show AppSettingsOnBloc, AppSettingsOnCubit, ToggleUseBlocEvent;
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_buttons/app_elevated_button.dart';
import '../widgets/header_text.dart';

/// 🏠 [HomePage] — root screen for navigating between feature demos.
/// Initializes [UiSettingsCubit] to configure dynamic UI elements (theme, state manager).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => UiSettingsCubit(ctx),
      child: const _ViewForHomePage(),
    );
  }
}

/// 🧩 [_ViewForHomePage] — UI view that reflects current settings state.
/// Dynamically updates AppBar content and handles app settings interactions.
class _ViewForHomePage extends StatelessWidget {
  const _ViewForHomePage();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<UiSettingsCubit>().state;
    final isUsingBlocForAppFeatures = settings.isUsingBlocForFeatures;
    final isDarkMode = settings.isDarkMode;

    return Scaffold(
      appBar: CustomAppBar(
        isCenteredTitle: true,
        title: isUsingBlocForAppFeatures
            ? AppStrings.appIsOnBloc
            : AppStrings.appIsOnCubit,
        actionIcons: [
          isDarkMode ? AppConstants.darkModeIcon : AppConstants.lightModeIcon,
          isUsingBlocForAppFeatures
              ? AppConstants.syncIcon
              : AppConstants.changeCircleIcon,
        ],
        actionCallbacks: [
          () => Helpers.pushNamed(context, RouteNames.themePage),
          () => AppConfig.isAppSettingsOnBlocStateShape
              ? context.read<AppSettingsOnBloc>().add(ToggleUseBlocEvent())
              : context.read<AppSettingsOnCubit>().toggleUseBloc()
        ],
      ),
      body: const _ButtonsListForGoToFeaturesPages(),
    );
  }
}

/// 📦 [_ButtonsListForGoToFeaturesPages] — list of navigation buttons
/// to demonstrate different feature implementations using Bloc/Cubit.
class _ButtonsListForGoToFeaturesPages extends StatelessWidget {
  const _ButtonsListForGoToFeaturesPages();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const HeaderText(
            headlineText: AppStrings.exploreFeatures,
            subTitleText: AppStrings.smashThoseButtons,
          ),

          /// Navigation to feature pages
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
            label: AppStrings.hydratedBlocCounterButton,
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

          const SizedBox(height: AppConstants.hugePadding)
        ],
      ),
    );
  }
}
