import 'package:flutter/material.dart';
import '../../core/app_constants/app_constants.dart';

/// 🆕 `AppFloatingActionButton` ensures consistent styling for all FABs in the app.
class AppFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String heroTag;
  final Color? color;

  const AppFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.heroTag,
    this.color = AppConstants.darkPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      foregroundColor: AppConstants.darkForegroundColor,
      backgroundColor: color,
      child: Icon(icon),
    );
  }
}
