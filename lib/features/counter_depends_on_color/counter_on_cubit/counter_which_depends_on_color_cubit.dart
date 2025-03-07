import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

/* Config */
import '../../../core/config/constants/app_constants.dart';

/* Cubit */
import '../color_on_cubit/color_cubit.dart';

part 'counter_which_depends_on_color_state.dart';

/// 🔢 [CounterCubitWhichDependsOnColorCubit]
/// Manages the counter value based on the color state from [ColorOnCubit].
/// - Dynamically adjusts the increment size based on the current color.
/// - Automatically updates the counter when the color changes.
class CounterCubitWhichDependsOnColorCubit
    extends Cubit<CounterCubitStateWhichDependsOnColorCubit> {
  /// 🚦 Current increment size, influenced by the color state.
  int _incrementSize = 1;

  /// 🎨 Reference to the [ColorOnCubit] for listening to color changes.
  final ColorOnCubit _colorCubit;

  /// 🔗 Subscription to the color stream for automatic state updates.
  late final StreamSubscription<ColorStateOnCubit> _colorSubscription;

  /// 🟢 Initializes the cubit and sets up the color change listener.
  CounterCubitWhichDependsOnColorCubit({required ColorOnCubit colorCubit})
      : _colorCubit = colorCubit,
        super(CounterCubitStateWhichDependsOnColorCubit.initial()) {
    _colorSubscription = _colorCubit.stream.listen(_handleColorChange);
  }

  /// 🎨 Handles color changes by updating the increment size.
  /// - Applies special logic for the `darkRedColor` by immediately decrementing the counter.
  void _handleColorChange(ColorStateOnCubit colorState) {
    _incrementSize = switch (colorState.color) {
      AppConstants.grayColor => 1,
      AppConstants.greenColor => 10,
      AppConstants.blueColor => 100,
      AppConstants.darkRedColor => -100,
      _ => 1,
    };

    if (colorState.color == AppConstants.darkRedColor) {
      // emit(state.copyWith(counter: state.counter - 100));
    }

    print(
        '🎨 [Cubit] Color Changed to ${colorState.color}, New Increment Size: $_incrementSize');
  }

  /// ➕ Updates the counter by adding the current increment size.
  void changeCounter() {
    final newCounter = state.counter + _incrementSize;
    print(
        '🔢 [Cubit] Counter Updated - New Counter: $newCounter, Increment Size: $_incrementSize');
    emit(state.copyWith(counter: newCounter));
  }

  /// 🛑 Disposes of the color stream subscription when the cubit is closed.
  @override
  Future<void> close() async {
    await _colorSubscription.cancel();
    await super.close();
  }
}
