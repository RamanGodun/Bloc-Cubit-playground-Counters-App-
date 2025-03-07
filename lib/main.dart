import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/utils/core_config_export.dart';
import 'core/utils/cubits_and_blocs_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🌐 Initialize BLoC Observer for state management monitoring
  Bloc.observer = AppBlocObserver();

  // 💾 Initialize Hydrated BLoC storage for persisting state
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const AppWrapper());
}

/// 🏠 [AppWrapper] is the root widget of the application.
/// It dynamically selects between BLoC [AppSettingsOnBloc] and Cubit [AppSettingsOnCubit]
/// based on the [AppConfig] configuration.
class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// 🟦 BLoC Providers
        BlocProvider(create: (_) => AppSettingsOnBloc()),
        BlocProvider(create: (_) => CounterOnBloc()),
        BlocProvider(create: (_) => ColorOnBloc()),
        BlocProvider(
            create: (context) => CounterBlocWhichDependsOnColorBLoC(
                colorBloc: context.read<ColorOnBloc>())),
        BlocProvider(create: (_) => HydratedCounterBloc()),
        BlocProvider(create: (_) => CounterBlocWithTransformers()),

        /// 🟧 Cubit Providers
        BlocProvider(create: (_) => AppSettingsOnCubit()),
        BlocProvider(create: (_) => CounterOnCubit()),
        BlocProvider(create: (_) => ColorOnCubit()),
        BlocProvider(
            create: (context) => CounterCubitWhichDependsOnColorCubit(
                colorCubit: context.read<ColorOnCubit>())),
      ],
      child: const StateManagementWidget(),
    );
  }
}

/// 🎯 [StateManagementWidget] selects between Bloc and Cubit state management
class StateManagementWidget extends StatelessWidget {
  const StateManagementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConfig.isAppSettingsOnBlocStateShape
        ? BlocBuilder<AppSettingsOnBloc, AppSettingsOnBlocState>(
            builder: (context, state) {
              final isDarkMode = _getThemeMode(state);
              return MaterialAppWidget(isDarkMode: isDarkMode);
            },
          )
        : BlocBuilder<AppSettingsOnCubit, AppSettingsOnCubitState>(
            builder: (context, state) {
              final isDarkMode = _getThemeMode(state);
              return MaterialAppWidget(isDarkMode: isDarkMode);
            },
          );
  }

  /// 🧠 Extracts the theme mode from the state
  bool _getThemeMode(dynamic state) {
    return state.isUsingBlocForAppFeatures
        ? state.isDarkThemeForBloc
        : state.isDarkThemeForCubit;
  }
}

/// 📱 [MaterialAppWidget] builds the MaterialApp with the selected theme and routing
class MaterialAppWidget extends StatelessWidget {
  final bool isDarkMode;

  const MaterialAppWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

// TODO 1: 🧠 Introduce BLoC Middleware (Interceptors)
// - [ ] Develop Middleware that can intercept and modify events before they are processed by the BLoC or Cubit.
// - [ ] Create an example Middleware that logs every event and applies transformation (e.g., mapping, filtering).
// - [ ] Add automated tests to validate Middleware behavior in different scenarios.

// TODO 2: 🚀 Optimize Performance with Lazy Loading

// TODO 3: 🎨 Improve App Styling and Polish UI Design
// - [ ] Refine the color scheme and typography for better readability and aesthetics.
// - [ ] Use `Hero` animations to enhance transitions.
// - [ ] Implement `Adaptive Design` to ensure a seamless experience on both mobile and desktop platforms.
