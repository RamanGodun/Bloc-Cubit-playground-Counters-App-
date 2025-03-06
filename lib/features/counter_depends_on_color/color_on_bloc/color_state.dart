part of 'color_bloc.dart';

/// 🟢 `ColorStateOnBLoC` manages the color state in the `ColorOnBloc`.
/// - Utilizes `Equatable` for efficient UI rebuilds only when necessary.
final class ColorStateOnBLoC extends Equatable {
  final Color color;

  const ColorStateOnBLoC({required this.color});

  /// 🟢 Initial state with the default color set to the first color in `cyclicColors`.
  factory ColorStateOnBLoC.initial() => const ColorStateOnBLoC(
        color: AppConstants.grayColor, // Синхронізація з cyclicColors
      );

  /// 🟢 Creates a new instance of `ColorStateOnBLoC` with an updated color.
  /// - If [color] is null, retains the current state color.
  ColorStateOnBLoC copyWith({Color? color}) {
    return ColorStateOnBLoC(color: color ?? this.color);
  }

  /// 🟢 Defines properties that determine if the state has changed.
  /// - Ensures the UI rebuilds only when the color is different.
  @override
  List<Object> get props => [color];

  /// 🟢 Provides a readable output for state debugging.
  @override
  String toString() => 'ColorStateOnBLoC(color: $color)';
}