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

- **AppSettingsManagement** (`core/app_settings_managing/`)

  - Manages global app settings and state management mode (BLoC or Cubit) via `AppConfig`.
  - Controls theme and app-wide state management.
  - Dynamically switches feature state management in real-time.

- **Configuration** (`core/config/`)

  - Centralized management of **AppConfig**, **Constants**, **Strings**, **Themes**, and **Routing**.

- **Utilities** (`core/utils/`)

  - **Helpers:** Common utility methods.
  - **DialogService:** Provides reusable showDialog.

- **Documentation** (`core/info/`)
  - Contains educational resources on **BLoC and Cubit lifecycles**, **Event Transformation**, and **RxDart**.

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

   - Dynamic switching between BLoC and Cubit.
   - Factory Pattern for dynamic state management.

2. **Advanced Counter Implementations**

   - Standard Counter, Color-Dependent Counter, Hydrated Counter, Event Transformers Counter.

3. **Cross-Feature Dependencies**

   - Complex state interactions using **StreamSubscriptions** and **Event Handlers**.

4. **Navigation & State Passing**

   - **onGenerateRoute** for dynamic state access and navigation.

5. **Educational Resources**
   - In-depth documentation on BLoC/Cubit lifecycles, **RxDart usage**, and event transformation techniques.

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

- ✅ Master advanced BLoC & Cubit usage scenarios.
- ✅ Implement **cross-feature dependencies**.
- ✅ Utilize the **Factory Pattern** for dynamic state management.
- ✅ Explore **HydratedBloc** for persistent state management.
- ✅ Experiment with **Event Transformers**.
- ✅ Adhere to **clean architecture principles**.

---

## 🔍 License

This project is licensed under the [MIT License](LICENSE).
