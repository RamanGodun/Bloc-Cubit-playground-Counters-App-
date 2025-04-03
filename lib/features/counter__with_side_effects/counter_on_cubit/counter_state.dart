part of 'counter_cubit.dart';

/// 🟢 [CounterOnCubitState] holds the state of the counter in the Cubit.
///
/// Efficiently manages state changes using [Equatable] to avoid unnecessary UI rebuilds.
final class CounterOnCubitState extends Equatable {
  /// 🔢 The current counter value.
  final int counter;

  /// 🆕 Initializes the state with the provided [counter] value.
  const CounterOnCubitState({required this.counter});

  /// 🚀 Factory constructor for the initial state, setting the counter to `0`.
  factory CounterOnCubitState.initial() =>
      const CounterOnCubitState(counter: 0);

  /// 📏 Properties used by [Equatable] for state comparison.
  @override
  List<Object> get props => [counter];

  /// 🔍 Returns a readable string for logging and debugging.
  @override
  String toString() => 'CounterOnCubitState(counter: $counter)';

  /// 🛠️ Creates a copy of the state with optional new values.
  ///
  /// This method maintains immutability and allows for concise state updates.
  CounterOnCubitState copyWith({int? counter}) {
    return CounterOnCubitState(
      counter: counter ?? this.counter,
    );
  }
}
