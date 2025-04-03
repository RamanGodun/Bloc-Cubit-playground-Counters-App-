/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_config.dart';
import '../../../core/app_settings_state_management/app_settings_on_bloc/app_settings_bloc.dart';
import '../../../core/app_settings_state_management/app_settings_on_cubit/app_settings_cubit.dart';
import '../../../core/app_constants/app_constants.dart';
import '../../../core/app_constants/app_strings.dart';
import '../../../core/utilities/helpers.dart';
import '../../../core/utilities/show_dialog.dart';
import '../../../presentation/pages/other_page.dart';
import '../../../presentation/widgets/custom_buttons/app_floating_action_button.dart';
import '../../../presentation/widgets/text_widget.dart';
import '../counter_on_bloc/counter_bloc.dart';
import '../counter_on_cubit/counter_cubit.dart';

/// 🟢 [CounterPageAlt] demonstrates dynamic state management using BLoC or Cubit
class CounterPageAlt extends StatelessWidget {
  const CounterPageAlt({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 Determine whether the app uses BLoC or Cubit for state management
    final isCounterOnBloc = AppConfig.isAppSettingsOnBlocStateShape
        ? context.select<AppSettingsOnBloc, bool>(
            (bloc) => bloc.state.isUsingBlocForAppFeatures)
        : context.select<AppSettingsOnCubit, bool>(
            (cubit) => cubit.state.isUsingBlocForAppFeatures);

    // 🔢 Fetch the current counter value from the active state management
    final int counter = isCounterOnBloc
        ? context.select<CounterOnBloc, int>((bloc) => bloc.state.counter)
        : context.select<CounterOnCubit, int>((cubit) => cubit.state.counter);

    return MultiBlocListener(
      listeners: [
        isCounterOnBloc
            ? BlocListener<CounterOnBloc, CounterOnBLoCState>(
                listener: (context, state) =>
                    _handleStateChange(context, state.counter),
              )
            : BlocListener<CounterOnCubit, CounterOnCubitState>(
                listener: (context, state) =>
                    _handleStateChange(context, state.counter),
              ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
              !isCounterOnBloc
                  ? AppStrings.counterPageTitleOnCubit
                  : AppStrings.counterPageTitleOnBloc,
              TextType.titleMedium),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                AppStrings.currentValue,
                TextType.headlineSmall,
              ),
              const SizedBox(height: AppConstants.largePadding),
              TextWidget(
                '$counter',
                TextType.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppFloatingActionButton(
              onPressed: () =>
                  _handleCounterChange(context, isCounterOnBloc, true),
              heroTag: AppStrings.incrementHeroTag,
              icon: AppConstants.addIcon,
            ),
            const SizedBox(width: AppConstants.mediumPadding),
            AppFloatingActionButton(
              onPressed: () =>
                  _handleCounterChange(context, isCounterOnBloc, false),
              heroTag: AppStrings.decrementHeroTag,
              icon: AppConstants.removeIcon,
            ),
          ],
        ),
      ),
    );
  }

  /// ⚠️ Handles side-effects when the counter reaches specific values
  void _handleStateChange(BuildContext context, int counter) {
    if (counter == 1 || counter == 3) {
      DialogService.showAlertDialog(
        context,
        '${AppStrings.counterIs} $counter',
      );
    } else if (counter == -1 || counter == -3) {
      Helpers.pushTo(context, const OtherPage());
    }
  }

  /// 🔼🔽 Handles increment and decrement actions for both BLoC and Cubit
  void _handleCounterChange(
      BuildContext context, bool isUsingBloc, bool isIncrement) {
    if (isUsingBloc) {
      context
          .read<CounterOnBloc>()
          .add(isIncrement ? IncrementCounterEvent() : DecrementCounterEvent());
    } else {
      isIncrement
          ? context.read<CounterOnCubit>().increment()
          : context.read<CounterOnCubit>().decrement();
    }
  }
}

 */
