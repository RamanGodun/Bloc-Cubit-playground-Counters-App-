# 📌 Що таке Middleware?

**Middleware** (посередник) — це програмний компонент, який перехоплює потік даних або подій між різними частинами додатку, дозволяючи обробляти ці дані або змінювати їх перед тим, як вони досягнуть своєї кінцевої точки.

У контексті **Flutter** та **BLoC** це механізм, який дає змогу втручатися у процес відправки подій (`Event`) або змін стану (`State`), не змінюючи логіку самого `Bloc`.

---

## 📚 Порівняння Middleware з Перекладачем
Уяви, що Middleware — це перекладач, який стоїть між двома людьми, що розмовляють різними мовами. Коли одна людина щось каже (`Event`), перекладач може:
- Перевести (`Transform`) повідомлення.
- Перевірити, чи це коректне повідомлення (`Validation`).
- Відхилити повідомлення (`Reject`).
- Додати додаткові дані до повідомлення (`Enhance`).

---

## 🔍 Навіщо потрібен Middleware?

1. **Логування (Logging):** Слідкування за всіма подіями та станами у додатку.
2. **Аналітика (Analytics):** Надсилання даних у зовнішні сервіси (наприклад, Firebase Analytics).
3. **Обробка помилок (Error Handling):** Автоматичне показування сповіщень чи лоадерів при помилках.
4. **Автоматичний Loader:** Увімкнення та вимкнення лоадера при асинхронних діях.
5. **Аутентифікація (Authentication):** Перевірка, чи користувач авторизований для виконання певної події.

---

## 🛠 Як Middleware працює у BLoC?

### 1. Перехоплення подій (`Event`) перед обробкою
- Можна змінити подію або навіть відхилити її.

### 2. Перехоплення станів (`State`) перед відправкою у UI
- Наприклад, додати `isLoading` під час асинхронного виклику.

### 3. Реагування на виключення (`Exception`) у процесі обробки подій
- Можна автоматично обробляти помилки, не вносячи зміни у логіку `Bloc`.

---

## 🔧 Приклад Middleware для автоматичного лоадера

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_settings_cubit.dart';

class GlobalLoaderMiddleware<Event, State> extends BlocMiddleware<Event, State> {
  final AppSettingsCubit appSettingsCubit;

  GlobalLoaderMiddleware({required this.appSettingsCubit});

  @override
  void onEvent(Event event, Emitter<State> emit, Bloc<Event, State> bloc) {
    if (event is ShowLoaderEvent) {
      appSettingsCubit.startLoading();
    } else if (event is HideLoaderEvent) {
      appSettingsCubit.stopLoading();
    }
    super.onEvent(event, emit, bloc);
  }
}
```

---

## 💡 Реальні приклади використання Middleware

1. **Redux Middleware:** У `Redux` для Flutter (`flutter_redux`), Middleware використовується для обробки асинхронних дій (`Thunk`/`Saga`).
2. **Logger Middleware:** `BlocObserver` у BLoC фактично є прикладом Middleware, який логує всі події та стани.
3. **API Interceptor:** У `Dio` (HTTP клієнт) `Interceptor` діє як Middleware, який обробляє запити та відповіді.

---

## 🚀 Переваги Middleware

- **Чистий код:** Логіка `Loader`, `Logger` або `Error Handler` винесена з основного `Bloc`.
- **Повторне використання:** Один Middleware може працювати з багатьма `Bloc`.
- **Просте тестування:** Middleware можна тестувати окремо від основної логіки `Bloc`.

---

## 🎯 Висновок

1. **Middleware** — це потужний інструмент, який дозволяє контролювати потік подій та станів у додатку.
2. Він особливо корисний у великих додатках або коли потрібно централізовано обробляти події (`Loading`, `Error Handling`, `Analytics`).
3. У твоєму випадку Middleware дозволить автоматично показувати `Loader`, якщо будь-який `Bloc` переходить у `LoadingState`.

