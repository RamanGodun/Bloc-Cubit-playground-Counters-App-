import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/counter/presentation/counter_page_.dart';
import '../../features/counter_depends_on_color/presentation/counter_depends_on_color_page.dart';
import '../../features/counter_on_hydrated_bloc/hydrated_counter_page.dart';
import '../../features/cubit_access/_home_page_4_route_cubit_access.dart';
import '../../features/cubit_access/_main_page_4_route_cubit_access.dart';
import '../../features/cubit_access/another_page.dart';
import '../../features/cubit_access/other_page.dart';
import '../../features/events_transformer/counter_with_events_transformer_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/other_page.dart';
import '../../presentation/pages/theme_page.dart';
import '../exports/cubits_and_blocs_exports.dart';
import 'route_names.dart';

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

      case RouteNames.counterDependsOnColor:
        return _buildRoute(const CounterDependsOnColorPage());

      case RouteNames.counterHydrated:
        return _buildRoute(const CounterOnHydratedBlocPage());

      case RouteNames.blocAccess:
        return _buildRoute(const HomePage4RouteAccessFeature());

      /// For route access feature
      case RouteNames.routeAccessHome:
        return _buildRouteWithBlocProvider<RouteAccessCounterCubit>(
          contextBuilder: (context) =>
              BlocProvider.of<RouteAccessCounterCubit>(context),
          child: const HomePage4RouteAccessFeature(),
        );
      case RouteNames.cubitAccessMainPage:
        return _buildRouteWithBlocProvider<RouteAccessCounterCubit>(
          contextBuilder: (context) =>
              BlocProvider.of<RouteAccessCounterCubit>(context),
          child: const MainPage4RouteAccessFeature(),
        );
      case RouteNames.routeAccessOtherPage:
        return _buildRouteWithBlocProvider<RouteAccessCounterCubit>(
          contextBuilder: (context) =>
              BlocProvider.of<RouteAccessCounterCubit>(context),
          child: const OtherPage4CubitRouteAccessFeature(),
        );
      case RouteNames.routeAccessAnotherPage:
        return _buildRouteWithBlocProvider<RouteAccessCounterCubit>(
          contextBuilder: (context) =>
              BlocProvider.of<RouteAccessCounterCubit>(context),
          child: const AnotherPage4CubitRouteAccessFeature(),
        );

      ///
      case RouteNames.counterEventTransformerDemo:
        return _buildRoute(const CounterWithEventTransformerHandling());

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
}
