part of 'color_bloc.dart';

/// 🎨 [ColorStateOnBLoC] manages the color state within the `ColorOnBloc`.
/// - ✅ Implements `Equatable` to optimize UI rebuilds.
/// - 🌀 Maintains immutability and enables state cloning with `copyWith`.
final class ColorStateOnBLoC extends Equatable {
  final Color color;

  /// 🟢 Constructs a `ColorStateOnBLoC` with the specified [color].
  const ColorStateOnBLoC({required this.color});

  /// 🟢 Provides the initial state with the default color set to gray.
  /// - Aligns with the first color in [AppConstants.cyclicColors].
  factory ColorStateOnBLoC.initial() => const ColorStateOnBLoC(
        color: AppConstants.grayColor,
      );

  /// 🌀 Clones the state with an optional updated [color].
  /// - If [color] is `null`, retains the existing state color.
  ColorStateOnBLoC copyWith({Color? color}) {
    return ColorStateOnBLoC(color: color ?? this.color);
  }

  /// 🧠 Optimizes state comparison for efficient UI updates.
  @override
  List<Object> get props => [color];

  /// 📝 Returns a readable string for easier debugging.
  @override
  String toString() => 'ColorStateOnBLoC(color: $color)';
}
