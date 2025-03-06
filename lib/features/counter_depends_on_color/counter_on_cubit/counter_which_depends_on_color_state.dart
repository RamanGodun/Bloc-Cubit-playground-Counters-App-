part of 'counter_which_depends_on_color_cubit.dart';

/// 🟢 State class for `CounterCubitWhichDependsOnColorCubit`.
/// - Holds the current counter value.
final class CounterCubitStateWhichDependsOnColorCubit extends Equatable {
  final int counter;

  const CounterCubitStateWhichDependsOnColorCubit({required this.counter});

  /// 🟢 Initializes the state with a default counter value of `0`.
  factory CounterCubitStateWhichDependsOnColorCubit.initial() =>
      const CounterCubitStateWhichDependsOnColorCubit(counter: 0);

  /// 🟢 Creates a new state with an updated counter value.
  CounterCubitStateWhichDependsOnColorCubit copyWith({int? counter}) =>
      CounterCubitStateWhichDependsOnColorCubit(
        counter: counter ?? this.counter,
      );

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';
}