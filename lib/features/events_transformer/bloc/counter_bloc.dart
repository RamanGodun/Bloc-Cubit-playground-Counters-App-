import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 🎯 `CounterBlocWithTransformers` demonstrates advanced event handling with BLoC Transformers.
/// - Uses `droppable()` and `restartable()` transformers to control event processing.
class CounterBlocWithTransformers
    extends Bloc<CounterEventWithTransformers, CounterStateWithTransformers> {
  CounterBlocWithTransformers()
      : super(CounterStateWithTransformers.initial()) {
    // ⏳ Droppable - Ignores new events while the current event is still being processed.
    on<IncrementCounterEventWithTransformers>(
      _handleIncrementCounterEvent,
      transformer: droppable(),
    );

    // 🔄 Restartable - Cancels the previous event and processes the latest event.
    on<DecrementCounterEventWithTransformers>(
      _handleDecrementCounterEvent,
      transformer: restartable(),
    );
  }

  /// ⏳ Handles `IncrementCounterEvent` with a delay.
  /// - Uses `droppable()` transformer to ignore new increment events while processing.
  Future<void> _handleIncrementCounterEvent(
    IncrementCounterEventWithTransformers event,
    Emitter<CounterStateWithTransformers> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(counter: state.counter + 1));
  }

  /// 🔄 Handles `DecrementCounterEvent` with a delay.
  /// - Uses `restartable()` transformer to cancel previous requests and execute the latest one.
  Future<void> _handleDecrementCounterEvent(
    DecrementCounterEventWithTransformers event,
    Emitter<CounterStateWithTransformers> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
