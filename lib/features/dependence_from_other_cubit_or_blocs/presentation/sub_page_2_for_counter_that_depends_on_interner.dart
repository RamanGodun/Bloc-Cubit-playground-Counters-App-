import 'package:countersapp_bloccubit_playground/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/counter_cubit_that_depends_on_internet/counter_that_depends_on_internet_cubit.dart';

class SubPage2ForCounterThatDependsOnInternet extends StatefulWidget {
  const SubPage2ForCounterThatDependsOnInternet({super.key});

  @override
  State<SubPage2ForCounterThatDependsOnInternet> createState() =>
      _SubPage2ForCounterThatDependsOnInternetState();
}

class _SubPage2ForCounterThatDependsOnInternetState
    extends State<SubPage2ForCounterThatDependsOnInternet> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: AppBar(title: const TextWidget('Title', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            const SizedBox(height: 12),

            /// BlocConsumer
            BlocConsumer<CounterThatDependsOnInternetCubit,
                CounterThatDependsOnInternetState>(
              listener: (context, state) {
                final wasIncremented = state.wasIncremented;
                if (wasIncremented != null) {
                  final message =
                      wasIncremented ? 'Incremented!' : 'Decremented!';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      duration: const Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final value = state.counterValue;
                final displayText = switch (value) {
                  < 0 => 'BRR, NEGATIVE $value',
                  == 5 => 'HMM, NUMBER 5',
                  _ when value % 2 == 0 => 'WOW $value',
                  _ => '$value',
                };

                return Text(displayText, style: textStyle);
              },
            ),

            const SizedBox(height: 24),

            /// Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: '_dec',
                  onPressed: () => context
                      .read<CounterThatDependsOnInternetCubit>()
                      .decrement(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: '_inc',
                  onPressed: () => context
                      .read<CounterThatDependsOnInternetCubit>()
                      .increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
