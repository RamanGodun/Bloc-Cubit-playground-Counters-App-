part of 'counter_which_depends_on_color_cubit.dart';

/// 🔢 [CounterCubitStateWhichDependsOnColorCubit] manages the state of the counter.
/// - Utilizes `Equatable` to ensure efficient state comparisons.
/// - Supports immutability and state cloning through `copyWith`.
final class CounterCubitStateWhichDependsOnColorCubit extends Equatable {
  final int counter;

  /// 🆕 Creates a new state with the provided [counter] value.
  const CounterCubitStateWhichDependsOnColorCubit({required this.counter});

  /// 🟢 Initializes the state with a default counter value of `0`.
  factory CounterCubitStateWhichDependsOnColorCubit.initial() =>
      const CounterCubitStateWhichDependsOnColorCubit(counter: 0);

  /// 🌀 Returns a copy of the state with an updated [counter] value.
  /// - If [counter] is `null`, retains the existing value.
  CounterCubitStateWhichDependsOnColorCubit copyWith({int? counter}) =>
      CounterCubitStateWhichDependsOnColorCubit(
        counter: counter ?? this.counter,
      );

  /// 🧠 Determines when the state has changed to trigger UI updates.
  @override
  List<Object> get props => [counter];

  /// 📝 Provides a clear and concise representation of the state for debugging.
  @override
  String toString() => 'CounterCubitState(counter: $counter)';
}
