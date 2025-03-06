part of 'counter_bloc.dart';

/// 🎯 `CounterEvent` is the base class for all counter-related events.
/// - Utilizes `Equatable` to optimize state comparison and avoid unnecessary rebuilds.
sealed class CounterEventWithTransformers extends Equatable {
  const CounterEventWithTransformers();

  @override
  List<Object> get props => [];
}

/// ➕ `IncrementCounterEvent` triggers an increment of the counter.
final class IncrementCounterEventWithTransformers
    extends CounterEventWithTransformers {}

/// ➖ `DecrementCounterEvent` triggers a decrement of the counter.
final class DecrementCounterEventWithTransformers
    extends CounterEventWithTransformers {}
