part of 'counter_bloc.dart';

/// 📡 Base event class for [CounterBlocWhichDependsOnColorBLoC].
/// All specific events for this BLoC should extend this class.
sealed class CounterEventWhichDependsOnColorBloc extends Equatable {
  const CounterEventWhichDependsOnColorBloc();

  @override
  List<Object> get props => [];
}

/// 🔄 Event to trigger a counter change based on the current color state.
final class ChangeCounterEvent extends CounterEventWhichDependsOnColorBloc {}
