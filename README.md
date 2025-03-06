# BLoC vs Cubit Playground

## 📌 Project Overview

This project is an advanced **educational Flutter application** designed as a **playground** for mastering and documenting **BLoC and Cubit state management** techniques. It serves as a comprehensive **knowledge hub** for **middle+ Flutter developers** to explore state management **in-depth** while maintaining **clean architecture** and best coding practices.

---

## 🎯 Key Objectives

- **Comprehensive BLoC & Cubit Playground** – Aimed at demonstrating the full spectrum of BLoC and Cubit features and use cases.
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

- **AppSettingsManagement** (`core/app_settings_managing/`)

  - Manages global app settings and state management mode (BLoC or Cubit) via `AppConfig`.
  - **AppSettingsOnBloc** and **AppSettingsOnCubit** control theme and app-wide state management.
  - Provides `isUsingBlocForAppFeatures` to dynamically switch feature state management in real-time.

- **Configuration** (`core/config/`)

  - **AppConfig:** Determines `AppSettings` state management mode (BLoC or Cubit).
  - **AppConstants:** Centralized app constants.
  - **AppStrings:** Manages all static text strings.
  - **RouteNames:** Defines app routes.
  - **AppTheme & TextStyles:** Control light/dark themes and typography.
  - **AppBlocObserver:** Monitors state changes and logs app behavior.

- **Utilities** (`core/utils/`)

  - **Helpers:** Common utility methods for navigation and theme access.
  - **DialogService:** Provides reusable alert dialogs.

- **Documentation** (`core/info_bloc_cubit/`)
  - Contains educational resources on **BLoC and Cubit lifecycles**, **Event Transformation**, and **RxDart**.

### 🧩 Features

- **Basic Counter** (`features/counter/`)

  - Implements a standard counter using both BLoC and Cubit patterns.
  - Uses `Factory Pattern` to switch between BLoC and Cubit dynamically.

- **Counter Depending on Color** (`features/counter_depends_on_color/`)

  - The counter's increment/decrement size changes dynamically based on the active color.

- **Event Transformers Counter** (`features/events_transformer/`)

  - Demonstrates advanced event handling with **droppable()** and **restartable()** transformers.

- **Hydrated Counter** (`features/counter_on_hydrated_bloc/`)

  - Implements persistent state management using **HydratedBloc**.

- **Routing-Based Counter State** (`features/cubit_bloc_access/`)
  - Demonstrates state access through **onGenerateRoute** and **dynamic state passing** between screens.

### 🎨 Presentation

- **Common Widgets** (`presentation/widgets/`)

  - `AppElevatedButton`, `TextWidget`, `AppFloatingActionButton` for consistent styling.

- **Global Pages** (`presentation/pages/`)
  - Shared screens like `HomePage`, `ThemePage`, `OtherPage`, providing navigation and setting options.

---

## 🚀 Features & Highlights

### 1️⃣ **State Management Flexibility**

- **Dynamic State Switching:** Switch between BLoC and Cubit seamlessly at runtime for features.
- **Multi-State Management:** Supports **global** and **feature-specific** state management using the **Factory Pattern**.
- **Manual AppSettings Management:** The `AppSettings` state management is set manually in `AppConfig` and is not dynamically switched at runtime.

### 2️⃣ **Advanced Counter Implementations**

- **Standard Counter:** Demonstrates both BLoC and Cubit implementations.
- **Color-Dependent Counter:** The counter's value changes dynamically based on the selected color.
- **Hydrated Counter:** Utilizes `HydratedBloc` for **persistent state management**.
- **Counter with Event Transformers:** Showcases **droppable** and **restartable** event transformers for **fine-tuned event handling**.

### 3️⃣ **Cross-Feature Dependencies**

- Demonstrates how one BLoC or Cubit can **depend on another**, using **StreamSubscriptions** and **Event Handlers**.
- Realizes **complex state interactions**, such as a counter reacting to color changes via **Stream**.

### 4️⃣ **Navigation & State Passing**

- Uses **onGenerateRoute** to handle **navigation with state access**.
- Allows **passing state objects between pages** without rebuilding the entire widget tree.

### 5️⃣ **Educational Resources**

- Includes detailed **documentation** on the **BLoC and Cubit lifecycles**, **RxDart usage**, and **event transformation techniques**.
- Provides practical examples of **RxDart operators** (`debounce`, `throttle`, `switchMap`) and their **bloc_concurrency** equivalents.

---

## 📌 Tech Stack

- **Flutter** (Material Design 3)
- **Dart**
- **flutter_bloc** (BLoC & Cubit)
- **HydratedBloc** for state persistence
- **RxDart** for **reactive programming**
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

By exploring this project, you will:

- ✅ Master advanced BLoC & Cubit usage scenarios.
- ✅ Understand how to implement **cross-feature dependencies**.
- ✅ Utilize the **Factory Pattern** for dynamic state management.
- ✅ Explore **HydratedBloc** for persistent state management.
- ✅ Experiment with **Event Transformers** for optimized event handling.
- ✅ Follow **clean architecture principles** and ensure **code consistency**.

---

## 🔍 Proposed Enhancements

1. **Separate Logical Unit for Theme Management:** Create a dedicated BLoC or Cubit for managing theme state to simplify the `AppSettings` logic.
2. **Reduce Logic in `AppWrapper`:** Extract theme selection and state management logic into smaller, reusable widgets.
3. **Cache Themes with HydratedCubit/BLoC:** Ensure that theme states are persistently stored and restored upon app restart.

---

## 🔍 License

This project is licensed under the [MIT License](LICENSE).
