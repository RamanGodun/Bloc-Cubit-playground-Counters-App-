import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/exports/core_config_export.dart';
import '../../features/cubit_access/counter_for_route_access/route_access_cubit.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/floating_action_button.dart';

/// 🟩 [AnotherPage4CubitRouteAccessFeature] – page with Counter on shared (through Route Access) Cubit
class AnotherPage4CubitRouteAccessFeature extends StatelessWidget {
  const AnotherPage4CubitRouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppConstants.anotherPageAppBarColor;


    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.anotherPageTitle,
          TextType.titleSmall,
        ),
        backgroundColor: color,
      ),
      body: Center(
        child: BlocBuilder<RouteAccessCounterCubit, RouteAccessCounterState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largePadding,
            children: [
              const TextWidget(
                AppStrings.currentValue,
                TextType.smallHeadline,
              ),
              TextWidget('${state.counter}', TextType.headline),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppFloatingActionButton(
                    heroTag: AppStrings.anotherPageDecrementHeroTag,
                    icon: AppConstants.removeIcon,
                    color: color,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                  ),
                  AppFloatingActionButton(
                    heroTag: AppStrings.anotherPageIncrementHeroTag,
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
