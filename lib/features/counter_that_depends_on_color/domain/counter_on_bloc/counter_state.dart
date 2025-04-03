part of 'counter_bloc.dart';

/// 📊 State for [CounterBlocWhichDependsOnColorBLoC].
/// Manages the counter value with logic influenced by color changes.
final class CounterStateWhichDependsOnColorBloc extends Equatable {
  final int counter;

  /// 🚀 Initializes the state with the provided [counter] value.
  const CounterStateWhichDependsOnColorBloc({
    required this.counter,
  });

  /// 🎯 Factory method to create the initial state with a counter value of 0.
  factory CounterStateWhichDependsOnColorBloc.initial() {
    return const CounterStateWhichDependsOnColorBloc(counter: 0);
  }

  /// 🧬 Supports state comparison to avoid unnecessary rebuilds.
  @override
  List<Object> get props => [counter];

  /// 📝 Provides a readable output for debugging purposes.
  @override
  String toString() => 'CounterState(counter: $counter)';

  /// 🔄 Creates a new state with an optional counter update.
  /// Uses [copyWith] to maintain immutability and prevent direct state mutations.
  CounterStateWhichDependsOnColorBloc copyWith({
    int? counter,
  }) {
    return CounterStateWhichDependsOnColorBloc(
      counter: counter ?? this.counter,
    );
  }
}
