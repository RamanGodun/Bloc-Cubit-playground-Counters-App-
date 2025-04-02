import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

enum ConnectionType { wifi, mobile, none }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final results = await connectivity.checkConnectivity();
    _mapConnectivityToState([results[0]]);

    _subscription = connectivity.onConnectivityChanged.listen(
      (results) {
        print('[DEBUG] Connectivity changed: $results');
        _mapConnectivityToState(results);
      },
    );
  }

  void _mapConnectivityToState(List<ConnectivityResult> results) {
    final newState = () {
      if (results.contains(ConnectivityResult.wifi)) {
        return InternetConnected(ConnectionType.wifi);
      } else if (results.contains(ConnectivityResult.mobile)) {
        return InternetConnected(ConnectionType.mobile);
      } else {
        return InternetDisconnected();
      }
    }();
    if (state.runtimeType != newState.runtimeType || state != newState) {
      emit(newState);
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
