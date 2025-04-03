/*
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

/// 🟢 Custom Event Transformer for various BLoC types.
EventTransformer<E> customEventTransformer<E>(Type blocType) {
  return switch (blocType) {
    SearchBloc _ =>
      restartable<E>(), // 🟢 Handles only the latest search query.
    ScrollBloc _ =>
      throttleDroppableCustom<E>(), // 🟢 Prevents excessive scroll requests.
    AuthBloc _ => droppable<
        E>(), // 🟢 Ignores new events if the previous is still processing.
    _ => sequential<E>(), // 🟢 Default: Processes events sequentially.
  };
}

/// 🕑 Debounce transformer for precise input handling (e.g., search input).
EventTransformer<E> debounceSequential<E>(
    {Duration duration = const Duration(milliseconds: 300)}) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

/// ⏱️ Custom throttle transformer, allowing only one event within a set duration.
EventTransformer<E> throttleDroppableCustom<E>(
    {Duration duration = const Duration(seconds: 1)}) {
  return (events, mapper) =>
      events.throttleTime(duration, trailing: false).switchMap(mapper);
}

/// ==================== 🔍 SearchBloc ====================

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchQueryChanged>(
      (event, emit) async {
        await Future.delayed(const Duration(milliseconds: 500));
        emit(SearchLoaded(const ["Result 1", "Result 2", "Result 3"]));
      },
      transformer: customEventTransformer<SearchQueryChanged>(SearchBloc),
    );
  }
}

sealed class SearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchQueryChanged extends SearchEvent {
  final String query;
  SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

sealed class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<String> results;
  SearchLoaded(this.results);

  @override
  List<Object?> get props => [results];
}

/// ==================== 📜 ScrollBloc ====================

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollInitial()) {
    on<LoadMoreItems>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 1));
        emit(ScrollLoaded(const ["Item 1", "Item 2", "Item 3"]));
      },
      transformer: customEventTransformer<LoadMoreItems>(ScrollBloc),
    );
  }
}

sealed class ScrollEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoadMoreItems extends ScrollEvent {}

sealed class ScrollState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ScrollInitial extends ScrollState {}

final class ScrollLoaded extends ScrollState {
  final List<String> items;
  ScrollLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

/// ==================== 🔐 AuthBloc ====================

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 2));
        emit(AuthLoggedIn("user_token_123"));
      },
      transformer: customEventTransformer<LoginEvent>(AuthBloc),
    );
  }
}

sealed class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoggedIn extends AuthState {
  final String token;
  AuthLoggedIn(this.token);

  @override
  List<Object?> get props => [token];
}

/// ==================== ⚙️ Custom Map Event Transformer ====================

EventTransformer<E> customMapEventTransformer<E>(Type blocType) {
  return switch (blocType) {
    SearchBloc _ => (events, mapper) => events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(mapper),
    ScrollBloc _ => (events, mapper) =>
        events.throttleTime(const Duration(seconds: 2)).switchMap(mapper),
    _ => (events, mapper) => events.asyncExpand(mapper),
  };
}

 */
