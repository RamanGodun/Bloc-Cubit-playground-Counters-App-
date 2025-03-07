# 📌 1️⃣ Lifecycle and Operation of Cubit

## 1.1 How Does Cubit Work?

---

Cubit is a simplified version of BLoC that uses a **direct `emit()` method** to update the state. Its lifecycle looks like this:

### 1️⃣ **Initialization**

- `CubitProvider` or `Cubit()` creates a Cubit instance.
- The **constructor** is called, defining the `initialState`.

### 2️⃣ **UI Interaction**

- The UI triggers a method (e.g., `increment()`).
- The method calculates the **new state** and calls `emit(newState)`.

### 3️⃣ **Executing `emit()`**

- Cubit triggers `onChange(Change<T>)` before updating the state.
- `Change<T>` contains **current state (`currentState`) and new state (`nextState`)**.
- If `currentState == nextState`, then `emit()` is not called.

### 4️⃣ **UI Update**

- `BlocBuilder` or `BlocListener` receives the updated state and re-renders the UI.

### 5️⃣ **Closure (`close()`)**

- When Cubit is no longer needed, `close()` is called.
- The `state.stream` is closed, and memory is cleared.

---

# 📌 2️⃣ Lifecycle and Operation of BLoC

BLoC is a **reactive approach** that uses **events (Event) and streams (Stream)**.

## 2.1 How Does BLoC Work?

---

### 1️⃣ **Initialization**

- Created via `BlocProvider` or `Bloc()`.
- Calls the constructor `super(initialState)`.

### 2️⃣ **Adding an Event (`add(event)`)**

- UI calls `bloc.add(MyEvent())`.
- Triggers `onEvent()`, allowing event logging.

### 3️⃣ **Event Transformer (Event Stream Processing)**

- By default, BLoC **processes events sequentially**.
- You can use **RxDart** (`debounceTime`, `switchMap`) for **optimization**.

### 4️⃣ **Event Handler (`on<T>`)**

- The appropriate `on<T>` executes calculations and calls `emit(newState)`.
- **BLoC can emit multiple states in a row**.

### 5️⃣ **State Change (`emit(newState)`)**

- Triggers `onTransition()` containing `currentState → nextState`.

### 6️⃣ **Closure (`close()`)**

- The `state.stream` is closed, subscriptions are removed.
- `onClose()` is called to clear memory.

---

# 📌 ✅ 3️⃣ Event Transformation Modes and `bloc_concurrency`

`bloc_concurrency` is a library for **custom event processing** in BLoC. By default, all events are handled **sequentially**. You can change **processing modes** to improve performance.

## 🚀 `concurrent()` - Parallel Event Handling

- **When to use?**
  - When independent events need to be **processed simultaneously**.
  - Example: Loading **two API requests** without waiting for the first to finish.

```dart
on<MyEvent>(
  (event, emit) async {
    await Future.delayed(Duration(seconds: 2));
    emit(MyState(data: 'Updated'));
  },
  transformer: concurrent(),
);
```

## ⏱️ `sequential()` - Default Sequential Processing

- **When to use?**
  - When events **depend on each other** (e.g., saving state to a database).
  - Ensures the **correct execution order**.

```dart
on<MyEvent>(
  (event, emit) async {
    emit(MyState.loading());
    final data = await fetchData();
    emit(MyState.loaded(data));
  },
  transformer: sequential(),
);
```

## 🔄 `restartable()` - Discards Previous Event if a New One Arrives

- **When to use?**
  - **For search input** - only process the latest query.
  - **For live updates** - handle only current events.

```dart
on<SearchEvent>(
  (event, emit) async {
    final results = await api.search(event.query);
    emit(SearchState.loaded(results));
  },
  transformer: restartable(),
);
```

## 🚫 `droppable()` - Ignores New Event if the Previous One is Still Running

- **When to use?**
  - **Prevent duplicates** during rapid button clicks.
  - **For authentication** - ignore a new request if the first is not finished.

```dart
on<LoginEvent>(
  (event, emit) async {
    final user = await authService.login(event.username, event.password);
    emit(AuthState.loggedIn(user));
  },
  transformer: droppable(),
);
```

---

# 📌 Best Practices for BLoC & Cubit

### ✅ 1. Use `buildWhen` in `BlocBuilder`

```dart
BlocBuilder<MyBloc, MyState>(
  buildWhen: (previous, current) => previous.counter != current.counter,
  builder: (context, state) {
    return Text('${state.counter}');
  },
);
```

### ✅ 2. Use `BlocSelector` or `context.select` for Fine-grained State Selection

```dart
final counter = context.select<MyBloc, int>((bloc) => bloc.state.counter);
```

### ✅ 3. Prefer `StreamSubscription` over `BlocListener` for Side Effects

### ✅ 4. 🚫 Avoid Using setState with BLoC/Cubit

    •	Using setState conflicts with the reactive nature of BLoC and can cause unwanted UI rebuilds.
    •	Instead, rely on BlocBuilder, BlocSelector, or BlocListener.

### ✅ 5. 📉 Use debounceTime for Frequent Events

    •	Ideal for search inputs and scenarios where rapid event firing occurs.
    •	Prevents excessive state emissions and improves performance.

### ✅ 6. 🧹 Always Cancel StreamSubscriptions in BLoC

    •	Prevents memory leaks by ensuring all StreamSubscriptions are properly disposed of in the close() method.

### ✅ 7. ⚠️ Use emit Safely: Avoid Emitting When BLoC is Closed

    •	Before calling emit(), check if the BLoC is still active using isClosed.

### ✅ 8. 🛠 Use RepaintBoundary for Performance Optimization

    •	Wrap frequently updating widgets with RepaintBoundary to reduce unnecessary repaints of the entire widget tree.

### ✅ 9. 🧪 Test with blocTest for Predictable State Management

    •	Ensure consistent and reliable state transitions by thoroughly testing with blocTest.

### ✅ 10. 🧮 Maintain Immutability of State

    •	Always use immutable state classes (e.g., Freezed, Equatable) to avoid unintended side effects and ensure predictability.

# 📌 Summary

By adhering to these best practices and adopting advanced BLoC and Cubit patterns, you ensure a clean, maintainable, and highly performant Flutter application. Implementing **event transformation**, **safe emits**, **stream management**, and **fine-grained state selection** will significantly enhance both the performance and the developer experience.
