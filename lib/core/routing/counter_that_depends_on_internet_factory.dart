part of 'routes_for_app.dart';

/// 🏗 Factory for building pages that depend on InternetCubit and CounterThatDependsOnInternetCubit
class _CounterInternetPageFactory {
  static Widget buildMain(BuildContext context) {
    return _wrapWithProviders(
      context,
      const PageForCounterThatDependsOnInternet(),
    );
  }

  static Widget _buildSubPage1(BuildContext context) {
    return _wrapWithProviders(
      context,
      const SubPage1ForCounterThatDependsOnInternet(),
    );
  }

  static Widget _buildSubPage2(BuildContext context) {
    return _wrapWithProviders(
      context,
      const SubPage2ForCounterThatDependsOnInternet(),
    );
  }

  static Widget _wrapWithProviders(BuildContext context, Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => InternetCubit(connectivity: Connectivity())),
        BlocProvider(create: (_) => CounterThatDependsOnInternetCubit()),
      ],
      child: BlocProvider(
        create: (_) => UiSettingsCubit(context),
        child: child,
      ),
    );
  }
}
