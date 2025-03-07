# BLoC vs Cubit Playground

## 📌 Project Overview

This project is an advanced **educational Flutter application** designed as a **playground** for mastering and documenting **BLoC and Cubit state management** techniques. It serves as a comprehensive **knowledge hub** for **Flutter developers** to explore state management **in-depth** while maintaining **clean architecture** and best coding practices.

---

## 🎯 Key Objectives

- **Comprehensive BLoC & Cubit Playground** – Aimed at demonstrating the wide spectrum of BLoC and Cubit features and use cases.
- **Seamless State Management Switching** – Dynamic runtime switching between BLoC and Cubit without restarting the app for features, while `AppSettings` state management is set manually via `AppConfig`.
- **Cross-State Dependencies** – Implementing advanced scenarios where one state affects another (e.g., color state influencing counter state).
- **Modular Design & Clean Code Principles** – Follows **SOLID**, **KISS**, **DRY**, and **Clean Architecture** principles.
- **Real-World Scenarios**:
  - Dependency between BLoC/Cubit instances.
  - Cross-dependencies, e.g., Cubit reacting to BLoC changes.
  - **Hydrated BLoC** for state persistence.
  - **Event Transformers** for custom event handling.
  - **Advanced Routing** using named routes and **dynamic state access**.
  - Utilizes **Factory Pattern** for flexible state manager creation.

---

## 🏗️ Project Structure

### 🌐 Core

The **Core** module is organized into clearly defined sub-modules, each responsible for a specific aspect of the application's architecture:

- **AppConstants** (`core/app_constants/`)

  - **app_constants.dart:** Contains all reusable constants (e.g., padding, colors).
  - **app_strings.dart:** Manages all static strings used in the app to support maintainability and localization.

- **State Management** (`core/app_settings_state_management/`)

  - **BLoC State Management:** (`app_settings_on_bloc/`)

    - `app_settings_bloc.dart`, `app_settings_event.dart`, `app_settings_state.dart`: Provide global app settings and handle the state management mode using BLoC.

  - **Cubit State Management:** (`app_settings_on_cubit/`)
    - `app_settings_cubit.dart`, `app_settings_state.dart`: Manage app settings using the Cubit state management approach.

- **Config** (`core/config/`)

  - **Observer:** (`observer/`)
    - `app_bloc_observer.dart`: Custom observer for monitoring and logging BLoC and Cubit state transitions.
  - **AppConfig:** (`config/`)
    - `app_config.dart`: Determines which `AppSettings` state management mode (`BLoC` or `Cubit`) is set manually

- **Exports** (`core/exports/`)

  - **cubits_and_blocs_exports.dart:** Centralized export file for all Cubits and BLoCs.
  - **core_config_export.dart:** Simplifies imports for configuration files, constants, and utilities.

- **Routing** (`core/routing/`)

  - **Route Management:**
    - `route_names.dart`: Defines all route names as constants to avoid hardcoded strings.
    - `routes_for_app.dart`: Manages `onGenerateRoute` logic, ensuring safe and modular navigation.

- **Theming** (`core/theming/`)

  - **App Theme:**
    - `app_theme.dart`: Defines light and dark themes.
    - `text_styles.dart`: Provides consistent text styling throughout the application.

- **Utilities** (`core/utilities/`)

  - **Helpers:** (`helpers.dart`) Provides utility functions for theme management, navigation, and context-based operations.
  - **DialogService:** (`show_dialog.dart`) Centralizes dialog management with custom styling and behavior.

---

### 🧩 Features

- **Basic Counter** (`features/counter/`)

  - Demonstrates both BLoC and Cubit patterns.

- **Counter Depending on Color** (`features/counter_depends_on_color/`)

  - Counter behavior is influenced by the active color state.

- **Event Transformers Counter** (`features/events_transformer/`)

  - Advanced event handling with **droppable()** and **restartable()** transformers.

- **Hydrated Counter** (`features/counter_on_hydrated_bloc/`)

  - Implements persistent state management using **HydratedBloc**.

- **Routing-Based Counter State** (`features/cubit_access/`)
  - Demonstrates state access through **onGenerateRoute** and **dynamic state passing** between screens.

### 🎨 Presentation

- **Common Widgets** (`presentation/widgets/`)

  - Consistent styling with reusable components.

- **Global Pages** (`presentation/pages/`)
  - Shared screens like `HomePage`, `ThemePage`, `OtherPage`.

---

## 🚀 Features & Highlights

1. **State Management Flexibility**

   - Dynamic switching between BLoC and Cubit state for app features.
   - Factory Pattern for dynamic state management.

2. **Advanced Counter Implementations**

   - Standard Counter, Color-Dependent Counter, Hydrated Counter, Event Transformers Counter, Counter with state that was obtained via route.

3. **Cross-Feature Dependencies**

   - Complex state interactions using **StreamSubscriptions** and **Event Handlers**.

4. **Navigation & State Passing**

   - **onGenerateRoute** for dynamic state access and navigation.

---

## 📌 Tech Stack

- **Flutter** (Material Design 3)
- **Dart**
- **flutter_bloc** (BLoC & Cubit)
- **HydratedBloc** for state persistence
- **Event Transformers** from **bloc_concurrency**
- **Factory Pattern** and **Modular Architecture**

---

## 🛠️ Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/RamanGodun/BLoC-vs-CUBIT-playground-app
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

---

## 📖 Learning Outcomes

- ✅ Master advanced BLoC & Cubit usage scenarios.
- ✅ Implement **cross-feature dependencies**.
- ✅ Utilize the **Factory Pattern** for dynamic state management.
- ✅ Explore **HydratedBloc** for persistent state management.
- ✅ Experiment with **Event Transformers**.
- ✅ Adhere to **clean architecture principles**.

---

## 🔍 License

This project is licensed under the [MIT License](LICENSE).
