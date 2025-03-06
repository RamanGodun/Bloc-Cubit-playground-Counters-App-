part of 'counter_bloc.dart';

/// 🟢 `CounterEvent` defines the base class for all events in `HydratedCounterBloc`.
/// - Uses `Equatable` for efficient state comparisons.
sealed class HydratedCounterEvent extends Equatable {
  const HydratedCounterEvent();

  @override
  List<Object> get props => [];
}

/// ➕ `IncrementCounterEvent` triggers an increment in the counter.
final class IncrementHydratedCounterEvent extends HydratedCounterEvent {}

/// ➖ `DecrementCounterEvent` triggers a decrement in the counter.
final class DecrementHydratedCounterEvent extends HydratedCounterEvent {}
