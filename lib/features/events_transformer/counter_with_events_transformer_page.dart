import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import '../../core/utils/core_config_export.dart';

import '../../presentation/widgets/floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';
import '../../presentation/widgets/header_text.dart';

/// 🟢 `CounterWithEventTransformerHandling`
/// Demonstrates the usage of BLoC with custom event transformers.
class CounterWithEventTransformerHandling extends StatelessWidget {
  const CounterWithEventTransformerHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.eventTransformersDemo,
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppConstants.largePadding,
          children: [
            const HeaderText(
                headlineText: 'Try different combinations ',
                subTitleText: '"+" - droppable (3s), "-" - restartable (1s)'),
            const TextWidget(AppStrings.currentValue, TextType.smallHeadline),
            BlocBuilder<CounterBlocWithTransformers,
                CounterStateWithTransformers>(
              builder: (context, state) {
                return TextWidget(
                  '${state.counter}',
                  TextType.headline,
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButtons(context),
    );
  }

  /// ➕➖ Builds floating action buttons for incrementing and decrementing the counter.
  Widget _buildFloatingActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppFloatingActionButton(
          icon: AppConstants.addIcon,
          heroTag: AppStrings.incrementHeroTag,
          onPressed: () => context
              .read<CounterBlocWithTransformers>()
              .add(IncrementCounterEventWithTransformers()),
        ),
        const SizedBox(width: AppConstants.mediumPadding),
        AppFloatingActionButton(
          icon: AppConstants.removeIcon,
          heroTag: AppStrings.decrementHeroTag,
          onPressed: () => context
              .read<CounterBlocWithTransformers>()
              .add(DecrementCounterEventWithTransformers()),
        ),
      ],
    );
  }
}
