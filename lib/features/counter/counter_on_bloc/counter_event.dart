part of 'counter_bloc.dart';

/// 🟢 `CounterOnBLoCEvent` is an abstract base class for all counter events.
/// Uses `Equatable` to enable efficient state comparison in BLoC.
sealed class CounterOnBLoCEvent extends Equatable {
  const CounterOnBLoCEvent();

  @override
  List<Object> get props => [];
}

/// 🟢 This events are handled by the `CounterOnBloc` to update the state.
final class IncrementCounterEvent extends CounterOnBLoCEvent {}

final class DecrementCounterEvent extends CounterOnBLoCEvent {}
