part of 'counter_bloc.dart';

/// 🟢 `CounterState` holds the state of the counter in `HydratedCounterBloc`.
/// - Utilizes `Equatable` for efficient UI rebuilds.
/// - Supports JSON serialization/deserialization for hydrated state persistence.
final class HydratedCounterBlocState extends Equatable {
  final int counter;

  factory HydratedCounterBlocState.initial() =>
      const HydratedCounterBlocState(counter: 0);

  const HydratedCounterBlocState({required this.counter});

  /// 🟢 Copies the current state with an optional new counter value.
  HydratedCounterBlocState copyWith({int? counter}) {
    return HydratedCounterBlocState(counter: counter ?? this.counter);
  }

  /// 🟢 Converts the state to a JSON map for persistence.
  Map<String, dynamic> toJson() => {'counter': counter};

  /// 🟢 Creates a state from a JSON map.
  factory HydratedCounterBlocState.fromJson(Map<String, dynamic> json) {
    return HydratedCounterBlocState(counter: json['counter']?.toInt() ?? 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';
}
