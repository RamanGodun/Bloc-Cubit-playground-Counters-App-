// import 'package:countersapp_bloccubit_playground/core/routing/routes_for_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_constants/app_constants.dart';
import '../../core/app_constants/app_strings.dart';
import '../../core/routing/route_names.dart';
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
                    icon: AppConstants.removeIcon,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                  ),
                  AppFloatingActionButton(
                    heroTag: AppStrings.incrementHeroTag,
                    icon: AppConstants.addIcon,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.largePadding),
              AppElevatedButton(
                label: AppStrings.toOtherPage,
                onPressed: () => Helpers.goToPageWithSharedCounterCubit(
                    context, RouteNames.routeAccessOtherPage),
                // ? Alternative way for routing with shared cubit instance, for it using see [AppRoutes].
                // onPressed: () => context.goToOtherRouteAccessPage(
                //   context.read<RouteAccessCounterCubit>(),
                // ),
                // ),
              ),
              AppElevatedButton(
                label: AppStrings.toAnotherPage,
                onPressed: () => Helpers.goToPageWithSharedCounterCubit(
                    context, RouteNames.routeAccessAnotherPage),
                // ? Alternative way for routing with shared cubit instance, for it using see [AppRoutes].
                // onPressed: () => context.goToAnotherRouteAccessPage(
                //   context.read<RouteAccessCounterCubit>(),
                // ),
              ),
            ],
          );
        },
      ),
    );
  }
}
