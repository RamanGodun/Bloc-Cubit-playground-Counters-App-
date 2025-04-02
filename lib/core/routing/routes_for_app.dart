import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* 🌐 Routing */
import 'route_names.dart';

/* 📦 State Management (through centralized barrel-файл) */
import '../exports/cubits_and_blocs_exports.dart';

/* 🎯 Pages — Feature-based групування */
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/other_page.dart';
import '../../presentation/pages/theme_page.dart';

import '../../features/counter/presentation/counter_page_.dart';
import '../../features/counter_on_hydrated_bloc/hydrated_counter_page.dart';
import '../../features/events_transformer/counter_with_events_transformer_page.dart';

import '../../features/dependence_from_other_cubit_or_blocs/presentation/counter_depends_on_color_page.dart';

import '../../features/cubit_access/presentation/_home_page_4_route_cubit_access.dart';
import '../../features/cubit_access/presentation/_main_page_4_route_cubit_access.dart';
import '../../features/cubit_access/presentation/another_page.dart';
import '../../features/cubit_access/presentation/other_page.dart';

/* 🧩 Extensions and Helpers */
part 'navigation_extensions.dart';

/// 🚦 [AppRoutes] provides a centralized navigation management for the app.
/// Uses [onGenerateRoute] to handle all navigation requests safely and efficiently,
/// ensuring type safety and modularity in routing.
class AppRoutes {
  /// 🛣️ [onGenerateRoute] dynamically generates the route based on [RouteSettings].
  /// This approach provides flexibility and reduces the risk of misrouting
  /// by avoiding hardcoded navigation strings scattered throughout the app.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _buildRoute(const HomePage());

      case RouteNames.themePage:
        return _buildRoute(const ThemePage());

      case RouteNames.counterPage:
        return _buildRoute(const CounterPage());

      case RouteNames.otherPage:
        return _buildRoute(const OtherPage());

      ///
      case RouteNames.counterDependsOnColor:
        return _buildRoute(const PageForCounterThatDependsOnColor());

      ///
      case RouteNames.counterHydrated:
        return _buildRoute(const CounterOnHydratedBlocPage());

      case RouteNames.blocAccess:
        return _buildRoute(const HomePage4RouteAccessFeature());

      case RouteNames.counterEventTransformerDemo:
        return _buildRoute(const CounterWithEventTransformerHandling());

      /// For cubit with route access feature:
      case RouteNames.routeAccessHome:
        return _buildRoute(const HomePage4RouteAccessFeature());

      /// ? when use alternative routing option next 3 cases are absent
      case RouteNames.routeAccessMainPage:
        final cubit = settings.arguments as RouteAccessCounterCubit;
        return _buildRouteWithCubit(cubit, const MainPage4RouteAccessFeature());

      case RouteNames.routeAccessOtherPage:
        final cubit = settings.arguments as RouteAccessCounterCubit;
        return _buildRouteWithCubit(
            cubit, const OtherPage4CubitRouteAccessFeature());

      case RouteNames.routeAccessAnotherPage:
        final cubit = settings.arguments as RouteAccessCounterCubit;
        return _buildRouteWithCubit(
            cubit, const AnotherPage4CubitRouteAccessFeature());

      ///
      default:
        return _buildRoute(const HomePage());
    }
  }

  /// 📦 Builds a standard [MaterialPageRoute] for the provided [widget].
  /// This method centralizes the route creation process and keeps the navigation
  /// logic clean and consistent across the application.
  static MaterialPageRoute _buildRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  /// ? when using alternative routing option next method isn't need any more
  /// 🌐 Builds a [MaterialPageRoute] with an injected cubit instance.
  /// This method is used when passing an existing Cubit instance via `settings.arguments`.
  static MaterialPageRoute _buildRouteWithCubit<T extends Cubit<Object?>>(
    T cubit,
    Widget child,
  ) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: child,
      ),
    );
  }

  ///

  ///
}
