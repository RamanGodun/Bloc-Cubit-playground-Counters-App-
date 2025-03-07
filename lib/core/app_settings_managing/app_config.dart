/// 🌐 **[AppSettingsStateManagement]** - Defines the state management approach used across the app.
/// Provides an easy toggle between **BLoC** and **Cubit** state management.
enum AppSettingsStateManagement {
  onBloc, // 🟢 Use BLoC for state management
  onCubit // 🔵 Use Cubit for state management
}

/// 📦 **[AppConfig]** - Holds global configuration settings for the application.
/// Centralizes state management strategy and exposes utility methods for easy access.
class AppConfig {
  /// 🛠️ Defines the **default state management approach** for the app.
  static const AppSettingsStateManagement stateManagement =
      AppSettingsStateManagement
          .onCubit; // ! Change this to switch between [AppSettingsStateManagement.onBloc] and [AppSettingsStateManagement.onCubit]

  /// ✅ **Utility getter** to check if the app is using **BLoC** for state management.
  /// Returns **true** if [AppSettingsStateManagement.onBloc] is active, otherwise **false**.
  static bool get isAppSettingsOnBlocStateShape =>
      stateManagement == AppSettingsStateManagement.onBloc;
}
