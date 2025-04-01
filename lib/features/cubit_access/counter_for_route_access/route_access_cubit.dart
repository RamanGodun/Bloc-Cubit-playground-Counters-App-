import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'route_access_state.dart';

class RouteAccessCounterCubit extends Cubit<RouteAccessCounterState> {
  RouteAccessCounterCubit() : super(RouteAccessCounterState.initial());

  void increment() => emit(
        state.copyWith(
          counter: state.counter + 1,
          wasIncremented: true,
        ),
      );

  void decrement() => emit(
        state.copyWith(
          counter: state.counter - 1,
          wasIncremented: false,
        ),
      );
}
