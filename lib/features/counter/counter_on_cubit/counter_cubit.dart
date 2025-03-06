import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

/// 🟢 `CounterOnCubit` is a simple state manager for the counter.
/// It provides increment and decrement functionalities using the `Cubit` pattern.
class CounterOnCubit extends Cubit<CounterOnCubitState> {
  /// Initializes the cubit with the initial state where the counter is set to 0.
  CounterOnCubit() : super(CounterOnCubitState.initial());

  void increment() {
    final newState = state.copyWith(counter: state.counter + 1);
    print(newState);
    emit(newState);
  }

  /*
   🟢 For logging, `CubitObserver.onChange()` is recommended.
   If logging is not needed, the increment method can be simplified:
   void increment() => emit(state.copyWith(counter: state.counter + 1));
  */

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
