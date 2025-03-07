import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/* Config */
import '../../../core/config/constants/app_constants.dart';

part 'color_state.dart';

/// 🎨 [ColorOnCubit] manages color changes in a cyclical order.
class ColorOnCubit extends Cubit<ColorStateOnCubit> {
  /// 🟢 Predefined list of colors for cyclic transitions
  final List<Color> _colors = AppConstants.cyclicColors;

  /// 🔄 Initializes the cubit with the default color state.
  ColorOnCubit() : super(ColorStateOnCubit.initial());

  /// 🎯 Cycles through colors in the predefined list.
  ///
  /// 🆕 Emits a new state with the next color in the cycle.
  /// The color cycle is:
  /// 1️⃣ Grey → 2️⃣ Green → 3️⃣ Blue → 4️⃣ Red → 🔁 Grey
  void changeColor() {
    final currentIndex = _colors.indexOf(state.color);
    final nextIndex = (currentIndex + 1) % _colors.length;
    emit(state.copyWith(color: _colors[nextIndex]));
  }
}
