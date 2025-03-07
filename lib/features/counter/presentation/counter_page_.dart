import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/core_config_export.dart';

/* UI components */
import '../../../presentation/pages/other_page.dart';
import '../../../presentation/widgets/floating_action_button.dart';
import '../../../presentation/widgets/text_widget.dart';

/* State management */
import '../_counter_state_switching/counter_factory.dart';
import '../_counter_state_switching/counter_manager.dart';
import '../counter_on_bloc/counter_bloc.dart';
import '../counter_on_cubit/counter_cubit.dart';

/// 🟢 `CounterPage` dynamically handles state management using BLoC or Cubit
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔄 Determine whether to use BLoC or Cubit and create the appropriate manager
    final isCounterOnBloc = CounterFactory.isCounterOnBloc(context,
        isAppSettingsOnBloc: AppConfig.isAppSettingsOnBlocStateShape);
    final CounterManager counterManager =
        CounterFactory.create(context, isCounterOnBloc: isCounterOnBloc);

    final appBarText = isCounterOnBloc
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: TextWidget(appBarText, TextType.titleMedium)),
      body: isCounterOnBloc
          ? BlocListener<CounterOnBloc, CounterOnBLoCState>(
              listener: (context, state) =>
                  _handleSideEffects(context, state.counter),
              child: CounterView(
                isCounterOnBloc: isCounterOnBloc,
                deviceHeight: deviceHeight,
                counterManager: counterManager,
              ),
            )
          : BlocListener<CounterOnCubit, CounterOnCubitState>(
              listener: (context, state) =>
                  _handleSideEffects(context, state.counter),
              child: CounterView(
                isCounterOnBloc: isCounterOnBloc,
                deviceHeight: deviceHeight,
                counterManager: counterManager,
              ),
            ),
    );
  }

  /// ⚠️ Handles side-effects when counter reaches specific values
  void _handleSideEffects(BuildContext context, int counter) {
    // 📢 Show dialog at specific values
    if (counter == 1 || counter == 3) {
      DialogService.showAlertDialog(
        context,
        '${AppStrings.counterIs} $counter',
      );
    }
    // 🚦 Navigate to another page at specific negative values
    else if (counter == -1 || counter == -3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtherPage()),
      );
    }
    // 🍫 Show a SnackBar for specific counter values
    else if (counter == -4 || counter == -2 || counter == 2 || counter == 4) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextWidget(
              'Current counter value: $counter', TextType.titleMedium),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor:
              AppConstants.secondaryColor4DarkTheme.withOpacity(0.2),
        ),
      );
    }
  }
}

/// 🟢 `CounterView` is a reusable widget for displaying the counter and action buttons
class CounterView extends StatelessWidget {
  final bool isCounterOnBloc;
  final double deviceHeight;
  final dynamic counterManager;

  const CounterView({
    super.key,
    required this.isCounterOnBloc,
    required this.deviceHeight,
    required this.counterManager,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: deviceHeight * 0.35),
        const TextWidget(AppStrings.currentValue, TextType.smallHeadline),
        const SizedBox(height: AppConstants.largePadding),
        CounterDisplayWidget(isCounterOnBloc: isCounterOnBloc),
        SizedBox(height: deviceHeight * 0.2),
        ButtonsRow(counterManager: counterManager),
      ],
    );
  }
}

/// 🟢 `CounterDisplayWidget` displays the current counter value
class CounterDisplayWidget extends StatelessWidget {
  final bool isCounterOnBloc;

  const CounterDisplayWidget({super.key, required this.isCounterOnBloc});

  @override
  Widget build(BuildContext context) {
    final counter = isCounterOnBloc
        ? context.select<CounterOnBloc, int>((bloc) => bloc.state.counter)
        : context.select<CounterOnCubit, int>((cubit) => cubit.state.counter);

    return TextWidget('$counter', TextType.headline);
  }
}

/// 🟢 `ButtonRow` displays the floating action buttons for increment and decrement
class ButtonsRow extends StatelessWidget {
  final dynamic counterManager;

  const ButtonsRow({super.key, required this.counterManager});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppFloatingActionButton(
          onPressed: counterManager.increment,
          heroTag: AppStrings.incrementHeroTag,
          icon: AppConstants.addIcon,
        ),
        const SizedBox(width: AppConstants.mediumPadding),
        AppFloatingActionButton(
          onPressed: counterManager.decrement,
          heroTag: AppStrings.decrementHeroTag,
          icon: AppConstants.removeIcon,
        ),
        const SizedBox(width: AppConstants.largePadding),
      ],
    );
  }
}
