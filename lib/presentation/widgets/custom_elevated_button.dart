import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/config/app_constants.dart';
import 'text_widget.dart';

/// 🆕 `AppElevatedButton` з сучасним дизайном glassmorphism для iOS/macOS.
class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.largePadding,
        vertical: AppConstants.mediumPadding,
      ),
      child: ClipRRect(
        borderRadius: AppConstants.commonBorderRadius,
        child: Stack(
          children: [
            // 🌀 Glassmorphism background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppConstants.darkGlassButtonBackgroundColor
                            .withOpacity(0.2)
                        : Colors.white.withOpacity(0.6),
                    borderRadius: AppConstants.commonBorderRadius,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(-2, -2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ✨ Elevated Button з кастомним стилем
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent.withOpacity(0.1),
                  ),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: AppConstants.commonBorderRadius,
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all(
                    Colors.black.withOpacity(0.1),
                  ),
                  overlayColor: MaterialStateProperty.all(
                    Colors.white.withOpacity(0.1),
                  ),
                ),
                child: TextWidget(
                  label,
                  TextType.button,
                  color: isDarkMode
                      ? AppConstants.darkForegroundColor.withOpacity(0.6)
                      : AppConstants.lightForegroundColor.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
