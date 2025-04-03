import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/widgets/custom_app_bar.dart';
import 'bloc/counter_bloc.dart';
import '../../core/exports/core_config_export.dart';

import '../../presentation/widgets/custom_buttons/app_floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/header_text.dart';

/// 🟢 [PageForCounterWithEventTransformerHandling]
/// A demo page showcasing a counter BLoC that uses custom event transformers.
class PageForCounterWithEventTransformerHandling extends StatelessWidget {
  const PageForCounterWithEventTransformerHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocWithTransformers(),
      child: const _ViewForCounterWithEventTransformerHandling(),
    );
  }
}

/// 🟢 `CounterWithEventTransformerHandling`
/// Demonstrates the usage of BLoC with custom event transformers.
class _ViewForCounterWithEventTransformerHandling extends StatelessWidget {
  const _ViewForCounterWithEventTransformerHandling();

  @override
  Widget build(BuildContext context) {
    // 👀 Listen only to `counter` field for optimized rebuilds
    final counter = context.select<CounterBlocWithTransformers, int>(
      (bloc) => bloc.state.counter,
    );

    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.eventTransformersDemo),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppConstants.largePadding,
          children: [
            const HeaderText(
                headlineText: AppStrings.forEvensTransformerHeadline,
                subTitleText: AppStrings.forEvensTransformerSubTitle),
            const TextWidget(AppStrings.currentValue, TextType.headlineSmall),
            TextWidget(
              '$counter',
              TextType.headlineLarge,
              color: AppConstants.greenColor,
            ),
            const _ButtonsRowWidget(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

/// ➕➖ [_ButtonsRowWidget]
/// A row with increment and decrement buttons, dispatching events to BLoC.
class _ButtonsRowWidget extends StatelessWidget {
  const _ButtonsRowWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2 * AppConstants.hugePadding,
      children: [
        // ➖ Decrement counter using transformer-based BLoC
        AppFloatingActionButton(
          icon: AppConstants.removeIcon,
          heroTag: AppStrings.decrementHeroTag,
          onPressed: () => context
              .read<CounterBlocWithTransformers>()
              .add(DecrementCounterEventWithTransformers()),
        ),
        // ➕ Increment counter using transformer-based BLoC
        AppFloatingActionButton(
          icon: AppConstants.addIcon,
          heroTag: AppStrings.incrementHeroTag,
          onPressed: () => context
              .read<CounterBlocWithTransformers>()
              .add(IncrementCounterEventWithTransformers()),
        ),
      ],
    );
  }
}
