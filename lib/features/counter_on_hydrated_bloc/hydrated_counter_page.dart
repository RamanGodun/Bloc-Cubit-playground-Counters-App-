import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../core/exports/core_config_export.dart';

import '../../presentation/widgets/custom_app_bar.dart';
import 'hydrated_counter_bloc/counter_bloc.dart';

/* Custom Widgets */
import '../../presentation/widgets/custom_buttons/app_floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';

/// 🟢 [CounterOnHydratedBlocPage] displays the counter on Hydrated BLoC
class CounterOnHydratedBlocPage extends StatelessWidget {
  const CounterOnHydratedBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HydratedCounterBloc(),
      child: const _ViewForCounterOnHydratedBloc(),
    );
  }
}

/// 🟢 [_ViewForCounterOnHydratedBloc] builds the counter UI
/// with persistence support via `HydratedCounterBloc`.
/// Includes increment, decrement, and clear state actions.
class _ViewForCounterOnHydratedBloc extends StatelessWidget {
  const _ViewForCounterOnHydratedBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.hydratedCounterPageTitle,
        //🗑️ Icon for state's clear
        actionIcons: const [AppConstants.deleteIcon],
        actionCallbacks: [_clearState],
      ),
      body: Center(
        child: BlocBuilder<HydratedCounterBloc, HydratedCounterBlocState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppConstants.hugePadding,
              children: [
                const TextWidget(
                  AppStrings.locallyCashedCounterIs,
                  TextType.titleLarge,
                ),
                TextWidget(
                  '${state.counter}',
                  TextType.headlineLarge,
                  color: AppConstants.lightPrimaryColor,
                ),
                const _ButtonsRowWidget()
              ],
            );
          },
        ),
      ),
    );
  }

  /// 🟢 Clears the stored state in `HydratedBloc` storage.
  Future<void> _clearState() async {
    await HydratedBloc.storage.clear();
    debugPrint('[HydratedBloc] State cleared.');
  }
}

/// ➕➖ Row with buttons for increment and decrement actions.
class _ButtonsRowWidget extends StatelessWidget {
  const _ButtonsRowWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2 * AppConstants.hugePadding,
      children: [
        AppFloatingActionButton(
          icon: AppConstants.removeIcon,
          onPressed: () => context
              .read<HydratedCounterBloc>()
              .add(DecrementHydratedCounterEvent()),
          heroTag: AppStrings.decrementHeroTag,
        ),
        AppFloatingActionButton(
          icon: AppConstants.addIcon,
          onPressed: () => context
              .read<HydratedCounterBloc>()
              .add(IncrementHydratedCounterEvent()),
          heroTag: AppStrings.incrementHeroTag,
        ),
      ],
    );
  }
}
