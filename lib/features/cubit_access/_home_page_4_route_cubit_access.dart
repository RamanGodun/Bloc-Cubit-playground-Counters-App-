import 'package:countersapp_bloccubit_playground/core/routing/routes_for_app.dart';
import 'package:countersapp_bloccubit_playground/presentation/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_constants/app_constants.dart';
import '../../core/app_constants/app_strings.dart';
import 'counter_for_route_access/route_access_cubit.dart';
import '../../presentation/widgets/custom_elevated_button.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/floating_action_button.dart';

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

          /// 🔗 Navigates to the Counter Page with saving counter state via [`onGenerateRoute`](lib/core/config/routing/app_routes.dart)
          AppElevatedButton(
            label: AppStrings.toStateAccessPage,
            // onPressed: () =>
            //     Helpers.pushNamed(context, RouteNames.cubitAccessMainPage),
            onPressed: () => context.goToMainRouteAccessPage(
              context.read<RouteAccessCounterCubit>(),
            ),
          ),

          /// ➕ Directly increments the counter using `AppFloatingActionButton`
          AppFloatingActionButton(
            icon: AppConstants.addIcon,
            onPressed: () =>
                context.read<RouteAccessCounterCubit>().increment(),
            heroTag: AppStrings.incrementButton,
          ),
        ],
      ),
    );
  }
}
