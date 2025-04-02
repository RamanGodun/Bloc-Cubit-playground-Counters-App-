part of 'route_access_cubit.dart';

class RouteAccessCounterState extends Equatable {
  final int counter;
  final bool? wasIncremented;

  const RouteAccessCounterState({
    required this.counter,
    this.wasIncremented,
  });

  factory RouteAccessCounterState.initial() =>
      const RouteAccessCounterState(counter: 0);

  RouteAccessCounterState copyWith({
    int? counter,
    bool? wasIncremented,
  }) {
    return RouteAccessCounterState(
      counter: counter ?? this.counter,
      wasIncremented: wasIncremented,
    );
  }

  @override
  List<Object?> get props => [counter, wasIncremented];
}
