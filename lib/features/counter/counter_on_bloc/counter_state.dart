part of 'counter_bloc.dart';

/// 🟢 `CounterOnBLoCState` manages the state of the counter within the BLoC.
/// Implements `Equatable` for efficient state comparison.
final class CounterOnBLoCState extends Equatable {
  final int counter;

  /// Creates a new `CounterOnBLoCState` instance.
  const CounterOnBLoCState({required this.counter});

  /// 🟢 Factory constructor for the initial state with `counter = 0`.
  factory CounterOnBLoCState.initial() => const CounterOnBLoCState(counter: 0);

  /// 🟢 `copyWith` method for creating a new state with updated values.
  /// If no new value is provided, retains the current state.
  CounterOnBLoCState copyWith({int? counter}) {
    return CounterOnBLoCState(
      counter: counter ?? this.counter,
    );
  }

  /// 🟢 Determines the properties to compare for state equality.
  /// Helps avoid unnecessary UI rebuilds when the state is unchanged.
  @override
  List<Object> get props => [counter];

  /// 🟢 Provides a readable representation of the state for debugging.
  @override
  String toString() => 'CounterOnBLoCState(counter: $counter)';
}
