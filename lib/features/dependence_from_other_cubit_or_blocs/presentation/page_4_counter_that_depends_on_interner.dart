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
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Internet Counter', TextType.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ✅ Окремий BlocBuilder для InternetCubit
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, internetState) {
                return _ConnectionStatusLabel(internetState: internetState);
              },
            ),
            const SizedBox(height: 32),

            /// ✅ Твій BlocConsumer для CounterCubit
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
    final textStyle = Theme.of(context).textTheme.displaySmall;

    return switch (internetState) {
      InternetConnected(:final connectionType) => Text(
          connectionType == ConnectionType.wifi ? 'Wi-Fi' : 'Mobile',
          style: textStyle?.copyWith(
            color: connectionType == ConnectionType.wifi
                ? Colors.green
                : Colors.orange,
          ),
        ),
      InternetDisconnected() => Text(
          'Disconnected',
          style: textStyle?.copyWith(color: Colors.grey),
        ),
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
        FloatingActionButton(
          heroTag: '_dec',
          onPressed: () =>
              context.read<CounterThatDependsOnInternetCubit>().decrement(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          heroTag: '_inc',
          onPressed: () =>
              context.read<CounterThatDependsOnInternetCubit>().increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
