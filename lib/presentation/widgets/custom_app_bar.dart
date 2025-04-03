import 'package:flutter/material.dart';
import '../../core/utilities/helpers.dart';
import 'text_widget.dart';

/// 🎨 **[CustomAppBar]
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final List<IconData>? actionIcons;
  final List<VoidCallback>? actionCallbacks;
  final bool? isCenteredTitle;
  final bool? isNeedPaddingAfterActionIcon;
  final bool isTransparent;
  final Color? backgroundColor;
  final Color? titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actionIcons,
    this.actionCallbacks,
    this.isCenteredTitle,
    this.isNeedPaddingAfterActionIcon,
    this.isTransparent = false,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    if ((actionIcons?.length ?? 0) != (actionCallbacks?.length ?? 0)) {
      throw ArgumentError(
        'The icons length and  callbacks length must be equal !',
      );
    }
    final defaultBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final hasCustomBackgroundColor = backgroundColor != null;
    final colorScheme = Helpers.getColorScheme(context);

    ///
    return AppBar(
      backgroundColor: isTransparent
          ? Colors.transparent
          : hasCustomBackgroundColor
              ? backgroundColor
              : defaultBackgroundColor,
      centerTitle: isCenteredTitle ?? false,
      title: TextWidget(
        title,
        TextType.bodyLarge,
        color: titleColor,
        alignment:
            (isCenteredTitle == true) ? TextAlign.center : TextAlign.start,
      ),
      leading: leadingIcon != null
          ? IconButton(icon: Icon(leadingIcon), onPressed: onLeadingPressed)
          : null,
      actions: [
        if (actionIcons != null && actionCallbacks != null)
          for (int i = 0; i < actionIcons!.length; i++)
            IconButton(
              icon: Icon(actionIcons![i]),
              color: colorScheme.primary,
              onPressed: actionCallbacks![i],
            ),
        if ((actionIcons?.isNotEmpty ?? false) &&
            isNeedPaddingAfterActionIcon == true)
          const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
