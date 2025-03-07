part of 'color_bloc.dart';

/// 🎨 [ColorEvents] is the abstract base class for all events related to [ColorOnBloc].
/// - ✅ Uses `Equatable` to optimize state management.
sealed class ColorEvents extends Equatable {
  const ColorEvents();

  @override
  List<Object> get props => [];
}

/// 🌈 [ChangeColorEvent] triggers a color transition in [ColorOnBloc].
/// - 📲 Initiates the switch to the next color in the cyclic list.
final class ChangeColorEvent extends ColorEvents {}
