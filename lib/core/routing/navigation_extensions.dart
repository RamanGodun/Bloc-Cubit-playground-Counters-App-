part of 'routes_for_app.dart';

extension NavigatorWithCubit on BuildContext {
Future<T?> pushWithCubit<T, C extends Cubit<Object?>>({
  required C cubit,
  required Widget child,
  bool keepAlive = false,
}) {
  return Navigator.of(this).push(
    MaterialPageRoute(
      builder: (_) => keepAlive
          ? BlocProvider<C>.value(value: cubit, child: child)
          : Builder(
              builder: (_) => BlocProvider(
                create: (_) => cubit,
                child: child,
              ),
            ),
    ),
  );
}

  Future<T?> replaceWithCubit<T, C extends Cubit<Object?>>({
    required C cubit,
    required Widget child,
  }) {
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider<C>.value(
          value: cubit,
          child: child,
        ),
      ),
    );
  }
}

extension RouteAccessNavigation on BuildContext {
  Future<void> goToMainRouteAccessPage(RouteAccessCounterCubit cubit) =>
      pushWithCubit(
        cubit: cubit,
        child: const MainPage4RouteAccessFeature(),
      );

  Future<void> goToOtherRouteAccessPage(RouteAccessCounterCubit cubit) =>
      pushWithCubit(
        cubit: cubit,
        child: const OtherPage4CubitRouteAccessFeature(),
      );

  Future<void> goToAnotherRouteAccessPage(RouteAccessCounterCubit cubit) =>
      pushWithCubit(
        cubit: cubit,
        child: const AnotherPage4CubitRouteAccessFeature(),
      );
}

/*
? USED this method in previous option
  /// 🌐 Builds a [MaterialPageRoute] with an existing [BlocProvider].
  /// Useful for pages that depend on an existing BLoC or Cubit instance.
  /// It ensures the current state is maintained and prevents unnecessary rebuilds.
  static MaterialPageRoute
      _buildRouteWithBlocProvider<T extends Cubit<Object?>>({
    required T Function(BuildContext context) contextBuilder,
    required Widget child,
  }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: contextBuilder(context),
        child: child,
      ),
    );
  }
*/
