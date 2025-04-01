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

/// 🟢 `ShowMeCounter` displays and manages the counter value with routing to other pages.
class MainPage4RouteAccessFeature extends StatelessWidget {
  const MainPage4RouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    ///
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
            final text = wasIncremented ? 'Incremented!' : 'Decremented!';
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
                    heroTag: 'counter_dec',
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                    icon: Icons.remove,
                  ),
                  AppFloatingActionButton(
                    heroTag: 'counter_inc',
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              ///
              AppElevatedButton(
                label: 'to Other page',
                onPressed: () =>
                    Helpers.pushNamed(context, RouteNames.routeAccessOtherPage),
              ),
              AppElevatedButton(
                label: 'to Another page',
                onPressed: () => Helpers.pushNamed(
                    context, RouteNames.routeAccessAnotherPage),
              ),
            ],
          );
        },
      ),
    );
  }
}
