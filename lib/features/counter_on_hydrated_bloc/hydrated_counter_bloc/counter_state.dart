part of 'counter_bloc.dart';

/// 🟢 `HydratedCounterBlocState` holds the state of the counter in `HydratedCounterBloc`.
/// - Utilizes `Equatable` for efficient UI rebuilds.
/// - Supports JSON serialization/deserialization for hydrated state persistence.
final class HydratedCounterBlocState extends Equatable {
  final int counter;

  /// 🟢 Factory method for creating the initial state with a default `counter` of `0`.
  factory HydratedCounterBlocState.initial() =>
      const HydratedCounterBlocState(counter: 0);

  /// 🟢 Constructor for creating a new state with a specific `counter` value.
  const HydratedCounterBlocState({required this.counter});

  /// 🔄 Copies the current state with an optional new `counter` value.
  HydratedCounterBlocState copyWith({int? counter}) {
    return HydratedCounterBlocState(counter: counter ?? this.counter);
  }

  /// 💾 Converts the state to a JSON map for persistence.
  /// - Useful for saving the state when the app is closed or paused.
  Map<String, dynamic> toJson() => {'counter': counter};

  /// 🔄 Creates a state instance from a JSON map.
  /// - Safely parses the `counter` value with a default fallback to `0`.
  factory HydratedCounterBlocState.fromJson(Map<String, dynamic> json) {
    return HydratedCounterBlocState(counter: json['counter']?.toInt() ?? 0);
  }

  /// 🧮 Ensures only the `counter` is used for state comparison.
  @override
  List<Object> get props => [counter];

  /// 📝 Provides a clear and formatted string representation of the state.
  @override
  String toString() => 'HydratedCounterBlocState(counter: $counter)';
}
