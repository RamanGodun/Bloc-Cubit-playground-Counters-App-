import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'internet_cubit.dart';

part 'counter_that_depends_on_internet_state.dart';

class CounterThatDependsOnInternetCubit
    extends Cubit<CounterThatDependsOnInternetState> {
  final Stream<InternetState> internetStream;
  late final StreamSubscription<InternetState> _subscription;
  InternetState? _previousState;

  CounterThatDependsOnInternetCubit({required this.internetStream})
      : super(CounterThatDependsOnInternetState.initial()) {
    _subscription = internetStream.listen(_onInternetStateChanged);
  }

  void _onInternetStateChanged(InternetState currentState) {
    print('[InternetChange] prev=$_previousState, current=$currentState');

    if (_previousState == null) {
      _previousState = currentState;
      return;
    }

    final isSameType = _previousState.runtimeType == currentState.runtimeType;
    final isSameTimestamp = _previousState!.timestamp == currentState.timestamp;

    if (isSameType && isSameTimestamp) {
      print('[INFO] No change in type or timestamp → skip');
      return;
    }

    final wasConnected = _previousState is InternetConnected;
    final isConnected = currentState is InternetConnected;

    if (!wasConnected && isConnected) {
      print('[ACTION] Incrementing counter');
      increment();
    } else if (wasConnected && !isConnected) {
      print('[ACTION] Decrementing counter');
      decrement();
    } else {
      print('[INFO] No counter change');
    }

    _previousState = currentState;
  }

  void increment() {
    final newCounter = state.counter + 1;
    print('[COUNTER] Incremented: $newCounter');
    emit(state.copyWith(
      counter: newCounter,
      wasIncremented: true,
    ));
  }

  void decrement() {
    final newCounter = state.counter - 1;
    print('[COUNTER] Decremented: $newCounter');
    emit(state.copyWith(
      counter: newCounter,
      wasIncremented: false,
    ));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
