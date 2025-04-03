/*
----------------------------------------------------------------------------------------------------
✅ Загальна стратегія для оптимізації стилів у Flutter:
----------------------------------------------------------------------------------------------------

! 1. Static const — для об'єктів, які відомі на етапі компіляції:
class AppStyles {
  static const TextStyle largeTextLight = TextStyle(fontSize: 24, color: Colors.black);
  static const TextStyle largeTextDark = TextStyle(fontSize: 24, color: Colors.white);
}
? Перевага: Створюється один раз і зберігається в пам'яті постійно. Мінімальне навантаження на Garbage Collector.

----------------------------------------------------------------------------------------------------

! 2. Static getter — для об'єктів, які не потребують аргументів:
class AppStyles {
  static final TextStyle largeText = TextStyle(
    fontSize: 24,
    color: Colors.blueAccent,
  );

  static TextStyle get largeTextWithPadding => largeText.copyWith(
    letterSpacing: 1.2,
  );
}
? Перевага: Створюється лише один раз при першому доступі і зберігається як static final.

----------------------------------------------------------------------------------------------------

! 3. Метод із мемоїзацією — для динамічних значень із аргументами:
class AppStyles {
  static TextStyle? _cachedTextStyle;
  static Brightness? _lastBrightness;

  static TextStyle getDynamicTextStyle(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (_cachedTextStyle == null || _lastBrightness != brightness) {
      _lastBrightness = brightness;
      _cachedTextStyle = TextStyle(
        fontSize: 24,
        color: brightness == Brightness.dark ? Colors.white : Colors.black,
      );
    }
    return _cachedTextStyle!;
  }
}
? Перевага: Уникає зайвих обчислень, оновлює стиль лише при зміні теми.

----------------------------------------------------------------------------------------------------

! 4. Комбінація getter-ів для різних тем:
class AppStyles {
  static const TextStyle largeTextLight = TextStyle(fontSize: 24, color: Colors.black);
  static const TextStyle largeTextDark = TextStyle(fontSize: 24, color: Colors.white);

  static TextStyle get largeText => ThemeData().brightness == Brightness.dark
      ? largeTextDark
      : largeTextLight;
}
? Перевага: Жодного зайвого створення об'єктів, лише доступ до вже існуючих.

----------------------------------------------------------------------------------------------------
!!!  ✅ Оптимальний підхід залежно від ситуації:
----------------------------------------------------------------------------------------------------



| Ситуація                                   | Підхід                  | Рекомендація                       |
|--------------------------------------------|-------------------------|------------------------------------|
| Незмінні значення (компіляція)             | static const            | Найпродуктивніший варіант          |
| Динамічне значення без аргументів          | static getter           | Викликається один раз              |
| Залежність від аргументів чи контексту     | метод + мемоїзація      | Уникає зайвих обчислень            |
| Різні варіанти для конкретних умов         | getter з static const   | Працює швидко і без дублювання     |


----------------------------------------------------------------------------------------------------

 ✅ Приклад для різних тем:
class AppStyles {
  static const TextStyle largeTextLight = TextStyle(fontSize: 24, color: Colors.black);
  static const TextStyle largeTextDark = TextStyle(fontSize: 24, color: Colors.white);

  Getter, який обирає стиль в залежності від теми
  static TextStyle get largeText {
    return ThemeData().brightness == Brightness.dark
        ? largeTextDark
        : largeTextLight;
  }
}

✅ Використання у віджеті:
Text(
  'Hello, Flutter!',
  style: AppStyles.largeText,
);

? При зміні теми достатньо викликати setState або StateNotifierProvider (якщо використовуєш Riverpod), і UI автоматично оновиться.

----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
 ! ✅ Висновок: Який підхід оптимальніший?
----------------------------------------------------------------------------------------------------

! 1. Для статичних значень: static const — найкращий варіант.
! 2. Для динамічних значень без аргументів: static getter — оптимально, якщо значення не залежить від контексту.
! 3. Для залежності від аргументів: метод із мемоїзацією, щоб зберігати результат і уникати зайвих обчислень.
! 4. Для варіантів значень (наприклад, темна/світла тема): комбінація static const з логікою у getter для вибору потрібного стилю.

? Якщо дотримуватися цих принципів, ти досягнеш максимальної продуктивності у Flutter-додатку!


 */
