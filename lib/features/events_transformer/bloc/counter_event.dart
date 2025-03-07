part of 'counter_bloc.dart';

/// 🎯 [CounterEventWithTransformers] is the base class for all counter-related events.
/// - 🛠️ Utilizes `Equatable` to optimize state comparison and avoid unnecessary rebuilds.
sealed class CounterEventWithTransformers extends Equatable {
  const CounterEventWithTransformers();

  @override
  List<Object> get props => [];
}

/// ➕ `IncrementCounterEventWithTransformers` triggers an increment of the counter.
/// - Handled by the `CounterBlocWithTransformers` to increase the counter value.
final class IncrementCounterEventWithTransformers
    extends CounterEventWithTransformers {}

/// ➖ `DecrementCounterEventWithTransformers` triggers a decrement of the counter.
/// - Handled by the `CounterBlocWithTransformers` to decrease the counter value.
final class DecrementCounterEventWithTransformers
    extends CounterEventWithTransformers {}
