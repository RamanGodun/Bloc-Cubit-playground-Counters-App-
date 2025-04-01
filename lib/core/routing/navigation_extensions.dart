part of 'routes_for_app.dart';

/// ! Alternative option for routing for "route access feature"
/// when use it, then in [AppRoutes] 3 cases are absent
/// (for [RouteNames.routeAccessMainPage], [RouteNames.routeAccessOtherPage] and [RouteNames.routeAccessAnotherPage])
// ignore: unintended_html_in_doc_comment
/// ! within this option call methods must be changed to, for example: "onPressed: () => context.goToMainRouteAccessPage(context.read<RouteAccessCounterCubit>()),",
/// (not "onPressed: () => Helpers.goToPageWithSharedCounterCubit(context, RouteNames.routeAccessMainPage)")
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
