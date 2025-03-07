# 📦 Using HydratedBloc for State Persistence

## 🛠️ Setting Up HydratedStorage

```dart
HydratedBloc.storage = await HydratedStorage.build(
  storageDirectory: kIsWeb
      ? HydratedStorageDirectory.web
      : HydratedStorageDirectory((await getTemporaryDirectory()).path),
);
```

- On **web**, `HydratedStorageDirectory.web` uses `localStorage`.
- On **mobile/desktop**, `HydratedStorageDirectory` can be configured to use a specific directory.
- Prefer `getApplicationDocumentsDirectory()` over `getTemporaryDirectory()` for persistent data storage.

## 🔄 Custom Storage for Individual BLoC/Cubit

As of **version 10.0.0**, `HydratedBloc` and `HydratedCubit` allow custom storage for each instance individually. This is useful when you need **separate storage strategies** for different parts of your app.

### 🆕 Example: Using Custom Storage in a Cubit

```dart
class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(initialState, storage: CustomStorage());
  ...
}
```

## 🧠 When to Use Custom Storage

- **Encrypted Storage**: For sensitive data, implement a custom `Storage` with encryption.
- **Separate Caches**: Use different storage backends for **cache** vs **app settings**.
- **Web & Mobile Differentiation**: Use specific storage types for web (`localStorage`) vs native platforms (`SQLite`, `Files`).

## ⚙️ Best Practices

1. **Initialize Early**: Set up `HydratedStorage` at the app's start (`main()` function).
2. **Handle Errors**: Implement error handling for read/write operations.
3. **Clear Storage**: Use `HydratedBloc.storage.clear()` during logout or data reset scenarios.
4. **Custom Serializers**: Implement `fromJson` and `toJson` carefully to avoid serialization issues.

## 🚀 Key Benefits

- **Automatic State Restoration**: Even after app termination.
- **Customizability**: Different BLoC/Cubit instances can have tailored storage solutions.
- **Cross-Platform Compatibility**: Consistent behavior on **web**, **iOS**, **Android**, and **desktop**.

