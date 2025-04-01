import 'package:countersapp_bloccubit_playground/core/routing/routes_for_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_constants/app_constants.dart';
import '../../core/app_constants/app_strings.dart';
import '../../core/utilities/helpers.dart';
import '../../presentation/widgets/floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/custom_elevated_button.dart';
import '../../features/cubit_access/counter_for_route_access/route_access_cubit.dart';

/// 🟢 [MainPage4RouteAccessFeature] displays and manages the counter value with routing to other pages.
class MainPage4RouteAccessFeature extends StatelessWidget {
  const MainPage4RouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.appBarTitleForContextAccessPage,
          TextType.titleSmall,
        ),
      ),
      body: BlocConsumer<RouteAccessCounterCubit, RouteAccessCounterState>(
        listener: (context, state) {
          final wasIncremented = state.wasIncremented;
          if (wasIncremented != null) {
            final text = wasIncremented
                ? AppStrings.incrementedText
                : AppStrings.decrementedText;
            Helpers.showStyledSnackBar(context: context, message: text);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largePadding,
            children: [
              const TextWidget(
                AppStrings.counterSerOnPreviousPage,
                TextType.smallHeadline,
              ),
              TextWidget('${state.counter}', TextType.headline),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppFloatingActionButton(
                    heroTag: AppStrings.decrementHeroTag,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                    icon: AppConstants.removeIcon,
                  ),
                  AppFloatingActionButton(
                    heroTag: AppStrings.incrementHeroTag,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                    icon: AppConstants.addIcon,
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.largePadding),
              AppElevatedButton(
                label: AppStrings.toOtherPage,
                onPressed: () => context.goToOtherRouteAccessPage(
                  context.read<RouteAccessCounterCubit>(),
                ),
              ),
              AppElevatedButton(
                label: AppStrings.toAnotherPage,
                onPressed: () => context.goToAnotherRouteAccessPage(
                  context.read<RouteAccessCounterCubit>(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
