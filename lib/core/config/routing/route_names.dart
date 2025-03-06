/// Centralized route name definitions for the application.
///
/// Using a static class for route names helps avoid typos and maintain
/// consistent navigation throughout the app [AppRoutes].
class RouteNames {
  static const String home = '/';
  static const String blocAccess = '/blocAccessPage';
  static const String blocAccessCounter = '/blocAccessPage/counter';
  static const String themePage = '/themePage';
  static const String counterPage = '/counterPage';
  static const String counterDependsOnColor = '/counterDependsOnColorPage';
  static const String counterEventTransformerDemo =
      '/counterWithEventTransformerHandling';
  static const String counterHydrated = '/counterOnHydratedBlocPage';
  static const String otherPage = '/counterPage/otherPage';
}
