import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 💾 `HydratedCounterBloc` manages the counter state with persistent storage.
/// - Automatically restores state from local storage using `HydratedMixin`.
/// - Handles increment and decrement events.
class HydratedCounterBloc
    extends Bloc<HydratedCounterEvent, HydratedCounterBlocState>
    with HydratedMixin {
  /// 🟢 Initializes the BLoC with the initial state and sets up event handlers.
  HydratedCounterBloc() : super(HydratedCounterBlocState.initial()) {
    hydrate();

    on<IncrementHydratedCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementHydratedCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }

  /// 🔄 Restores the state from JSON when the app is relaunched.
  @override
  HydratedCounterBlocState? fromJson(Map<String, dynamic> json) {
    print('Counter from storage: $json');
    return HydratedCounterBlocState.fromJson(json);
  }

  /// 💾 Saves the current state as JSON for persistence.
  @override
  Map<String, dynamic>? toJson(HydratedCounterBlocState state) {
    print('CounterState to storage: $state');
    return state.toJson();
  }
}
