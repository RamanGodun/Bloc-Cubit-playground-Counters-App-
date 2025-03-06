import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 🟢 `CounterOnBloc` handles the business logic for the counter.
/// It processes `IncrementCounterEvent` and `DecrementCounterEvent`
/// and updates the state using the `emit()` method.
class CounterOnBloc extends Bloc<CounterOnBLoCEvent, CounterOnBLoCState> {
  /// 🟢 Initializes `CounterOnBloc` with the initial state.
  /// Registers event handlers for incrementing and decrementing the counter.
  CounterOnBloc() : super(CounterOnBLoCState.initial()) {
    on<IncrementCounterEvent>(_incrementCounter);
    on<DecrementCounterEvent>(_decrementCounter);
  }

  void _incrementCounter(
    IncrementCounterEvent event,
    Emitter<CounterOnBLoCState> emit,
  ) =>
      emit(state.copyWith(counter: state.counter + 1));

  void _decrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterOnBLoCState> emit,
  ) =>
      emit(state.copyWith(counter: state.counter - 1));
}
