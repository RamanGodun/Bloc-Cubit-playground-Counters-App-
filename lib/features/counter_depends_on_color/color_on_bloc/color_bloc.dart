import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/* Config */
import '../../../core/config/app_constants.dart';

part 'color_event.dart';
part 'color_state.dart';

/// 🟢 `ColorOnBloc` manages color-changing logic using `ColorEvents`.
/// - Initializes with a default state using `ColorStateOnBLoC.initial()`.
/// - Supports cyclic color transitions using colors from `AppConstants.cyclicColors`.
class ColorOnBloc extends Bloc<ColorEvents, ColorStateOnBLoC> {
  /// 🎨 Retrieves the predefined color cycle from `AppConstants`.
  static const List<Color> _colors = AppConstants.cyclicColors;

  /// 🟢 Initializes the `ColorOnBloc` and sets up the event handler.
  ColorOnBloc() : super(ColorStateOnBLoC.initial()) {
    on<ChangeColorEvent>(_onChangeColor);
  }

  /// 🟢 Handles the `ChangeColorEvent` to update the color state.
  /// - Retrieves the current color's index.
  /// - Calculates the index of the next color in a cyclic manner.
  /// - Emits the new state with the updated color.
  void _onChangeColor(
    ChangeColorEvent event,
    Emitter<ColorStateOnBLoC> emit,
  ) {
    final nextIndex = (_colors.indexOf(state.color) + 1) % _colors.length;
    emit(state.copyWith(color: _colors[nextIndex]));
  }
}
