import 'package:flutter/material.dart';
import '../counter_on_bloc/counter_bloc.dart';
import '../color_on_bloc/color_bloc.dart';
import '../counter_on_cubit/counter_which_depends_on_color_cubit.dart';
import '../color_on_cubit/color_cubit.dart';

/// 🟢 Abstract class providing an interface for counter and background color management.
abstract class CounterDependsOnColorManager extends ChangeNotifier {
  int get currentCounter;
  // 🟢 Reactive background color using `ValueNotifier`.
  final ValueNotifier<Color> backgroundColor =
      ValueNotifier<Color>(Colors.white);

  void changeCounter();
  void changeColor();
}

/// 🟢 `CounterDependsOnColorManager` implementation using BLoC.
class BlocCounterDependsOnColorManager extends CounterDependsOnColorManager {
  final CounterBlocWhichDependsOnColorBLoC _counterBloc;
  final ColorOnBloc _colorBloc;

  /// Initializes the manager and subscribes to color state changes from BLoC.
  BlocCounterDependsOnColorManager(this._counterBloc, this._colorBloc) {
    _colorBloc.stream.listen((colorState) {
      backgroundColor.value = colorState.color;
      notifyListeners();
    });
  }

  @override
  int get currentCounter => _counterBloc.state.counter;

  /// Dispatches an event to change the counter in BLoC.
  @override
  void changeCounter() => _counterBloc.add(ChangeCounterEvent());

  /// Dispatches an event to change the background color in BLoC.
  @override
  void changeColor() => _colorBloc.add(ChangeColorEvent());
}

/// 🟢 `CounterDependsOnColorManager` implementation using Cubit.
class CubitCounterDependsOnColorManager extends CounterDependsOnColorManager {
  final CounterCubitWhichDependsOnColorCubit _counterCubit;
  final ColorOnCubit _colorCubit;

  /// Initializes the manager and subscribes to color state changes from Cubit.
  CubitCounterDependsOnColorManager(
    this._counterCubit,
    this._colorCubit,
  ) {
    _colorCubit.stream.listen((colorState) {
      backgroundColor.value = colorState.color;
      notifyListeners();
    });
  }

  /// Returns the current counter value from the Cubit state.
  @override
  int get currentCounter => _counterCubit.state.counter;

  /// Calls the method to change the counter in Cubit.
  @override
  void changeCounter() => _counterCubit.changeCounter();

  /// Calls the method to change the background color in Cubit.
  @override
  void changeColor() => _colorCubit.changeColor();
}
