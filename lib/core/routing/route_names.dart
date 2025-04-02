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

  /// 🎨 Dependence from other Cubits/BLoCs
  static const String dependenceFromBLoCs = '/dependenceFromBLoCs';
  static const String counterDependsOnColor =
      '/dependenceFromBLoCs/counterDependsOnColorPage';
  static const String counterThatDependsOnInternet =
      '/dependenceFromBLoCs/counterThatDependsOnInternet';
  static const String subPage1ForCounterThatDependsOnInternet =
      '/dependenceFromBLoCs/counterThatDependsOnInternet/subPage1ForCounterThatDependsOnInternet';
  static const String subPage2ForCounterThatDependsOnInternet =
      '/dependenceFromBLoCs/counterThatDependsOnInternet/subPage2ForCounterThatDependsOnInternet';

  /// 🔁 Counter with Event Transformer Handling
  static const String counterEventTransformerDemo =
      '/counterWithEventTransformerHandling';

  /// 💧 Counter with Hydrated BLoC
  static const String counterHydrated = '/counterOnHydratedBlocPage';

  /// 🚦 Navigation to "Other Page"
  static const String otherPage = '/counterPage/otherPage';

  /// 🚏 Route State Access Feature pages
  static const String routeAccessHome = '/routeAccess';
  static const String routeAccessMainPage = '/routeAccess/main';
  static const String routeAccessOtherPage = '/routeAccess/main/other';
  static const String routeAccessAnotherPage = '/routeAccess/main/another';
}
