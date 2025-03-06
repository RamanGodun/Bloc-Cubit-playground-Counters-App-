import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* Config */
import '../../core/config/constants/app_constants.dart';
import '../../core/config/constants/app_strings.dart';

/* UI Components */

import '../../presentation/widgets/floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';

/* State Management */
import 'bloc/counter_bloc.dart';

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
          children: [
            const TextWidget(
              AppStrings.counterWithEventsTransformer,
              TextType.smallHeadline,
            ),
            const SizedBox(height: AppConstants.largePadding),
            BlocBuilder<CounterBlocWithTransformers,
                CounterStateWithTransformers>(
              builder: (context, state) {
                return TextWidget(
                  '${state.counter}',
                  TextType.headline,
                );
              },
            ),
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
