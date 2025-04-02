part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object?> get props => [];
}

class InternetLoading extends InternetState {
  const InternetLoading();
}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  const InternetConnected(this.connectionType);

  @override
  List<Object?> get props => [connectionType];
}

class InternetDisconnected extends InternetState {
  const InternetDisconnected();
}
