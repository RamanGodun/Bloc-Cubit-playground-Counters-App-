import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/* Config */
import '../../../core/config/app_constants.dart';

/* Bloc */
import '../color_on_bloc/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// 🟢 `CounterBlocWhichDependsOnColorBLoC`
/// Manages counter changes based on the color state from [ColorOnBloc].
class CounterBlocWhichDependsOnColorBLoC extends Bloc<
    CounterEventWhichDependsOnColorBloc, CounterStateWhichDependsOnColorBloc> {
  int _incrementSize = 1;
  late final StreamSubscription<ColorStateOnBLoC> _colorSubscription;

  /// 🔄 Initializes the BLoC and sets up event handlers.
  CounterBlocWhichDependsOnColorBLoC({required ColorOnBloc colorBloc})
      : super(CounterStateWhichDependsOnColorBloc.initial()) {
    _colorSubscription = colorBloc.stream.listen(_handleColorChange);
    on<ChangeCounterEvent>(_onChangeCounter);
  }

  /// 🎨 Updates [_incrementSize] based on the current color and triggers a counter change.
  void _handleColorChange(ColorStateOnBLoC colorState) {
    _incrementSize = switch (colorState.color) {
      AppConstants.grayColor => 1,
      AppConstants.greenColor => 10,
      AppConstants.blueColor => 100,
      AppConstants.darkRedColor => -100,
      _ => 1,
    };
    add(ChangeCounterEvent());

    print(
        '[BLoC] Color Changed to ${colorState.color}, New Increment Size: $_incrementSize');
  }

  /// ➕ Emits a new state with an updated counter value.
  void _onChangeCounter(
    ChangeCounterEvent event,
    Emitter<CounterStateWhichDependsOnColorBloc> emit,
  ) {
    final newCounter = state.counter + _incrementSize;
    print(
        '[BLoC] Counter Changed - New Counter: $newCounter, Increment Size: $_incrementSize');
    emit(state.copyWith(counter: newCounter));
  }

  /// 🛑 Cancels the color subscription when the BLoC is closed.
  @override
  Future<void> close() async {
    await _colorSubscription.cancel();
    await super.close();
  }
}
