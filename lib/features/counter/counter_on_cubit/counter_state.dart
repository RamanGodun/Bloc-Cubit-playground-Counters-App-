part of 'counter_cubit.dart';

/// 🟢 `CounterOnCubitState` represents the state of the counter in the Cubit.
/// Utilizes `Equatable` to ensure state comparisons are efficient and avoid unnecessary UI rebuilds.
final class CounterOnCubitState extends Equatable {
  final int counter;

  const CounterOnCubitState({required this.counter});

  /// 🟢 Factory constructor for the initial state of the counter.
  factory CounterOnCubitState.initial() {
    return const CounterOnCubitState(counter: 0);
  }

  /// 🟢 Properties used by `Equatable` for comparison.
  @override
  List<Object> get props => [counter];

  /// 🟢 A more readable `toString` method for logging and debugging.
  @override
  String toString() => 'CounterOnCubitState(counter: $counter)';

  /// 🟢 The `copyWith` method allows cloning the state with optional new values.
  /// Prevents direct mutation and maintains immutability of the state.
  CounterOnCubitState copyWith({int? counter}) {
    return CounterOnCubitState(
      counter: counter ?? this.counter,
    );
  }
}
