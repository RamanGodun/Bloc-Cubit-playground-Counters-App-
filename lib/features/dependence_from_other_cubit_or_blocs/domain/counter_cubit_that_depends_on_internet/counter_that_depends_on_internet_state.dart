part of 'counter_that_depends_on_internet_cubit.dart';

class CounterThatDependsOnInternetState extends Equatable {
  final int counter;
  final bool? wasIncremented;

  const CounterThatDependsOnInternetState({
    required this.counter,
    this.wasIncremented,
  });

  factory CounterThatDependsOnInternetState.initial() =>
      const CounterThatDependsOnInternetState(counter: 0);

  CounterThatDependsOnInternetState copyWith({
    int? counter,
    bool? wasIncremented,
  }) {
    return CounterThatDependsOnInternetState(
      counter: counter ?? this.counter,
      wasIncremented: wasIncremented,
    );
  }

  @override
  List<Object?> get props => [counter, wasIncremented];
}
