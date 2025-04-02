import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'internet_cubit.dart';

part 'counter_that_depends_on_internet_state.dart';

class CounterThatDependsOnInternetCubit
    extends Cubit<CounterThatDependsOnInternetState> {
  InternetState? previousState;

  CounterThatDependsOnInternetCubit()
      : super(CounterThatDependsOnInternetState.initial());

  void incrementOn10() {
    emit(state.copyWith(
      counter: state.counter + 10,
      wasIncremented: true,
    ));
  }

  void decrementOn10() {
    emit(state.copyWith(
      counter: state.counter - 15,
      wasIncremented: false,
    ));
  }

  void increment() =>
      emit(state.copyWith(counter: state.counter + 1, wasIncremented: true));
  void decrement() =>
      emit(state.copyWith(counter: state.counter - 1, wasIncremented: false));
}
