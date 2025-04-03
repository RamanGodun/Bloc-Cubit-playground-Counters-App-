import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 🎯 `CounterBlocWithTransformers` demonstrates advanced event handling with BLoC Transformers.
/// - 🚦 Uses `droppable()` and `restartable()` transformers for fine-grained event processing.
class CounterBlocWithTransformers
    extends Bloc<CounterEventWithTransformers, CounterStateWithTransformers> {
  CounterBlocWithTransformers()
      : super(CounterStateWithTransformers.initial()) {
    // ⏳ `Droppable` ignores new events while the current event is still being processed.
    on<IncrementCounterEventWithTransformers>(
      _handleIncrementCounterEvent,
      transformer: droppable(),
    );

    // 🔄 `Restartable` cancels the previous event and processes only the latest event.
    on<DecrementCounterEventWithTransformers>(
      _handleDecrementCounterEvent,
      transformer: restartable(),
    );
  }

  /// ⏳ Handles `IncrementCounterEventWithTransformers` with a delay.
  /// - Uses `droppable()` transformer to avoid event flooding.
  Future<void> _handleIncrementCounterEvent(
    IncrementCounterEventWithTransformers event,
    Emitter<CounterStateWithTransformers> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter + 1));
  }

  /// 🔄 Handles `DecrementCounterEventWithTransformers` with a delay.
  /// - Uses `restartable()` transformer to ensure only the latest event is executed.
  Future<void> _handleDecrementCounterEvent(
    DecrementCounterEventWithTransformers event,
    Emitter<CounterStateWithTransformers> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
