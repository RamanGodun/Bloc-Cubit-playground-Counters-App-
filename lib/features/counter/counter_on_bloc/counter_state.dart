part of 'counter_bloc.dart';

/// 🔢 [CounterOnBLoCState] manages the state of the counter within the BLoC.
/// Utilizes [Equatable] to efficiently handle state changes and avoid unnecessary UI rebuilds.
final class CounterOnBLoCState extends Equatable {
  final int counter;

  /// 📦 Creates a new instance of [CounterOnBLoCState].
  const CounterOnBLoCState({required this.counter});

  /// 🚀 Factory constructor for the initial state with a default [counter] value of `0`.
  factory CounterOnBLoCState.initial() => const CounterOnBLoCState(counter: 0);

  /// 🔄 Creates a copy of the current state with optional updates, that helps maintain immutability.
  CounterOnBLoCState copyWith({int? counter}) {
    return CounterOnBLoCState(
      counter: counter ?? this.counter,
    );
  }

  /// 📑 Specifies the properties to compare for state equality.
  /// Ensures only relevant changes trigger state updates in the UI.
  @override
  List<Object> get props => [counter];

  /// 🧾 Provides a readable representation of the state for debugging and logging.
  @override
  String toString() => 'CounterOnBLoCState(counter: $counter)';
}
