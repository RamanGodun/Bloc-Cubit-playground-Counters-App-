part of 'counter_bloc.dart';

/// State for `CounterBlocWhichDependsOnColorBLoC`.
/// Manages the counter value based on color-dependent logic.
final class CounterStateWhichDependsOnColorBloc extends Equatable {
  const CounterStateWhichDependsOnColorBloc({
    required this.counter,
  });

  /// Initial state with the counter set to 0.
  factory CounterStateWhichDependsOnColorBloc.initial() {
    return const CounterStateWhichDependsOnColorBloc(counter: 0);
  }

  /// The current counter value.
  final int counter;

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  /// Creates a new state with an optional counter update.
  CounterStateWhichDependsOnColorBloc copyWith({
    int? counter,
  }) {
    return CounterStateWhichDependsOnColorBloc(
      counter: counter ?? this.counter,
    );
  }
}