import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_constants/app_constants.dart';
import '../../core/app_constants/app_strings.dart';
import '../../core/routing/route_names.dart';
import '../../core/utilities/helpers.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/custom_elevated_button.dart';
import '../../features/cubit_access/counter_for_route_access/route_access_cubit.dart';

/// 🟢 `ShowMeCounter` displays and manages the counter value with routing to other pages.
class MainPage4RouteAccessFeature extends StatelessWidget {
  const MainPage4RouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Helpers.getColorScheme(context);

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
          final wasInc = state.wasIncremented;
          if (wasInc != null) {
            final text = wasInc ? 'Incremented!' : 'Decremented!';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: TextWidget(
                  text,
                  TextType.titleMedium,
                  color: colorScheme.onPrimary,
                ),
                duration: const Duration(milliseconds: 300),
              ),
            );
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
                  FloatingActionButton(
                    heroTag: 'counter_dec',
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'counter_inc',
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppElevatedButton(
                label: 'Go to Second Page',
                onPressed: () =>
                    Helpers.pushNamed(context, RouteNames.routeAccessOtherPage),
              ),
              AppElevatedButton(
                label: 'Go to Third Page',
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
