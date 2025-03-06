import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/app_settings_managing/app_config.dart';
import 'core/config/app_bloc_observer.dart';
import 'core/config/app_strings.dart';
import 'core/config/routing/routes_for_app.dart';
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

        /// 🟧 Cubit Providers
        BlocProvider(create: (_) => AppSettingsOnCubit()),
        BlocProvider(create: (_) => CounterOnCubit()),
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
