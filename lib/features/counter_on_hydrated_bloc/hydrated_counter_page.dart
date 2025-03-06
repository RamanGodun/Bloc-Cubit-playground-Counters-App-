import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'hydrated_counter_bloc/counter_bloc.dart';

/* Config */
import '../../core/config/constants/app_constants.dart';
import '../../core/config/constants/app_strings.dart';
import '../../core/utils/helpers.dart';

/* Custom Widgets */
import '../../presentation/widgets/floating_action_button.dart';
import '../../presentation/widgets/text_widget.dart';

/// 🟢 `CounterOnHydratedBlocPage` displays the counter with persistence using `HydratedCounterBloc`.
/// - Supports increment, decrement, and state's clear actions.
class CounterOnHydratedBlocPage extends StatelessWidget {
  const CounterOnHydratedBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          AppStrings.hydratedCounterPageTitle,
          TextType.titleSmall,
        ),
      ),
      body: Center(
        child: BlocBuilder<HydratedCounterBloc, HydratedCounterBlocState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWidget(
                  AppStrings.locallyCashedCounterIs,
                  TextType.titleMedium,
                  color: Helpers.getColorScheme(context).onSurface,
                ),
                const SizedBox(
                  height: AppConstants.largePadding,
                ),
                TextWidget(
                  '${state.counter}',
                  TextType.headline,
                  color: Helpers.getColorScheme(context).onSurface,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: _buildActionButtons(context),
    );
  }

  /// ➕➖🗑️ Builds the action buttons for increment, decrement, and state's clear actions.
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppFloatingActionButton(
          icon: AppConstants.addIcon,
          onPressed: () => context
              .read<HydratedCounterBloc>()
              .add(IncrementHydratedCounterEvent()),
          heroTag: AppStrings.incrementHeroTag,
        ),
        const SizedBox(width: AppConstants.smallPadding),
        AppFloatingActionButton(
          icon: AppConstants.removeIcon,
          onPressed: () => context
              .read<HydratedCounterBloc>()
              .add(DecrementHydratedCounterEvent()),
          heroTag: AppStrings.decrementHeroTag,
        ),
        const SizedBox(width: AppConstants.smallPadding),
        AppFloatingActionButton(
          icon: AppConstants.deleteIcon,
          onPressed: _clearState,
          heroTag: AppStrings.clearHeroTag,
        ),
      ],
    );
  }

  /// 🟢 Clears the stored state in `HydratedBloc` storage.
  Future<void> _clearState() async {
    await HydratedBloc.storage.clear();
    print('[HydratedBloc] State cleared.');
  }
}
