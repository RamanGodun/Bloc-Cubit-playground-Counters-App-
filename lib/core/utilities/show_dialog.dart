import 'package:flutter/material.dart';

import '../../presentation/widgets/text_widget.dart';
import '../app_constants/app_constants.dart';
import '../app_constants/app_strings.dart';
import 'helpers.dart';

/// 💬 [DialogService] provides a streamlined method to display alert dialogs in the app.
/// It ensures consistent styling and behavior across all alert dialogs.

abstract class DialogService {
  /// ⚠️ Displays a centered alert dialog with the given [text].

  static void showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height *
                AppConstants.dialogMaxHeightRatio,
          ),
          child: Center(
            child: TextWidget(
              text,
              TextType.button,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Center(
              child: TextWidget(
                AppStrings.okButton,
                TextType.titleMedium,
                color: Helpers.getColorScheme(context).primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
