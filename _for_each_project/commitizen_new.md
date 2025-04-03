### ✅ **Оновлений алгоритм налаштування Git, Commitizen, Husky та Lint-Staged для Flutter проєкту**

---

## **🔵 1. Ініціалізація Git та підключення до GitHub**

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin git@github.com:RamanGodun/RiverPod-Reminder.git
git branch -M main
git push -u origin main
```

> **💡 Переконайся, що GitHub репозиторій існує, інакше створи його вручну!**

---

## **💎 2. Встановлення Commitizen для стандартизованих комітів**

```bash
npm install -g commitizen
npm install --save-dev cz-conventional-changelog
```

> **💡 Переконайся**, що у `package.json` з’явився блок:

```json
"config": {
  "commitizen": {
    "path": "node_modules/cz-conventional-changelog"
  }
}
```

> **💡 Додай скрипт у `package.json`:**

```json
"scripts": {
  "commit": "cz"
}
```

---

## **🔶 3. Встановлення та налаштування Husky**

```bash
npm install husky --save-dev
npx husky-init && npm install
```

> **🔹 Ця команда автоматично створить `.husky/` папку та додасть `pre-commit` хук.**  
> **🔹 Тепер додаємо хуки:**

```bash
npx husky add .husky/pre-commit "npm run lint"
npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"
```

> **💡 Переконайся, що у `.husky/` з’явилися файли `pre-commit` та `commit-msg`.**

---

## **🛠️ 4. Встановлення та налаштування Lint-Staged**

```bash
npm install lint-staged --save-dev
```

> **💡 Додай у `package.json` (якщо немає):**

```json
"lint-staged": {
  "*.dart": [
    "dart format",
    "dart analyze"
  ]
}
```

---

## **🔵 5. Встановлення та налаштування Commitlint**

```bash
npm install --save-dev @commitlint/config-conventional @commitlint/cli
```

> **🔹 Створи або онови `commitlint.config.js` у корені проєкту:**

```bash
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js
```

> **💡 Додай у `package.json` (якщо немає):**

```json
"scripts": {
  "commitlint": "npx commitlint --from=HEAD~1 --to=HEAD"
}
```

---

## **🟢 6. Перевірка налаштувань та створення тестового коміту**

```bash
git add .
npm run commit
git push origin main
```

> **🚀 Все готово! Тепер Husky, Commitlint та Lint-staged працюватимуть коректно.**

---

## **🛠️ Виправлення можливих помилок**

### Якщо `npm run commit` не працює:

```bash
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### Якщо Husky не працює:

```bash
rm -rf .husky
npx husky install
npx husky add .husky/pre-commit "npm run lint"
npx husky add .husky/commit-msg "npx --no-install commitlint --edit $1"
```

### Якщо не створюються коректні коміти:

```bash
npm install --save-dev commitizen cz-conventional-changelog husky lint-staged @commitlint/cli @commitlint/config-conventional
```

> **💡 Використовуй `npm run commit` для створення комітів з правильним форматуванням!**
