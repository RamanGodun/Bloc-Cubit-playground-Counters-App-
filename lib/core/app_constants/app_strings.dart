/// 🌐 [AppStrings] holds all the static text used in the application.
abstract class AppStrings {
  // 🏠 App Titles
  static const String appBarTitleForContextAccessPage =
      'State access via routing';
  static const String appIsOnBloc = 'App is on BLoC now';
  static const String appIsOnCubit = 'App is on Cubit now';
  static const String appTitle = 'BLoC & Cubit';
  static const String blocAccessPageTitle = 'State Access Page';
  static const String counterPageTitleOnBloc = 'Counter is on Bloc now';
  static const String counterPageTitleOnCubit = 'Counter is on Cubit now';
  static const String hydratedCounterPageTitle = 'Hydrated Counter Page';
  static const String otherPageTitle = 'Other page';
  static const String themeScreenTitle = 'Theme Screen';

  // 🔢 Counter
  static const String clearHeroTag = 'clear';
  static const String counterIs = 'Now Counter value is: ';
  static const String counterIz = 'Current counter value:  ';
  static const String counterSerOnPreviousPage =
      'Counter, set on previous page, is:';
  static const String currentValue = 'Current counter value is:';
  static const String decrementHeroTag = 'decrement';
  static const String hydratedBlocCounter = 'to Hydrated BLoC Counter';
  static const String incrementButton = 'Increment Counter';
  static const String incrementHeroTag = 'increment';
  static const String locallyCashedCounterIs =
      'Locally cashed counter value is:';
  static const String incrementCounterHeadline = 'Increment counter here';
  static const String incrementCounterSubtitle =
      'and will see value on next page';

  // 🚦 Navigation Buttons
  static const String eventTransformers = 'to Counter with events transformer';
  static const String eventTransformersDemo = 'Counter with events transformer';
  static const String goToCounterDependsOnColor =
      'to Counter that depends on Color';
  static const String goToCounterPage = 'to Counter';
  static const String hydratedBlocCounterButton =
      'to Hydrated BLoC Counter Page';
  static const String showCounterButton = 'Show Me Counter';
  static const String toStateAccessPage = 'to see the Counter value';

  // 🌈 Theme & Modes
  static const String changeColor = 'Change Color';
  static const String changeCounter = 'Change Counter';
  static const String darkMode = 'Dark';
  static const String lightMode = 'Light';
  static const String themeToggledTo = 'Theme toggled to ';
  static const String toggleThemeButton = 'Toggle Theme';

  // 📄 Other
  static const String okButton = 'OK';
  static const String otherPageBody = 'This is other page 🙋🏿🙋🏻‍♂️ ';
  static const String exploreFeatures = '🚀 Explore features ';
  static const String smashThoseButtons = '😎 smash those buttons!';

  // 🆕 Custom Header Texts
  static const String counterWithSideEffectsHeadline = 'This counter is with';
  static const String counterWithSideEffectsSubtitle = 'some side effects😉';

// 🆕 Dynamic Counter Text Method
  static String currentCounterValue(int counter) =>
      'Current counter value: $counter';
}
