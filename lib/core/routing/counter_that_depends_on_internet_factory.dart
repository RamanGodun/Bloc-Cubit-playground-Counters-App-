part of 'routes_for_app.dart';

/// 🏗 Factory for building pages that depend on InternetCubit and CounterThatDependsOnInternetCubit
class _CounterInternetPageFactory {
  static Widget buildMain(BuildContext context) {
    return _wrapWithProviders(
      context,
      const PageForCounterThatDependsOnInternet(),
    );
  }

  static Widget _wrapWithProviders(BuildContext context, Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider(
          create: (context) => CounterThatDependsOnInternetCubit(
            internetStream: context.read<InternetCubit>().stream,
          ),
        ),
      ],
      child: BlocProvider(
        create: (_) => UiSettingsCubit(context),
        child: child,
      ),
    );
  }
}
