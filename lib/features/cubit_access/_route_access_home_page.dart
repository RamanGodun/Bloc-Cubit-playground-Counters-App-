import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utilities/helpers.dart';
import '../../../presentation/widgets/text_widget.dart';
import 'counter_for_route_access/route_access_cubit.dart';

class RouteAccessHomePage extends StatelessWidget {
  const RouteAccessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextWidget('Route Access Home', TextType.titleMedium)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<RouteAccessCounterCubit, RouteAccessCounterState>(
            listener: (context, state) {
              final wasInc = state.wasIncremented;
              if (wasInc != null) {
                final text = wasInc ? 'Incremented!' : 'Decremented!';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(text),
                      duration: const Duration(milliseconds: 300)),
                );
              }
            },
            builder: (context, state) => Column(
              children: [
                const TextWidget('Current Value:', TextType.smallHeadline),
                TextWidget('${state.counter}', TextType.headline),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<RouteAccessCounterCubit>().decrement(),
                heroTag: 'dec',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () =>
                    context.read<RouteAccessCounterCubit>().increment(),
                heroTag: 'inc',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Helpers.pushNamed(context, '/routeAccess/second'),
            child: const Text('To Second Page'),
          ),
          ElevatedButton(
            onPressed: () => Helpers.pushNamed(context, '/routeAccess/third'),
            child: const Text('To Third Page'),
          )
        ],
      ),
    );
  }
}
