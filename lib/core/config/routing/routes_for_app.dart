import 'package:flutter/material.dart';

/* Presentation Pages */
import '../../../features/counter/presentation/counter_page_.dart';
import '../../../features/counter_depends_on_color/presentation/counter_depends_on_color_page.dart';
import '../../../features/counter_on_hydrated_bloc/hydrated_counter_page.dart';
import '../../../presentation/pages/home_page.dart';
import '../../../presentation/pages/other_page.dart';

/* Routing */
import '../../../presentation/pages/theme_page.dart';
import 'route_names.dart';

/// [AppRoutes] manages all navigation within the app using [onGenerateRoute].
/// Provides a centralized approach to route management, ensuring type safety and modularity.
class AppRoutes {
  /// [onGenerateRoute] dynamically generates the route based on the provided [RouteSettings].
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _buildRoute(const HomePage());

      case RouteNames.themePage:
        return _buildRoute(const ThemePage());

      case RouteNames.counterPage:
        // return _buildRoute(const CounterPageAlt());
        return _buildRoute(const CounterPage());

      case RouteNames.otherPage:
        return _buildRoute(const OtherPage());

      case RouteNames.counterDependsOnColor:
        return _buildRoute(const CounterDependsOnColorPage());

      case RouteNames.counterHydrated:
        return _buildRoute(const CounterOnHydratedBlocPage());

      default:
        return _buildRoute(const HomePage());
    }
  }

  /// Builds a [MaterialPageRoute] for the provided [widget].
  static MaterialPageRoute _buildRoute(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
