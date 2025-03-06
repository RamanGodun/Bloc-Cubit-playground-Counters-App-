import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/* Config */
import '../../../core/config/app_constants.dart';

/* Cubit */
import '../color_on_cubit/color_cubit.dart';

part 'counter_which_depends_on_color_state.dart';

/// 🟢 `CounterCubitWhichDependsOnColorCubit`
/// Manages the counter value based on the color state from [ColorOnCubit].
class CounterCubitWhichDependsOnColorCubit
    extends Cubit<CounterCubitStateWhichDependsOnColorCubit> {
  int _incrementSize = 1;
  final ColorOnCubit _colorCubit;
  late final StreamSubscription<ColorStateOnCubit> _colorSubscription;

  CounterCubitWhichDependsOnColorCubit({required ColorOnCubit colorCubit})
      : _colorCubit = colorCubit,
        super(CounterCubitStateWhichDependsOnColorCubit.initial()) {
    _colorSubscription = _colorCubit.stream.listen(_handleColorChange);
  }

  /// 🔄 Updates the increment size based on the current color state.
  void _handleColorChange(ColorStateOnCubit colorState) {
    _incrementSize = switch (colorState.color) {
      AppConstants.grayColor => 1,
      AppConstants.greenColor => 10,
      AppConstants.blueColor => 100,
      AppConstants.darkRedColor => -100,
      _ => 1,
    };

    if (colorState.color == AppConstants.darkRedColor) {
      emit(state.copyWith(counter: state.counter - 100));
    }

    print(
        '[Cubit] Color Changed to ${colorState.color}, New Increment Size: $_incrementSize');
  }

  /// ➕ Changes the counter by the current increment size.
  void changeCounter() {
    final newCounter = state.counter + _incrementSize;
    print(
        '[Cubit] ChangeCounter called - New Counter: $newCounter, Increment Size: $_incrementSize');
    emit(state.copyWith(counter: newCounter));
  }

  @override
  Future<void> close() async {
    await _colorSubscription.cancel();
    await super.close();
  }
}
