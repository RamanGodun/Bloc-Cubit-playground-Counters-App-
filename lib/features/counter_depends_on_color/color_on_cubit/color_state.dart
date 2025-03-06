part of 'color_cubit.dart';

/// 🟢 `ColorStateOnCubit` manages the color state within the Cubit architecture.
/// - Utilizes `Equatable` for optimized state comparison.
final class ColorStateOnCubit extends Equatable {
  final Color color;

  /// 🟢 Creates a new state with the given [color].
  const ColorStateOnCubit({required this.color});

  /// 🟢 Initial state with the default color set to the first color in `cyclicColors`.
  factory ColorStateOnCubit.initial() => const ColorStateOnCubit(
        color: AppConstants.grayColor, // Консистентність з cyclicColors
      );

  /// 🟢 Creates a new state with an optional color override.
  ColorStateOnCubit copyWith({Color? color}) =>
      ColorStateOnCubit(color: color ?? this.color);

  @override
  List<Object> get props => [color];

  @override
  String toString() => 'ColorStateOnCubit(color: $color)';
}
