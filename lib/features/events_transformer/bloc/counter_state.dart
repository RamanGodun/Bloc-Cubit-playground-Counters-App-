part of 'counter_bloc.dart';

/// 🎯 [CounterStateWithTransformers] holds the state of the counter.
/// - 🛠️ Utilizes `Equatable` for efficient state comparison.
final class CounterStateWithTransformers extends Equatable {
  final int counter;

  /// 🟢 Initial state with `counter` set to `0`.
  const CounterStateWithTransformers({required this.counter});

  /// 🚦 Factory constructor for creating the initial state.
  factory CounterStateWithTransformers.initial() =>
      const CounterStateWithTransformers(counter: 0);

  /// ⚖️ Provides properties for state comparison.
  @override
  List<Object> get props => [counter];

  /// 📊 Improves state logging with a clear `toString` output.
  @override
  String toString() => '📊 CounterStateWithTransformers(counter: $counter)';

  /// 🔁 Creates a new state with an optional counter update.
  CounterStateWithTransformers copyWith({int? counter}) {
    return CounterStateWithTransformers(
      counter: counter ?? this.counter,
    );
  }
}
