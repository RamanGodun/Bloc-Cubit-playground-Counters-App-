part of 'counter_bloc.dart';

/// 🔄 [CounterOnBLoCEvent] serves as the base class for all events related to the counter BLoC.
///
/// It utilizes [Equatable] to optimize event comparison and avoid unnecessary state rebuilds.
sealed class CounterOnBLoCEvent extends Equatable {
  const CounterOnBLoCEvent();

  @override
  List<Object> get props => [];
}

/// ➕ [IncrementCounterEvent] triggers an increment in the counter state.
final class IncrementCounterEvent extends CounterOnBLoCEvent {}

/// ➖ [DecrementCounterEvent] triggers a decrement in the counter state.
final class DecrementCounterEvent extends CounterOnBLoCEvent {}
