import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exports/core_config_export.dart';
import '../../presentation/widgets/text_widget.dart';
import 'counter_for_route_access/route_access_cubit.dart';

/// 🟢 `ShowMeCounter` displays the current counter value using Cubit state management.
class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

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
          final wasInc = state.wasIncremented;
          if (wasInc != null) {
            final text = wasInc ? 'Incremented!' : 'Decremented!';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(text),
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
              const SizedBox(height: 24),
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
              ElevatedButton(
                onPressed: () =>
                    Helpers.pushNamed(context, RouteNames.routeAccessSecond),
                child: const Text('To Second Page'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Helpers.pushNamed(context, RouteNames.routeAccessThird),
                child: const Text('To Third Page'),
              ),
            ],
          );
        },
      ),
    );
  }
}
