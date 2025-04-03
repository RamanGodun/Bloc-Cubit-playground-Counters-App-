import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_settings_state_management/ui_settings_state/ui_settings_cubit.dart';
import '../../../core/exports/core_config_export.dart';

/* UI components */
import '../../../presentation/widgets/custom_app_bar.dart';
import '../../../presentation/widgets/custom_buttons/app_floating_action_button.dart';
import '../../../presentation/widgets/header_text.dart';
import '../../../presentation/widgets/text_widget.dart';

/* State management */
import '../_counter_state_switching/counter_factory.dart';
import '../counter_on_bloc/counter_bloc.dart';
import '../counter_on_cubit/counter_cubit.dart';

part 'widgets_for_counter_page.dart';

/// 🟢 `CounterPage` dynamically handles state management using BLoC or Cubit
class PageForCounterWithSideEffects extends StatelessWidget {
  const PageForCounterWithSideEffects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => UiSettingsCubit(ctx),
      child: const _ViewForCounterPage(),
    );
  }
}

class _ViewForCounterPage extends StatelessWidget {
  const _ViewForCounterPage();

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<UiSettingsCubit>().state;
    final counterManager = CounterFactory.create(
      context,
      isCounterOnBloc: settings.isUsingBlocForFeatures,
    );

    return Scaffold(
      appBar: CustomAppBar(title: settings.appBarTitle),
      body:
          // 🧩🔄 Determine whether to use BLoC or Cubit to create the appropriate [_CounterPageUI]
          settings.isUsingBlocForFeatures
              ? BlocListener<CounterOnBloc, CounterOnBLoCState>(
                  listener: (context, state) =>
                      Helpers.handleCounterSideEffects(
                          context: context, counter: state.counter),
                  child: _CounterPageUI(
                    isCounterOnBloc: true,
                    counterManager: counterManager,
                  ),
                )
              : BlocListener<CounterOnCubit, CounterOnCubitState>(
                  listener: (context, state) =>
                      Helpers.handleCounterSideEffects(
                          context: context, counter: state.counter),
                  child: _CounterPageUI(
                    isCounterOnBloc: false,
                    counterManager: counterManager,
                  ),
                ),
    );
  }
}

/// 🟢 `CounterView` is a reusable widget for displaying the counter and action buttons
class _CounterPageUI extends StatelessWidget {
  final bool isCounterOnBloc;
  final dynamic counterManager;

  const _CounterPageUI({
    required this.isCounterOnBloc,
    required this.counterManager,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        SizedBox(height: deviceHeight * 0.1),
        const HeaderText(
          headlineText: AppStrings.counterWithSideEffectsHeadline,
          subTitleText: AppStrings.counterWithSideEffectsSubtitle,
        ),
        SizedBox(height: deviceHeight * 0.15),
        const TextWidget(AppStrings.currentValue, TextType.headlineSmall),
        const SizedBox(height: AppConstants.largePadding),
        _CounterDisplayWidget(isCounterOnBloc: isCounterOnBloc),
        SizedBox(height: deviceHeight * 0.2),
        _ButtonsRow(counterManager: counterManager),
      ],
    );
  }
}
