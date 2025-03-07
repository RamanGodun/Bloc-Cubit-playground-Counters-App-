import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

/// 🟢 [CounterOnCubit] manages the counter state using the Cubit pattern.
///
/// Provides basic increment and decrement functionality, ensuring a clean and immutable state transition.
class CounterOnCubit extends Cubit<CounterOnCubitState> {
  /// 🚀 Initializes with the initial state where the counter is set to `0`.
  CounterOnCubit() : super(CounterOnCubitState.initial());

  /// ➕ Increments the counter by 1 and emits a new state.
  void increment() {
    final newState = state.copyWith(counter: state.counter + 1);
    print('🟢 Incremented to: ${newState.counter}');
    emit(newState);
  }

  /*
   📝 Tip:
   For cleaner code without logging, you can simplify the increment method:
   void increment() => emit(state.copyWith(counter: state.counter + 1));
  */

  /// ➖ Decrements the counter by 1 and emits the updated state.
  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
    print('🔴 Decremented to: ${state.counter}');
  }
}
