import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/cubit_access/counter_cubit_for_route_access/route_access_cubit.dart';
import '../../presentation/pages/other_page.dart';
import '../../presentation/widgets/text_widget.dart';
import '../app_constants/app_constants.dart';
import '../app_constants/app_strings.dart';
import 'show_dialog.dart';

/// 🔧 [Helpers] provides utility methods for navigation, theming, and context-based operations.
/// This class centralizes common actions, promoting clean and maintainable code.
abstract class Helpers {
  /// 🚀 Pushes a new route to the navigation stack with a smooth transition.
  static Future<void> pushTo(BuildContext context, Widget child) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  /// 🧭 Navigates to a named route using the [routeName].
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 🎨 Retrieves the current [ThemeData] from the application context.
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// 📝 Returns the current [TextTheme] for consistent text styling.
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  /// 🌈 Fetches the [ColorScheme] from the app's theme.
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  /// 📣 Shows a styled snackbar.
  static void showStyledSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    final messenger = ScaffoldMessenger.of(context);
    // instant dismiss of any previous one
    messenger.hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
    messenger.showSnackBar(
      SnackBar(
        content: TextWidget(
          message,
          TextType.titleMedium,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        duration: duration,
        // behavior: SnackBarBehavior.floating,
        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12),
        // ),
      ),
    );
  }

  /// ⚠️ Handles side-effects when counter reaches specific values
  static void handleCounterSideEffects({
    required BuildContext context,
    required int counter,
  }) {
    // 📢 Show dialog at specific values
    if (counter == 1 || counter == 3) {
      DialogService.showAlertDialog(
        context,
        '${AppStrings.counterIs} $counter',
      );
    }
    // 🚦 Navigate to another page at specific negative values
    else if (counter == -1 || counter == -3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtherPage()),
      );
    }
    // 🍫 Show a SnackBar for specific counter values
    else if (counter == -4 || counter == -2 || counter == 2 || counter == 4) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextWidget(
            '${AppStrings.counterIz} $counter',
            TextType.titleMedium,
          ),
          duration: const Duration(seconds: 2),
          // behavior: SnackBarBehavior.floating,
          backgroundColor:
              AppConstants.secondaryColor4DarkTheme.withOpacity(0.5),
        ),
      );
    }
  }

  ///
  static void goToPageWithSharedCounterCubit(
    BuildContext context,
    String pageName,
  ) {
    final cubit = context.read<RouteAccessCounterCubit>();
    Navigator.of(context).pushNamed(
      pageName,
      arguments: cubit,
    );
  }

  ///
}
