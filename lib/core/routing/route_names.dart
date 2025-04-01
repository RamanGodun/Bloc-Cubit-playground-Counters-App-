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

  /// 🔢 Counter display on BLoC Access Page
  static const String blocAccessCounter = '/blocAccessPage/counter';

  /// 🎨 Theme selection page
  static const String themePage = '/themePage';

  /// ➕ Counter Page (Standard)
  static const String counterPage = '/counterPage';

  /// 🎨 Counter with Color Dependency
  static const String counterDependsOnColor = '/counterDependsOnColorPage';

  /// 🔁 Counter with Event Transformer Handling
  static const String counterEventTransformerDemo =
      '/counterWithEventTransformerHandling';

  /// 💧 Counter with Hydrated BLoC
  static const String counterHydrated = '/counterOnHydratedBlocPage';

  /// 🚦 Navigation to "Other Page"
  static const String otherPage = '/counterPage/otherPage';

  /// 🚏 Route Access Feature - Home
  static const String routeAccessHome = '/routeAccess';

  /// 🟥 Route Access Feature - Second Page
  static const String routeAccessSecond = '/routeAccess/second';

  /// 🟩 Route Access Feature - Third Page
  static const String routeAccessThird = '/routeAccess/third';
}
