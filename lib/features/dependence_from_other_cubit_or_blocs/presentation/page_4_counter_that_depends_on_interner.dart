import 'package:countersapp_bloccubit_playground/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/utilities/helpers.dart';
import '../domain/counter_cubit_that_depends_on_internet/counter_that_depends_on_internet_cubit.dart';
import '../domain/counter_cubit_that_depends_on_internet/internet_cubit.dart';

class PageForCounterThatDependsOnInternet extends StatefulWidget {
  const PageForCounterThatDependsOnInternet({super.key});

  @override
  State<PageForCounterThatDependsOnInternet> createState() =>
      _PageForCounterThatDependsOnInternetState();
}

class _PageForCounterThatDependsOnInternetState
    extends State<PageForCounterThatDependsOnInternet> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall;

    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        final counterCubit = context.read<CounterThatDependsOnInternetCubit>();

        // if (state is InternetDisconnected) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text("You're offline"),
        //       duration: Duration(seconds: 1),
        //     ),
        //   );
        // }
        if (state is InternetConnected) {
          switch (state.connectionType) {
            case ConnectionType.wifi:
              counterCubit.increment();
              break;
            case ConnectionType.mobile:
              counterCubit.decrement();
              break;
            case ConnectionType.none:
              break;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget('widget.title', TextType.titleSmall),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected) {
                    final connectionLabel =
                        state.connectionType == ConnectionType.wifi
                            ? 'Wi-Fi'
                            : 'Mobile';
                    final color = state.connectionType == ConnectionType.wifi
                        ? Colors.green
                        : Colors.red;

                    return Text(
                      connectionLabel,
                      style: textStyle?.copyWith(color: color),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: textStyle?.copyWith(color: Colors.grey),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Divider(height: 16),
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
                  final style = Theme.of(context).textTheme.headlineMedium;

                  if (value < 0) {
                    return Text('BRR, NEGATIVE $value', style: style);
                  } else if (value == 5) {
                    return Text('HMM, NUMBER 5', style: style);
                  } else if (value % 2 == 0) {
                    return Text('WOW $value', style: style);
                  } else {
                    return Text('$value', style: style);
                  }
                },
              ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () => Helpers.pushNamed(context,
                    RouteNames.subPage1ForCounterThatDependsOnInternet),
                child: const Text(
                  'Go to Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Colors.greenAccent,
                onPressed: () => Helpers.pushNamed(context,
                    RouteNames.subPage2ForCounterThatDependsOnInternet),
                child: const Text(
                  'Go to Third Screen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
