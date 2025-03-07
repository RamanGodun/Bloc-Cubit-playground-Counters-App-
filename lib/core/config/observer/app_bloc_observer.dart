import 'package:flutter_bloc/flutter_bloc.dart';

/// 🌐 [AppBlocObserver] is a custom observer for monitoring the lifecycle of BLoC and Cubit instances.
/// It logs all significant lifecycle events with a clear and readable format, including:
/// - 🟢 Creation of BLoC/Cubit
/// - 📨 Added events
/// - 🔄 State changes
/// - ➡️ Transitions
/// - ❌ Errors
/// - 🔴 Disposal

class AppBlocObserver extends BlocObserver {
  /// 🕒 Adds a timestamp to log messages for precise debugging.
  String _timestamp() => DateTime.now().toIso8601String();

  /// 🟢 Called when a BLoC/Cubit is created.
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('🟢 [${_timestamp()}] onCreate -- ${bloc.runtimeType}');
  }

  /// 📨 Called when an event is added to a BLoC.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('📨 [${_timestamp()}] onEvent -- ${bloc.runtimeType}: $event');
  }

  /// 🔄 Called when there is a state change in a BLoC/Cubit.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('🔄 [${_timestamp()}] onChange -- ${bloc.runtimeType}: $change');
  }

  /// ➡️ Called when a BLoC processes a transition (event to state change).
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
        '➡️ [${_timestamp()}] onTransition -- ${bloc.runtimeType}: $transition');
  }

  /// ❌ Called when an error occurs in a BLoC/Cubit.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(
        '❌ [${_timestamp()}] onError -- ${bloc.runtimeType}: $error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  /// 🔴 Called when a BLoC/Cubit is closed and disposed.
  @override
  void onClose(BlocBase bloc) {
    print('🔴 [${_timestamp()}] onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
