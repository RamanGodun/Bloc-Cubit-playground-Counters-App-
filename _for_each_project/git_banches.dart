/*
! 🟢 Рекомендовані практики для іменування гілок

? ## 1. Формат іменування:
```bash
<type>/<scope>-<description>
```

📌 **Приклади:**
- `feat/auth-login-page` — Додавання функціоналу логіну.
- `fix/ui-button-margin` — Виправлення відступів у кнопки.
- `refactor/counter-manager` — Рефакторинг логіки керування лічильником.
- `chore/update-dependencies` — Оновлення залежностей.
- `docs/readme-update` — Оновлення документації.

---

? ## 2. Типи гілок:
- `feat/` — Нові функції.
- `fix/` — Виправлення багів.
- `refactor/` — Рефакторинг коду без зміни функціоналу.
- `test/` — Додавання або зміна тестів.
- `docs/` — Зміни в документації.
- `chore/` — Технічні завдання, налаштування оточення, оновлення залежностей.
- `hotfix/` — Термінові виправлення у продакшні.
- `experiment/` — Експериментальні гілки для нових ідей або POC (Proof of Concept).

---

? ## 3. Вітки для релізів:
```bash
release/v1.0.0
hotfix/v1.0.1
```

---

? ## 4. Вітки для стадій розробки:
Якщо потрібно розбити роботу на стадії, краще називати їх більш зрозуміло:
```bash
stage/initial-setup
stage/feature-implementation
stage/testing-and-fixes
```

---

? ## 5. Якщо все ж таки хочеться `stage-1`, `stage-2`, то краще додати контекст:
```bash
stage/1-setup
stage/2-authentication
stage/3-counters-feature
```

---

? ## 6. Завжди використовуй дефіси (`-`) замість пробілів або нижніх підкреслень (`_`):
```bash
feat/initial-setup
fix/button-alignment
```

---

? ## 7. Не використовуй довгі або незрозумілі назви:
❌ `feat/make-button-red-and-align-it-to-the-right-side-of-the-screen`
✅ `feat/button-red-align-right`

---

! ## 🚀 Оптимальний підхід:
```bash
git checkout -b feat/counter-implementation
git checkout -b fix/button-padding
git checkout -b refactor/state-management
```

Такий підхід значно покращить читабельність гілок, особливо якщо команда розробників зросте, або якщо ти будеш працювати над проєктом через тривалий час.



 */
