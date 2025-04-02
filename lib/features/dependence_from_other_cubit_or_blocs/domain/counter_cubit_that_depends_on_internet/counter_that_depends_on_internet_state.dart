part of 'counter_that_depends_on_internet_cubit.dart';

class CounterThatDependsOnInternetState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;

  const CounterThatDependsOnInternetState({
    required this.counterValue,
    this.wasIncremented,
  });

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}
