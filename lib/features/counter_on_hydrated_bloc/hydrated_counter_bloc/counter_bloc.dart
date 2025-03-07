import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 💾 `HydratedCounterBloc` manages the counter state with persistent storage.
/// - 🧠 Automatically restores state from local storage using `HydratedMixin`.
/// - 🔄 Handles increment and decrement events.
class HydratedCounterBloc
    extends Bloc<HydratedCounterEvent, HydratedCounterBlocState>
    with HydratedMixin {
  /// 🟢 Initializes the BLoC with the initial state and sets up event handlers.
  HydratedCounterBloc() : super(HydratedCounterBlocState.initial()) {
    hydrate(); // 💧 Restores the state when the app starts

    // ➕ Handles increment event
    on<IncrementHydratedCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
      print('🟢 Incremented counter to ${state.counter}');
    });

    // ➖ Handles decrement event
    on<DecrementHydratedCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
      print('🔴 Decremented counter to ${state.counter}');
    });
  }

  /// 🔄 Restores the state from JSON when the app is relaunched.
  @override
  HydratedCounterBlocState? fromJson(Map<String, dynamic> json) {
    print('💾 Restoring Counter from storage: $json');
    return HydratedCounterBlocState.fromJson(json);
  }

  /// 💾 Saves the current state as JSON for persistence.
  @override
  Map<String, dynamic>? toJson(HydratedCounterBlocState state) {
    print('💾 Saving CounterState to storage: $state');
    return state.toJson();
  }
}
