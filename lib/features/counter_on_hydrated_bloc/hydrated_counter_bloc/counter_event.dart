part of 'counter_bloc.dart';

/// 🟢 [HydratedCounterEvent] serves as the base class for all events in [HydratedCounterBloc].
/// - Inherits from `Equatable` to optimize state comparison and prevent unnecessary UI rebuilds.
sealed class HydratedCounterEvent extends Equatable {
  const HydratedCounterEvent();

  /// 🧮 Returns the properties used for state comparison.
  @override
  List<Object> get props => [];
}

/// ➕ `IncrementHydratedCounterEvent` is dispatched to increase the counter value.
final class IncrementHydratedCounterEvent extends HydratedCounterEvent {}

/// ➖ `DecrementHydratedCounterEvent` is dispatched to decrease the counter value.
final class DecrementHydratedCounterEvent extends HydratedCounterEvent {}
