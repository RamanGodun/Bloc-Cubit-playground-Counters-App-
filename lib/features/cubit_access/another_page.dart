import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_for_route_access/route_access_cubit.dart';

class AnotherPage4CubitRouteAccessFeature extends StatelessWidget {
  const AnotherPage4CubitRouteAccessFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.green;

    return Scaffold(
      appBar: AppBar(title: const Text('Third Page'), backgroundColor: color),
      body: Center(
        child: BlocBuilder<RouteAccessCounterCubit, RouteAccessCounterState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: ${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().decrement(),
                    backgroundColor: color,
                    heroTag: 'third_dec',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        context.read<RouteAccessCounterCubit>().increment(),
                    backgroundColor: color,
                    heroTag: 'third_inc',
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
