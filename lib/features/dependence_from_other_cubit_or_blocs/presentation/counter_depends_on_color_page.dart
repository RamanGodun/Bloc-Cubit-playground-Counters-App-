import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../../core/app_settings_state_management/ui_settings_state/ui_settings_cubit.dart';
import '../../../core/config/app_config.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/app_constants/app_constants.dart';

/* State Management */
import '../../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart';
import '../../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/utilities/helpers.dart';
import '../domain/_state_switching_of_counter_which_depends_on_color/factory_for_counter_which_depends_on_color.dart';

import '../domain/counter_on_bloc/counter_bloc.dart';
import '../domain/counter_on_cubit/counter_which_depends_on_color_cubit.dart';

/* UI components */
import '../../../presentation/widgets/custom_elevated_button.dart';
import '../../../presentation/widgets/text_widget.dart';
part 'counter_display_w.dart';

class PageToShowDependenceFromOtherCubitsOrBlocs extends StatelessWidget {
  const PageToShowDependenceFromOtherCubitsOrBlocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextWidget(
              'Dependence from other BLoCs', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 25,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextWidget(
                'This page demonstrates BLoC/Cubit dependencies on other BLoC/Cubit.',
                TextType.titleMedium,
              ),
            ),
            const Divider(),
            AppElevatedButton(
              label: AppStrings.goToCounterDependsOnColor,
              onPressed: () =>
                  Helpers.pushNamed(context, RouteNames.counterDependsOnColor),
            ),
            AppElevatedButton(
              label: AppStrings.toCounterThatDependsOnInternet,
              onPressed: () => Helpers.pushNamed(
                  context, RouteNames.counterThatDependsOnInternet),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🟢 [ViewToShowDependenceFromOtherCubitsOrBlocs] dynamically handles counter and color states using BLoC or Cubit.
class PageForCounterThatDependsOnColor extends StatelessWidget {
  const PageForCounterThatDependsOnColor({super.key});

  @override
  Widget build(BuildContext context) {
    final counterManager = CounterDependsOnColorFactory.create(context);

    return BlocBuilder<UiSettingsCubit, UiSettingsState>(
      builder: (context, uiState) {
        return Scaffold(
          backgroundColor: uiState.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: TextWidget(
              uiState.appBarTitle,
              TextType.titleSmall,
              color: AppConstants.darkForegroundColor,
            ),
            actions: [
              IconButton(
                icon: Icon(
                  uiState.isDarkMode
                      ? AppConstants.darkModeIcon
                      : AppConstants.lightModeIcon,
                  color: Helpers.getColorScheme(context).primary,
                ),
                onPressed: () =>
                    Helpers.pushNamed(context, RouteNames.themePage),
                tooltip: AppStrings.toggleThemeButton,
              )
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
      },
    );
  }
}
