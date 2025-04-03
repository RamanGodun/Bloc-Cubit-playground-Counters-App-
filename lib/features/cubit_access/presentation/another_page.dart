import 'package:countersapp_bloccubit_playground/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/exports/core_config_export.dart';
import '../counter_cubit_for_route_access/route_access_cubit.dart';
import '../../../presentation/widgets/text_widget.dart';
import '../../../presentation/widgets/custom_buttons/app_floating_action_button.dart';

/// 🟩 [AnotherPage4CubitRouteAccessFeature] – page with Counter on shared (through Route Access) Cubit
class AnotherPage4CubitRouteAccessFeature extends StatelessWidget {
  const AnotherPage4CubitRouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppConstants.anotherPageAppBarColor;

    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.anotherPageTitle),
      body: Center(
        child: BlocBuilder<RouteAccessCounterCubit, RouteAccessCounterState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largePadding,
            children: [
              const TextWidget(AppStrings.currentValue, TextType.headlineSmall),
              TextWidget('${state.counter}', TextType.headlineMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppFloatingActionButton(
                    heroTag: AppStrings.decrementHeroTag,
                    icon: AppConstants.removeIcon,
                    color: color,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                  ),
                  AppFloatingActionButton(
                    heroTag: AppStrings.incrementHeroTag,
                    icon: AppConstants.addIcon,
                    color: color,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
