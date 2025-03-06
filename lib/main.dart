import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

/* CORE */
import 'core/config/app_strings.dart';
import 'core/config/app_bloc_observer.dart';
import 'core/config/app_config.dart';
import 'core/config/routes_for_app.dart';

/* BLoCs */
import 'core/app_settings_managing/app_settings_on_bloc/app_settings_bloc.dart';

/* CUBITS */
import 'core/config/app_theme.dart';
import 'core/app_settings_managing/app_settings_on_cubit/app_settings_cubit.dart';
import 'features/counter/counter_on_bloc/counter_bloc.dart';
import 'features/counter/counter_on_cubit/counter_cubit.dart';

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

  runApp(
    MultiBlocProvider(
      providers: [
        /// 🟦 BLoC Providers
        BlocProvider(create: (_) => AppSettingsOnBloc()),
        BlocProvider(create: (_) => CounterOnBloc()),

        /// 🟧 Cubit Providers
        BlocProvider(create: (_) => AppSettingsOnCubit()),
        BlocProvider(create: (_) => CounterOnCubit()),
      ],
      child: const AppWrapper(),
    ),
  );
}

/// 🏠 [AppWrapper] is the root widget of the application.
/// It dynamically selects between BLoC [AppSettingsOnBloc] and Cubit [AppSettingsOnCubit]
/// based on the [AppConfig] configuration.
class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AppConfig.isAppSettingsOnBlocStateShape
        ? BlocBuilder<AppSettingsOnBloc, AppSettingsStateOnBloc>(
            builder: (context, state) {
              // 🎨 Determine the theme mode based on BLoC state
              final isDarkMode = state.isAppSettingsUsingBloc
                  ? state.isDarkThemeForBloc
                  : state.isDarkThemeForCubit;

              return _buildMaterialApp(isDarkMode);
            },
          )
        : BlocBuilder<AppSettingsOnCubit, AppSettingsStateOnCubit>(
            builder: (context, state) {
              // 🎨 Determine the theme mode based on Cubit state
              final isDarkMode = state.isAppSettingsUsingBloc
                  ? state.isDarkThemeForBloc
                  : state.isDarkThemeForCubit;

              return _buildMaterialApp(isDarkMode);
            },
          );
  }

  /// 🌈 Builds the [MaterialApp] with dynamic theming
  MaterialApp _buildMaterialApp(bool isDarkMode) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
