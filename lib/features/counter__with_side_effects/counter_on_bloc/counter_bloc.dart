import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 🚀 [CounterOnBloc] manages the counter's business logic using the BLoC pattern.
///
/// It listens to [IncrementCounterEvent] and [DecrementCounterEvent],
/// updating the state with the `emit()` method.
class CounterOnBloc extends Bloc<CounterOnBLoCEvent, CounterOnBLoCState> {
  ///
  /// 🆕 Initializes [CounterOnBloc] with the initial state.
  /// Registers event handlers for incrementing and decrementing the counter.
  CounterOnBloc() : super(CounterOnBLoCState.initial()) {
    on<IncrementCounterEvent>(_incrementCounter);
    on<DecrementCounterEvent>(_decrementCounter);
  }

  /// ➕ Handles the [IncrementCounterEvent] by increasing the counter.
  void _incrementCounter(
    IncrementCounterEvent event,
    Emitter<CounterOnBLoCState> emit,
  ) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  /// ➖ Handles the [DecrementCounterEvent] by decreasing the counter.
  void _decrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterOnBLoCState> emit,
  ) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
