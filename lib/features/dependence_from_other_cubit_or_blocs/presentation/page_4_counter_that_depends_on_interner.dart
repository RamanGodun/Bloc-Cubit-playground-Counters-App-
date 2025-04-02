import 'package:countersapp_bloccubit_playground/core/app_constants/app_constants.dart';
import 'package:countersapp_bloccubit_playground/presentation/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countersapp_bloccubit_playground/presentation/widgets/text_widget.dart';
import '../../../core/utilities/helpers.dart';
import '../../../core/app_constants/app_strings.dart';
import '../domain/counter_cubit_that_depends_on_internet/counter_that_depends_on_internet_cubit.dart';
import '../domain/counter_cubit_that_depends_on_internet/internet_cubit.dart';

class PageForCounterThatDependsOnInternet extends StatelessWidget {
  const PageForCounterThatDependsOnInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, internetState) {
        final counterCubit = context.read<CounterThatDependsOnInternetCubit>();
        final previous = counterCubit.previousState;
        final current = internetState;

        final becameConnected =
            previous is! InternetConnected && current is InternetConnected;
        final becameDisconnected =
            previous is InternetConnected && current is! InternetConnected;

        if (becameConnected) {
          counterCubit.incrementOn10();
        } else if (becameDisconnected) {
          counterCubit.decrementOn10();
        }

        counterCubit.previousState = current;
      },
      child: const _CounterBody(), // винесений body окремо
    );
  }
}

class _CounterBody extends StatelessWidget {
  const _CounterBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Internet Counter', TextType.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, internetState) {
                return _ConnectionStatusLabel(internetState: internetState);
              },
            ),
            const SizedBox(height: 32),
            BlocConsumer<CounterThatDependsOnInternetCubit,
                CounterThatDependsOnInternetState>(
              listener: (context, state) {
                final wasIncremented = state.wasIncremented;
                if (wasIncremented != null) {
                  final text = wasIncremented
                      ? AppStrings.incrementedText
                      : AppStrings.decrementedText;
                  Helpers.showStyledSnackBar(context: context, message: text);
                }
              },
              builder: (context, state) {
                final value = state.counter;
                final style = Theme.of(context).textTheme.headlineMedium;
                final displayText = switch (value) {
                  < 0 => 'BRR, NEGATIVE $value',
                  == 5 => 'HMM, NUMBER 5',
                  _ when value % 2 == 0 => 'WOW $value',
                  _ => '$value',
                };
                return Text(displayText, style: style);
              },
            ),
            const SizedBox(height: 32),
            _CounterControls(),
          ],
        ),
      ),
    );
  }
}

class _ConnectionStatusLabel extends StatelessWidget {
  final InternetState internetState;

  const _ConnectionStatusLabel({required this.internetState});

  @override
  Widget build(BuildContext context) {
    return switch (internetState) {
      InternetConnected(:final connectionType) => TextWidget(
          connectionType == ConnectionType.wifi ? 'Wi-Fi' : 'Mobile',
          TextType.smallHeadline,
          color: connectionType == ConnectionType.wifi
              ? AppConstants.greenColor
              : AppConstants.darkPrimaryColor,
        ),
      InternetDisconnected() => const TextWidget(
          'Disconnected', TextType.smallHeadline,
          color: AppConstants.errorColor),
      _ => const CircularProgressIndicator(),
    };
  }
}

class _CounterControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppFloatingActionButton(
            icon: Icons.remove,
            onPressed: () =>
                context.read<CounterThatDependsOnInternetCubit>().decrement(),
            heroTag: '_dec'),
        AppFloatingActionButton(
          icon: Icons.add,
          onPressed: () =>
              context.read<CounterThatDependsOnInternetCubit>().increment(),
          heroTag: '_inc',
        ),
      ],
    );
  }
}
