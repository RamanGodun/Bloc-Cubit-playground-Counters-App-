import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_that_depends_on_internet_state.dart';

class CounterThatDependsOnInternetCubit
    extends Cubit<CounterThatDependsOnInternetState> {
  CounterThatDependsOnInternetCubit()
      : super(const CounterThatDependsOnInternetState(counterValue: 0));

  void increment() => emit(
        CounterThatDependsOnInternetState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ),
      );

  void decrement() => emit(
        CounterThatDependsOnInternetState(
          counterValue: state.counterValue - 1,
          wasIncremented: false,
        ),
      );
}
