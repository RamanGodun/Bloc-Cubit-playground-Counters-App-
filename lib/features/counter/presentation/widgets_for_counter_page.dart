part of 'counter_page_.dart';

/// 🟢 `CounterDisplayWidget` displays the current counter value
class _CounterDisplayWidget extends StatelessWidget {
  final bool isCounterOnBloc;

  const _CounterDisplayWidget({required this.isCounterOnBloc});

  @override
  Widget build(BuildContext context) {
    final counter = isCounterOnBloc
        ? context.select<CounterOnBloc, int>((bloc) => bloc.state.counter)
        : context.select<CounterOnCubit, int>((cubit) => cubit.state.counter);

    return TextWidget('$counter', TextType.headlineMedium);
  }
}

/// 🟢 `ButtonRow` displays the floating action buttons for increment and decrement
class _ButtonsRow extends StatelessWidget {
  final dynamic counterManager;

  const _ButtonsRow({required this.counterManager});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppFloatingActionButton(
          onPressed: counterManager.decrement,
          heroTag: AppStrings.decrementHeroTag,
          icon: AppConstants.removeIcon,
        ),
        AppFloatingActionButton(
          onPressed: counterManager.increment,
          heroTag: AppStrings.incrementHeroTag,
          icon: AppConstants.addIcon,
        ),
        const SizedBox(width: 5)
      ],
    );
  }
}
