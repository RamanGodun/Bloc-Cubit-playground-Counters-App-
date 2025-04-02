part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();
}

class InternetLoading extends InternetState {
  const InternetLoading();
  @override
  List<Object?> get props => [1];
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  final DateTime timestamp;

  const InternetConnected(this.connectionType, this.timestamp) : super();

  @override
  List<Object?> get props => [connectionType, timestamp];
}

class InternetDisconnected extends InternetState {
  const InternetDisconnected();

  @override
  List<Object?> get props => [0];
}
