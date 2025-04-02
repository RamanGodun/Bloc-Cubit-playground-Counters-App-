part of 'counter_that_depends_on_internet_cubit.dart';

class CounterThatDependsOnInternetState extends Equatable {
  final int counter;
  final bool? wasIncremented;
  final DateTime timestamp;

  const CounterThatDependsOnInternetState({
    required this.counter,
    this.wasIncremented,
    required this.timestamp,
  });

  factory CounterThatDependsOnInternetState.initial() =>
      CounterThatDependsOnInternetState(
        counter: 0,
        timestamp: DateTime.now(),
      );

  CounterThatDependsOnInternetState copyWith({
    int? counter,
    bool? wasIncremented,
  }) {
    return CounterThatDependsOnInternetState(
      counter: counter ?? this.counter,
      wasIncremented: wasIncremented,
      timestamp: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [counter, wasIncremented, timestamp];
}
