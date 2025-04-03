/// 🌐 Centralized route name definitions for the application.
///
/// The [RouteNames] class provides a single source of truth for all route names
/// used in the app. This approach helps maintain navigation consistency and
/// reduces the risk of typos when defining routes.
library;

class RouteNames {
  /// 🏠 Home screen
  static const String home = '/';

  /// 🌐 BLoC Access Page
  static const String blocAccess = '/blocAccessPage';

  /// 🎨 Theme selection page
  static const String themePage = '/themePage';

  /// ➕ Counter Page (Standard)
  static const String counterPage = '/counterPage';

  /// 🎨 Pages for feature of "Dependence from other Cubits/BLoCs"
  static const String counterDependsOnColor = '/counterDependsOnColorPage';

  /// 🔁 Counter with Event Transformer Handling
  static const String counterEventTransformerDemo =
      '/counterWithEventTransformerHandling';

  /// 💧 Counter with Hydrated BLoC
  static const String counterHydrated = '/counterOnHydratedBlocPage';

  /// 🚦 Navigation to "Other Page"
  static const String otherPage = '/counterPage/otherPage';

  /// 🚏 Pages for feature of "State Access (through routes)""
  static const String routeAccessHome = '/routeAccessHomePage';
  static const String routeAccessMainPage =
      '/routeAccessHomePage/routeAccessMainPage';
  static const String routeAccessOtherPage =
      '/routeAccess/routeAccessMainPage/otherPage';
  static const String routeAccessAnotherPage = '/routeAccess/main/anotherPage';
}
