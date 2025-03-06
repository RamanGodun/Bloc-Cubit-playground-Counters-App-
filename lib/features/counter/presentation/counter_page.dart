import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* BLoC */
import '../../../core/config/app_config.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_constants.dart';
import '../../../core/utils/helpers.dart';
import '../counter_on_bloc/counter_bloc.dart';

/* CUBIT */
import '../counter_on_cubit/counter_cubit.dart';

import '../../../presentation/widgets/text_widget.dart';
import '../_counter_state_switching/counter_factory.dart';
import '../../../core/utils/show_dialog.dart';
import '../../../presentation/pages/other_page.dart';

/// 🟢 `CounterPage` dynamically handles state management using BLoC or Cubit
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isBlocActive = AppConfig.isAppSettingsOnBlocStateShape;

    // 🔄 Determine whether to use BLoC or Cubit and create the appropriate manager
    final useBloc =
        CounterFactory.isUseBloc(context, isBlocActive: isBlocActive);
    final counterManager = CounterFactory.create(context, useBloc: useBloc);

    return Scaffold(
      appBar: AppBar(
        title:
            const TextWidget(AppStrings.counterPageTitle, TextType.titleSmall),
      ),
      body: MultiBlocListener(
        listeners: [
          useBloc
              ? BlocListener<CounterOnBloc, CounterOnBLoCState>(
                  listener: (context, state) =>
                      _handleSideEffects(context, state.counter),
                )
              : BlocListener<CounterOnCubit, CounterOnCubitState>(
                  listener: (context, state) =>
                      _handleSideEffects(context, state.counter),
                ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                AppStrings.currentValue,
                TextType.titleMedium,
                color: Helpers.getColorScheme(context).onSurface,
              ),
              _buildCounterDisplay(context, useBloc),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _ActionButton(
            icon: AppConstants.addIcon,
            heroTag: AppStrings.incrementHeroTag,
            onPressed: counterManager.increment,
            colorScheme: Helpers.getColorScheme(context),
          ),
          const SizedBox(width: AppConstants.smallPadding),
          _ActionButton(
            icon: AppConstants.removeIcon,
            heroTag: AppStrings.decrementHeroTag,
            onPressed: counterManager.decrement,
            colorScheme: Helpers.getColorScheme(context),
          ),
        ],
      ),
    );
  }

  /// 🔢 Builds a display for the current counter value
  Widget _buildCounterDisplay(BuildContext context, bool useBloc) {
    final counter = useBloc
        ? context.select<CounterOnBloc, int>((bloc) => bloc.state.counter)
        : context.select<CounterOnCubit, int>((cubit) => cubit.state.counter);

    return TextWidget(
      '$counter',
      TextType.headline,
      color: Helpers.getColorScheme(context).onSurface,
    );
  }

  /// ⚠️ Handles side-effects when counter reaches specific values
  void _handleSideEffects(BuildContext context, int counter) {
    if (counter == 3) {
      DialogService.showAlertDialog(
        context,
        '${AppStrings.counterIs} $counter',
      );
    } else if (counter == -1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtherPage()),
      );
    }
  }
}

/// 🎯 `_ActionButton` is a reusable floating action button with customizable properties.
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String heroTag;
  final VoidCallback onPressed;
  final ColorScheme colorScheme;

  const _ActionButton({
    required this.icon,
    required this.heroTag,
    required this.onPressed,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: colorScheme.secondary,
      backgroundColor: colorScheme.primary,
      onPressed: onPressed,
      heroTag: heroTag,
      child: Icon(icon),
    );
  }
}
