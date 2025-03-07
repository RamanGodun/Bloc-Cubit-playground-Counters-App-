import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/* Config */
import '../../../core/app_constants/app_constants.dart';

part 'color_event.dart';
part 'color_state.dart';

/// 🎨 [ColorOnBloc] manages the application's color-changing logic using the BLoC pattern.
/// - Cycles through a predefined list of colors stored in [AppConstants.cyclicColors].
/// - Listens for [ChangeColorEvent] and updates the color state accordingly.
class ColorOnBloc extends Bloc<ColorEvents, ColorStateOnBLoC> {
  /// 🌈 Retrieves the predefined color cycle from [AppConstants].
  static const List<Color> _colors = AppConstants.cyclicColors;

  /// 🚀 Initializes [ColorOnBloc] with the default state.
  /// Sets up an event handler for [ChangeColorEvent].
  ColorOnBloc() : super(ColorStateOnBLoC.initial()) {
    on<ChangeColorEvent>(_onChangeColor);
  }

  /// 🔄 Handles the [ChangeColorEvent] to update the color state.
  /// - 🧮 Calculates the next color index cyclically.
  /// - 📢 Emits a new state with the updated color.
  void _onChangeColor(
    ChangeColorEvent event,
    Emitter<ColorStateOnBLoC> emit,
  ) {
    final nextIndex = (_colors.indexOf(state.color) + 1) % _colors.length;
    emit(state.copyWith(color: _colors[nextIndex]));
    print('🟢 Color changed to: ${_colors[nextIndex]}');
  }
}
