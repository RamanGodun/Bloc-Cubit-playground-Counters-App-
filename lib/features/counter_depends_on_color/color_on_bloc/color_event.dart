part of 'color_bloc.dart';

/// 🟢 `ColorEvents` serves as the base class for all events in `ColorOnBloc`.
/// - Utilizes `Equatable` to avoid unnecessary widget rebuilds.
/// - Facilitates future extension with additional color-related events.
sealed class ColorEvents extends Equatable {
  const ColorEvents();

  @override
  List<Object> get props => [];
}

/// 🟢 `ChangeColorEvent` triggers a color transition in the BLoC.
/// - Initiates the switch to the next color in the predefined cycle.
/// - Lightweight and stateless, ensuring efficient event handling.
final class ChangeColorEvent extends ColorEvents {}