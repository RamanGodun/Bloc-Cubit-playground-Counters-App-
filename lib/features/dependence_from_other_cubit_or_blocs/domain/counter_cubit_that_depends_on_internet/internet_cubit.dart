import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

enum ConnectionType { wifi, mobile, none }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit({required this.connectivity}) : super(const InternetLoading()) {
    print('🟢 [Init] InternetCubit created');
    _subscription =
        connectivity.onConnectivityChanged.listen(_mapConnectivityToState);
  }

  void _mapConnectivityToState(List<ConnectivityResult> results) {
    print('[InternetCubit] ↪️ Connectivity changed: $results');
    final newState = () {
      if (results.contains(ConnectivityResult.wifi)) {
        return InternetConnected(ConnectionType.wifi, DateTime.now());
      } else if (results.contains(ConnectivityResult.mobile)) {
        return InternetConnected(ConnectionType.mobile, DateTime.now());
      } else {
        return const InternetDisconnected();
      }
    }();
    if (state != newState) {
      emit(newState);
      print('[InternetCubit] 📡 Changed to: $newState');
    } else {
      print('[InternetCubit] ❌ No change, same state');
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
