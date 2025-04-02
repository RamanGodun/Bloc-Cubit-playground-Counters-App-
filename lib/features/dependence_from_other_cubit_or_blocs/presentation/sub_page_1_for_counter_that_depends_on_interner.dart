import 'package:countersapp_bloccubit_playground/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/counter_cubit_that_depends_on_internet/counter_that_depends_on_internet_cubit.dart';

class SubPage1ForCounterThatDependsOnInternet extends StatefulWidget {
  const SubPage1ForCounterThatDependsOnInternet({super.key});

  @override
  State<SubPage1ForCounterThatDependsOnInternet> createState() =>
      _SubPage1ForCounterThatDependsOnInternetState();
}

class _SubPage1ForCounterThatDependsOnInternetState
    extends State<SubPage1ForCounterThatDependsOnInternet> {
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
                  heroTag: '_decrement',
                  onPressed: () => context
                      .read<CounterThatDependsOnInternetCubit>()
                      .decrement(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: '_increment',
                  onPressed: () => context
                      .read<CounterThatDependsOnInternetCubit>()
                      .increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Navigation
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () => Navigator.of(context).pushNamed('/third'),
              child: const Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
