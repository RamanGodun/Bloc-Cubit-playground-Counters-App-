part of 'counter_bloc.dart';

/// Base event class for `CounterBlocWhichDependsOnColorBLoC`.
sealed class CounterEventWhichDependsOnColorBloc extends Equatable {
  const CounterEventWhichDependsOnColorBloc();

  @override
  List<Object> get props => [];
}

/// Event to trigger a counter change.
final class ChangeCounterEvent extends CounterEventWhichDependsOnColorBloc {}
