// import 'package:countersapp_bloccubit_playground/core/routing/routes_for_app.dart';
import 'package:countersapp_bloccubit_playground/presentation/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_constants/app_constants.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/utilities/helpers.dart';
import '../counter_cubit_for_route_access/route_access_cubit.dart';
import '../../../presentation/widgets/custom_elevated_button.dart';
import '../../../presentation/widgets/text_widget.dart';
import '../../../presentation/widgets/floating_action_button.dart';

class HomePage4RouteAccessFeature extends StatelessWidget {
  const HomePage4RouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RouteAccessCounterCubit(),
      child: const _HomePage4RouteAccessBody(),
    );
  }
}

/// 🟢 `BlocAccessPage` provides UI to navigate to the counter page and increment the counter directly using Cubit.
class _HomePage4RouteAccessBody extends StatelessWidget {
  const _HomePage4RouteAccessBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouteAccessCounterCubit, RouteAccessCounterState>(
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
        return Scaffold(
          appBar: AppBar(
            title: const TextWidget(
              AppStrings.blocAccessPageTitle,
              TextType.titleSmall,
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppConstants.largePadding,
            children: [
              const HeaderText(
                headlineText: AppStrings.incrementCounterHeadline,
                subTitleText: AppStrings.incrementCounterSubtitle,
              ),

              /// ➕ Directly increments the counter using `AppFloatingActionButton`
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppFloatingActionButton(
                    heroTag: AppStrings.decrementHeroTag,
                    icon: AppConstants.removeIcon,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                  ),
                  const SizedBox(width: AppConstants.largePadding),
                  AppFloatingActionButton(
                    heroTag: AppStrings.incrementHeroTag,
                    icon: AppConstants.addIcon,
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              /// 🔗 Navigates to the Counter Page with saving counter state via
              AppElevatedButton(
                label: AppStrings.toSeeCounterValue,
                onPressed: () => Helpers.goToPageWithSharedCounterCubit(
                    context, RouteNames.routeAccessMainPage),
                // ? Alternative way for routing with shared cubit instance, for it using see [AppRoutes].
                // onPressed: () => context.goToMainRouteAccessPage(
                //            context.read<RouteAccessCounterCubit>()),
              ),
            ],
          ),
        );
      },
    );
  }
}
