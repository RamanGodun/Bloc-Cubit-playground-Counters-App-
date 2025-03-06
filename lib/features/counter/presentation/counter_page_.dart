import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* BLoC */
import '../../../core/app_settings_managing/app_config.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_constants.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/show_dialog.dart';
import '../../../presentation/pages/other_page.dart';
import '../../../presentation/widgets/floating_action_button.dart';
import '../../../presentation/widgets/text_widget.dart';
import '../counter_on_bloc/counter_bloc.dart';

/* CUBIT */
import '../counter_on_cubit/counter_cubit.dart';

import '../_counter_state_switching/counter_factory.dart';

/// 🟢 `CounterPage` dynamically handles state management using BLoC or Cubit
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔄 Determine whether to use BLoC or Cubit and create the appropriate manager
    final isCounterOnBloc = CounterFactory.isCounterOnBloc(
      context,
      isAppSettingsOnBloc: AppConfig.isAppSettingsOnBlocStateShape,
    );
    final counterManager = CounterFactory.create(
      context,
      isCounterOnBloc: isCounterOnBloc,
    );
    final appBarText = isCounterOnBloc
        ? AppStrings.counterPageTitleOnBloc
        : AppStrings.counterPageTitleOnCubit;

    return Scaffold(
      appBar: AppBar(
        title: TextWidget(appBarText, TextType.titleMedium),
      ),
      body: isCounterOnBloc
          ? BlocListener<CounterOnBloc, CounterOnBLoCState>(
              listener: (context, state) =>
                  _handleSideEffects(context, state.counter),
              child: _buildCounterDisplay(context, isCounterOnBloc),
            )
          : BlocListener<CounterOnCubit, CounterOnCubitState>(
              listener: (context, state) =>
                  _handleSideEffects(context, state.counter),
              child: _buildCounterDisplay(context, isCounterOnBloc),
            ),
      floatingActionButton: Row(
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
        ],
      ),
    );
  }

  /// 🔢 Builds a display for the current counter value
  Widget _buildCounterDisplay(BuildContext context, bool isCounterOnBloc) {
    final counter = isCounterOnBloc
        ? context.select<CounterOnBloc, int>((bloc) => bloc.state.counter)
        : context.select<CounterOnCubit, int>((cubit) => cubit.state.counter);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
            AppStrings.currentValue,
            TextType.titleMedium,
          ),
          const SizedBox(height: AppConstants.largePadding),
          TextWidget(
            '$counter',
            TextType.headline,
            color: Helpers.getColorScheme(context).onSurface,
          ),
        ],
      ),
    );
  }

  /// ⚠️ Handles side-effects when counter reaches specific values
  void _handleSideEffects(BuildContext context, int counter) {
    if (counter == 1 || counter == 3) {
      DialogService.showAlertDialog(
        context,
        '${AppStrings.counterIs} $counter',
      );
    } else if (counter == -1 || counter == -3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtherPage()),
      );
    }
  }
}
