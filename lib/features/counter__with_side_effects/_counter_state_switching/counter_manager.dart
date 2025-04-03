import '../counter_on_bloc/counter_bloc.dart';
import '../counter_on_cubit/counter_cubit.dart';

/// 🔢 [CounterManager] defines an abstract interface for managing counter operations.
/// Supports both BLoC and Cubit state management strategies.
abstract class CounterManager {
  int get currentCounter;

  /// ➕ Increments the counter.
  void increment();

  /// ➖ Decrements the counter.
  void decrement();
}

/// 🚦 BLoC implementation of [CounterManager].
///
/// Manages the counter using [CounterOnBloc] and handles increment and
/// decrement actions by dispatching corresponding events.
class BlocCounterManager implements CounterManager {
  final CounterOnBloc _bloc;

  /// 🟢 Constructs a [BlocCounterManager] with the given [CounterOnBloc].
  BlocCounterManager(this._bloc);

  /// 🧮 Retrieves the current counter value from the BLoC state.
  @override
  int get currentCounter => _bloc.state.counter;

  /// 📈 Dispatches [IncrementCounterEvent] to increment the counter.
  @override
  void increment() => _bloc.add(IncrementCounterEvent());

  /// 📉 Dispatches [DecrementCounterEvent] to decrement the counter.
  @override
  void decrement() => _bloc.add(DecrementCounterEvent());
}

/// 🚦 Cubit implementation of [CounterManager].
///
/// Manages the counter using [CounterOnCubit] and performs increment and
/// decrement operations directly on the cubit.
class CubitCounterManager implements CounterManager {
  final CounterOnCubit _cubit;

  /// 🟢 Constructs a [CubitCounterManager] with the given [CounterOnCubit].
  CubitCounterManager(this._cubit);

  /// 🧮 Retrieves the current counter value from the Cubit state.
  @override
  int get currentCounter => _cubit.state.counter;

  /// 📈 Calls [increment] method on the Cubit to increase the counter.
  @override
  void increment() => _cubit.increment();

  /// 📉 Calls [decrement] method on the Cubit to decrease the counter.
  @override
  void decrement() => _cubit.decrement();
}
