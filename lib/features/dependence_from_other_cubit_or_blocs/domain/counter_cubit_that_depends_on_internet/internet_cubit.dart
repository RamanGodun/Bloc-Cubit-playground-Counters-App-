import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

enum ConnectionType { wifi, mobile, none }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;

  InternetCubit({required this.connectivity}) : super(const InternetLoading()) {
    _connectivitySubscription = connectivity.onConnectivityChanged.listen((
      resultList,
    ) {
      final result =
          resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      _mapConnectivityToState(result);
    });
  }

  void _mapConnectivityToState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        emit(const InternetConnected(ConnectionType.wifi));
        break;
      case ConnectivityResult.mobile:
        emit(const InternetConnected(ConnectionType.mobile));
        break;
      case ConnectivityResult.none:
        emit(const InternetDisconnected());
        break;
      default:
        emit(const InternetDisconnected());
    }
  }

  @override
  Future<void> close() async {
    await _connectivitySubscription.cancel();
    return super.close();
  }
}
