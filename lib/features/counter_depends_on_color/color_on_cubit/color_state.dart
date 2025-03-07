part of 'color_cubit.dart';

/// 🎨 [ColorStateOnCubit] manages the color state within the Cubit architecture.
/// - Utilizes `Equatable` for efficient state comparison.
final class ColorStateOnCubit extends Equatable {
  final Color color;

  /// 🆕 Creates a new state with the specified [color].
  const ColorStateOnCubit({required this.color});

  /// 🎯 Initial state with the default color set to the first color in `cyclicColors`.
  factory ColorStateOnCubit.initial() => const ColorStateOnCubit(
        color: AppConstants.grayColor, // 🔗 Consistency with `cyclicColors`
      );

  /// 🔄 Creates a new state with an optional color override.
  /// - Keeps the current color if none is provided.
  ColorStateOnCubit copyWith({Color? color}) =>
      ColorStateOnCubit(color: color ?? this.color);

  /// 🧮 Properties for `Equatable` to ensure efficient state comparison.
  @override
  List<Object> get props => [color];

  /// 📝 Provides a readable representation of the state for debugging.
  @override
  String toString() => 'ColorStateOnCubit(color: $color)';
}
