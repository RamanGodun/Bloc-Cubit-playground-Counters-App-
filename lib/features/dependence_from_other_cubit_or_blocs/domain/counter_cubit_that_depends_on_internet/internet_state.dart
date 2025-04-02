part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  final DateTime timestamp;
  const InternetState(this.timestamp);

  @override
  List<Object?> get props => [timestamp];
}

class InternetLoading extends InternetState {
  InternetLoading() : super(DateTime.now());
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected(this.connectionType) : super(DateTime.now());

  @override
  List<Object?> get props => [connectionType, timestamp];
}

class InternetDisconnected extends InternetState {
  InternetDisconnected() : super(DateTime.now());

  @override
  List<Object?> get props => [timestamp];
}
